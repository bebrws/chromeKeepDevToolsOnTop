// A quick script to get your Chrome Developer Tools Debugger Window to stay on top of ALL windows on OSX
// Requires SIP be disabled. Frida installed. frida-cycript installed.
// I have frida-cycript aliased to cycript
// To start cycript:
// function toppid() { ps -ef | grep $1 | grep -v grep | awk '{ if (NR == 1) print $2 }'  }
// sudo cycript -p `toppid "Google Chrome.app"` getDevToolsOffTheTop.cy
// 
// Run the following in cycript:
var ws=[];
ObjC.choose(ObjC.classes.NSWindow, {
    onMatch: function (aarg) {
        ws.push(aarg);
    },      
    onComplete: function () {    
        console.log('Done searching for NSWindows');    
    }      
});  

var possibleWindows = ws.filter((w) => w.className().toString() === "NativeWidgetMacNSWindow")
var devToolWindows = possibleWindows.filter((w) => w.title().toString().includes("DevTools"))
devToolWindows.forEach((w) => {
    w.setLevel_(0);
});

