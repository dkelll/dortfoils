# CDP Browser Console Debugging

## Overview

`cdp-console.js` connects to a Chrome instance running with remote debugging enabled and streams console output to `/tmp/browser-console.log`. Kiro can read this file to assist with debugging without you needing to copy/paste from the browser.

## Setup

### 1. Launch Chrome with remote debugging

Use a temporary profile so your regular Chrome session is unaffected:

```bash
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome \
  --remote-debugging-port=9222 \
  --user-data-dir=/tmp/chrome-debug-profile \
  --incognito
```

> The `--user-data-dir` flag runs this as a completely separate Chrome instance. Your normal browser window stays open and unaffected.

### 2. Start the console capture script

```bash
cdp-console.js > /tmp/browser-console.log 2>&1 &
```

The script will:
- Connect to the first open page tab
- Enable runtime and log listeners
- Write all console output to `/tmp/browser-console.log`
- Clear the log each time it starts

### 3. Tell Kiro to read the console

Just ask — Kiro can read `/tmp/browser-console.log` directly from the terminal.

## Stopping

```bash
pkill -f cdp-console.js
```

## Notes

- Chrome must be launched with `--remote-debugging-port=9222` **before** the script runs
- The `/tmp/chrome-debug-profile` directory is ephemeral and can be deleted anytime
- If Chrome was already open without the flag, fully quit it first and relaunch with the command above
