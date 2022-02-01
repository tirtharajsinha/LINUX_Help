# themes for gnome

> notice : install themes in ~/.themes. if not exists create)
> download and paste the theme folder in ``` ~/.themes``` . (except Qogir, find installation process of Qogir below)
1. Qogir-dark (https://github.com/vinceliuice/Qogir-theme)
2. layan-dark (https://www.gnome-look.org/p/1309214/)
3. nordic-darker-40 (https://www.gnome-look.org/p/1267246/)


# icon themes for gnome
> notice : install themes in ~/.themes. if not exists create)
> download and paste the icon-theme folder in ``` ~/.icons``` . 
1. deepinIcons 2022 (https://www.gnome-look.org/p/1678986)
2. candy-icons 
3. papirus

# themes for Ulauncher 
> find themes here https://gist.github.com/gornostal/02a232e6e560da7946c053555ced6cce

> run command ``` mkdir -p ~/.config/ulauncher/user-themes ``` .
> paste the theme folder in ``` ~/.config/ulauncher/user-themes ``` . 

1. nord Theme (https://github.com/KiranWells/ulauncher-nord/)
2. orchis (https://github.com/kleber-swf/orchis-dark-ulauncher)


# install Qogir theme
> dowload the ropo as zip and extract it.
> open the terminal in ```Qogir-theme``` folder. 
> run ``` ls ``` comand. there shold be a file called install.sh in the list.
> now run folling command
```
gsettings set org.gnome.desktop.wm.preferences button-layout appmenu:minimize,maximize,close
./install.sh --tweaks image square round -l manjaro
```
put the os name of your choice at the place of  `manjaro`.

> Now open/reopen gnome-tweeks and set Qogir/Qogir-dark/Qogit-light theme from the list.  
