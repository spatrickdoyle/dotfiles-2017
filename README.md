# dotfiles
My desktop config files<br/><br/>
![recent screenshot](http://www.spatrickdoyle.com/img/scrot2.png)<br/>
Dependencies:<br/>
```
i3-gaps
nitrogen
xcompmgr
lemonbar-xft-git
rofi
scrot
i3lock
```
Fonts:<br/>
```
Hack
FontAwesome
```
<br/>
<br/>
The terminal I use is terminator, which I autostart in the i3rc file.<br/>
Also, I use some of the components of the Cinnamon desktop environment, which I also have installed. I use Nautilus as my file browser, the cinnamon-settings program for my settings menu, and the cinnamon-settings-daemon runs in the background to handle things like the GTK theme. I also ran<br/>
```gsettings set org.cinnamon.desktop.lockdown disable-lock-screen true```
once to disable the Cinnamon lock screen, as I am using i3lock instead.

To copy things from the git repo to where they need to be, run the INSTALL.sh script. Some paths may have to be changed, I'm not sure, but that script should move everything that needs to be from the repo to ~/.config/i3<br/>

OpenCV and cmake would be necessary to compile the pixelating script, but I've included the binary, and it's pretty simple, so I don't <i>think</i> there's any reason it shouldn't run...<br/><br/>

You need to make the scripts executable for them to be run:<br/>
```chmod +x bar.sh```<br/><br/>

I'm currently running this with Fedora 24, and i3 is launched through lightdm when I log in.<br/><br/>

Certain components of the configuration (specifically, changing the brightness of the screen) require root access to work. The way I have this set up is to run those bits with "sudo -A", which calls the SUDO_ASKPASS variable to authenticate instead of prompting for the password to be entered. So as you can see in the i3rc file, I created a bash script called 'authentication.sh' which I use for authenticating those bits. I haven't uploaded that script for obvious reasons, so it will be up to the user to create their own, secure, method for making that part work.