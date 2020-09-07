# Keep your Chrome Dev Tools Debugger on top of all windows on OSX Catalina

Run:

```
function toppid() { ps -ef | grep $1 | grep -v grep | awk '{ if (NR == 1) print $2 }'  }
sudo cycript -p `toppid "Google Chrome.app"` keepDevToolsOnTop.cy
```


NOTE:

* Requires SIP be disabled
* [frida-cycript](https://github.com/nowsecure/frida-cycript/releases) installed


Checkout [my blog](https://bradbarrows.com/posts/chromeDevTools) for more information.


![An animated gif of the usage of these scripts](https://bradbarrows.com/static/ChromeDevToolsOnTop.gif)
