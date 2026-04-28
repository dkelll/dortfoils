#!/usr/bin/env node
const WebSocket = require('ws');
const http = require('http');

const LOG_FILE = '/tmp/browser-console.log';
const fs = require('fs');

// Clear log on start
fs.writeFileSync(LOG_FILE, '');

const log = (line) => {
  const entry = line + '\n';
  process.stdout.write(entry);
  fs.appendFileSync(LOG_FILE, entry);
};

http.get('http://localhost:9222/json', res => {
  let data = '';
  res.on('data', d => data += d);
  res.on('end', () => {
    const tab = JSON.parse(data).find(t => t.type === 'page');
    if (!tab) return console.error('No page tab found');

    const ws = new WebSocket(tab.webSocketDebuggerUrl);
    ws.on('open', () => {
      ws.send(JSON.stringify({ id: 1, method: 'Runtime.enable' }));
      ws.send(JSON.stringify({ id: 2, method: 'Log.enable' }));
      log(`Connected to: ${tab.url}`);
    });

    ws.on('message', raw => {
      const msg = JSON.parse(raw);
      if (msg.method === 'Runtime.consoleAPICalled') {
        const args = msg.params.args.map(a => a.value ?? a.description ?? a.type).join(' ');
        log(`[${msg.params.type.toUpperCase()}] ${args}`);
      } else if (msg.method === 'Log.entryAdded') {
        const e = msg.params.entry;
        log(`[${e.level.toUpperCase()}] ${e.text}`);
      }
    });

    ws.on('close', () => log('[INFO] Connection closed'));
    ws.on('error', err => log(`[ERROR] ${err.message}`));
  });
}).on('error', err => {
  console.error(`Failed to connect to Chrome: ${err.message}`);
  process.exit(1);
});
