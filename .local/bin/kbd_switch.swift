import Carbon
import Foundation

let args = CommandLine.arguments
guard args.count > 1 else { exit(1) }
let target = args[1]

let sources = TISCreateInputSourceList(nil, false).takeRetainedValue() as! [TISInputSource]
for s in sources {
    let id = Unmanaged<CFString>.fromOpaque(TISGetInputSourceProperty(s, kTISPropertyInputSourceID)!).takeUnretainedValue() as String
    if id == target {
        TISSelectInputSource(s)
        exit(0)
    }
}
exit(1)
