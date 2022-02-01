# Importent packages to install on a arc based os (tested on manjaro on gnome DE)
1. pantheon-code
2. telegram-desktop
3. terminology(not must)
4. ranger (works best with terminology)
5. ulauncher


# how to install packages in ach based os
Install > use ``` pacman -S <package-name> ``` to install a package.
Remove>  ``` pacman -R <package-name> ``` to remove a package.
Remove dependency > use ``` pacman -Rs $(pacman -Qqtd) ``` to remove packages with no need.
Search in local mechine > use ``` pacman -Q <package-name> ``` to search packages in local mechine.
search from package database > use ``` pacman -Ss <query> ``` to search package.


# install and setup ulauncher
install
```
git clone https://aur.archlinux.org/ulauncher.git && cd ulauncher && makepkg -is
```
autoactive
```
cd /usr/share/applications/
cp ulauncher.desktop ~/.config/autostart/
```

active using ctrl + space
1. Open Settings > Keyboard (may be named "Keyboard Shortcuts"), then scroll down to Customize Shortcuts > Custom Shortcuts > +
2. In Command enter ulauncher-toggle, set name and shortcut, then click Add



