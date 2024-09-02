
![:fedora:](https://redhat.discourse-cdn.com/fedoraproject/original/2X/0/0af483d479044dd09776ea4487a85a311e4db052.png?v=12 ":fedora:")
### I Use Fedora BTW!!!
# Automatic Installation script
Get it here [tirtharajsinha/distro-customizer](https://github.com/tirtharajsinha/distro-customizer)


# Manual Installer

1. Installing Fedora

2. disable Side channel migration in vmware.(ONLY FOR VMWARE)
```
ulm.disableMitigations = "TRUE"
```

add this line to .vmx file 


3. Adjust time date

```bash
sudo timedatectl set-local-rtc 1 --adjust-system-clock
```
3. Adding DNF config

```bash
sudo nano /etc/dnf/dnf.conf

```

add below lines at the end of the file
```conf
minrate=40k
fastestmirror=False
max_parallel_downloads=10
defaultyes=True
keepcache=True
```

4. Update distro
```bash
sudo dnf update
```

5. case insensitiveness in tab auto-complete

Add at the end of ~/.bashrc
```bash
bind 'set completion-ignore-case on'
```

6. setup automount a partition. follow this [tutorial](https://www.baeldung.com/linux/automount-partitions-startup)

7. Symlink windows partition to ~/Developer. 

Assuming your are migrating from windows and used D: drive for storing files. Now want to access the partition in ~/Developer for easy access. then setup automount the partition and get the mount point using ```lsblk``` command. 

```bash
ln -s <MOUNT-POINT> ~/Developer
```

Assuming your Downloads folder also in D: drive in windows and want to sync the ~/Downloads to ~/Developer/Downloads. and ~/Documents to ~/Developer/Documents

```shell
mv ~/Downloads/* ~/Developer/Downloads/
rmdir ~/Downloads
ln -s <MOUNT-POINT>/Downloads ~/Downloads

mv ~/Documents/* ~/Developer/Documents/
rmdir ~/Documents
ln -s <MOUNT-POINT>/Documents ~/Documents
```


8. Setup rpm fusion
```bash
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm 

sudo dnf groupupdate core
```

9. Enable flatpak
```bash
sudo dnf install flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```

10. Install Multimedia codecs
```bash
sudo dnf install ffmpeg libavcodec-freeworld --best --allowerasing
sudo dnf groupupdate multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf groupupdate sound-and-video
```


11. Install apps and package. Visit Section : [[#My Apps and packages list based on source]]


12. setup git and ssh connection

```shell
sudo dnf install git gh
git config --global user.name "<YOUR NAME>"
git config --global user.email "<YOUR EMAIL ID>"
gh auth login
```
For manual setup visit [tirtharajsinha/git-commands](https://github.com/tirtharajsinha/git-commands?tab=readme-ov-file#git-config-for-linux)

13. Setup firewall with UFW. Follow this [tutorial](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-with-ufw-on-ubuntu) .

14. Customize the distro (themes, icons, fonts, wallpapers, extensions, key bindings etc. )

## Special Notes

- There may be cracking sound when live usb testing, after installation it will be ok(most probably).
- It is not possible to enable Fingerprint sensor. [10 April, 2024]
- If google login on online accounts stuck after entering password, then [right click] and select [reload] from context menu.



### KDE special

1. remove bloat
```shell
sudo dnf erase akonadi*
sudo dnf erase kdepim*
sudo dnf erase mariadb*
sudo dnf erase kmahjongg kpat kmines

```

2. don't use kde online accounts(use google-drive-ocamlfuse and onedriver)


### Battery Life

- Follow this if you have a Laptop and are facing sub optimal battery backup.
- power-profiles-daemon which come pre-configured works great on a great majority of systems but still in case you're facing sub-optimal battery backup you try installing tlp by:
- `sudo dnf install tlp tlp-rdw`
- and mask power-profiles-daemon by:
- `sudo systemctl mask power-profiles-daemon`
- Also install powertop by:
- `sudo dnf install powertop`
- `sudo powertop --auto-tune`

### Install Syncthing enable and start

Enable and start the service. Replace “myuser” with the actual Syncthing user after the @
```shell
sudo dnf install syncthing
systemctl enable syncthing@<YOUR USER NAME>.service
systemctl start syncthing@<YOUR USER NAME>.service
```


## Setup terminal
#### Setup ZSH(Z shell)

1. Install zsh with 
```shell
sudo dnf install zsh
```

2. use zsh as default shell

```shell
sudo chsh -s $(which zsh)
chsh -s $(which zsh)
```

3.  run ```zsh``` command. it will show zsh configuration greeter. select preferred settings. 

4. Your zsh configuration will be saved in ```~/.zshrc``` file.


#### Setup oh-my-zsh and Install plugins

Install OH-MY-ZSH
```shell
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```


zsh-autosuggestions
```shell
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

zsh-syntax-highlighting
```shell
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

fzf-tab
```shell
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
```

now setup the installed plugins in .```zshrc```
```shell
plugins=(git z zsh-autosuggestions zsh-syntax-highlighting fzf-tab)
```

You can Use `powerlevel10k` or `oh-my-posh` as terminal prompt.

#### Setup oh my posh

1. install
```shell
curl -s https://ohmyposh.dev/install.sh | sudo bash -s -- -d /usr/local/bin
mkdir ~/.poshthemes
cd ~/.poshthemes
wget https://github.com/tirtharajsinha/customization_linux/blob/main/oh-my-posh-themes/3_shell.omp.json
```

2. add oh-my-posh settings in `.zshrc`
```
eval "$(oh-my-posh init zsh --config ~/.poshthemes/3_shell.omp.json>)"
```

3. restart terminal or run `exec zsh`

##### Setup eza

```
sudo dnf install eza
```

put below lines in `.zshrc`

```shell
# eza config
alias ls='eza --icons=always $@'                                                          # ls
alias l='eza -lbF --git --icons=always $@'                                                # list, size, type, git
alias ll='eza -lbGF --git --icons=always $@'                                             # long list
alias llm='eza -lbGd --git --sort=modified --icons=always $@'                            # long list, modified date sort
alias la='eza -lbhHigUmuSa --time-style=long-iso --git --color-scale --icons=always $@'  # all list
alias lx='eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale --icons=always $@' # all + extended list

```


## Setup Virtualization with KVM and virt-manager on fedora
```shell
dnf groupinfo virtualization
sudo dnf install @virtualization
sudo systemctl start libvirtd
sudo systemctl enable libvirtd
sudo lsmod | grep kvm
```

## Setup Onedrive and Googledrive
If your desktop environment has online-accounts(Gnome,cinnamon,xfce etc) then you are recommended to use that. Although I have faced some issue in KDE online accounts for google drive connectivity and kde does not have onedrive connectivity so I use Onedriver and 

#### Install Onedriver(for onedrive)
```shell
sudo dnf copr enable jstaf/onedriver
sudo dnf install onedriver
onedriver-launcher
```
You can also Launch onedriver from your start menu.


#### Install google-drive-ocamlfuse(For google drive)
```shell
sudo dnf copr enable sergiomb/google-drive-ocamlfuse
sudo dnf install google-drive-ocamlfuse

# Run to Authenticate with google
google-drive-ocamlfuse

# Create mountpoint directory
mkdir ~/googledrive

# Run to mount google drive to your designated folder
google-drive-ocamlfuse ~/googledrive

```

to start google-drive-ocamlfuse on boot you can create a .service file and enable it.
OR you can add a alias to your .zshrc or .bashrc to start google-drive-ocamlfuse on demand.
```shell
alias gdrive="google-drive-ocamlfuse ~/googledrive"
```

# My Apps and packages list based on source
### In Fedora official repo(dnf)
- kitty
- virtual machine manager
- warpinator
- remmina
- vlc
- timeshift
- python
- python-pip
- openjdk
- ufw
- zsh
- ranger
- podman
- distrobox(dependency: docker/podman)
- eza
- fzf

### Third party copr repo(dnf)
- brave
- visual studio code
- onedriver
- web apps manager
- google-drive-ocamfuse

### Third party native packages(.rpm/appimage/sourcecode)
> Web search to get installer and installation instruction
- chrome
- zed
- android studio
- pycharm/intellijidea IDE
- flutter SDK
- file centipede
- dbeaver
- oh-my-posh
- oh-my-zsh
- virtualbox

### flatpaks
1. obsidian
2. onlyoffice desktop
3. telegram desktop
4. eliment matrix client
5. arduino ide v2

## Installation scripts
```shell
# installing packages from dnf
sudo dnf update
sudo dnf install git gh gcc neofetch micro xclip htop
sudo dnf install kitty remmina vlc timeshift ufw zsh ranger distrobox eza fzf syncthing

# web app manager install
sudo dnf copr enable kylegospo/webapp-manager
sudo dnf install webapp-manager

# Docker install
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl start docker
sudo systemctl enable docker

#Onedriver
sudo dnf copr enable jstaf/onedriver
sudo dnf install onedriver

# Flatpak Installation
sudo flatpak install cc.arduino.IDE2 md.obsidian.Obsidian org.telegram.desktop org.x.Warpinator org.onlyoffice.desktopeditors

# Third Party Native app installation

# Brave
sudo dnf install dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install brave-browser

# Visual studio code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf check-update
sudo dnf install code

# Zed
curl -f https://zed.dev/install.sh | sh


# File centpede
wget https://github.com/filecxx/FileCentipede/raw/main/release/filecxx_latest_linux_x64.zip
unzip filecxx_latest_linux_x64.zip -d filecxx_latest_linux_x64
./filecxx_latest_linux_x64/filec


# Dbeaver
wget https://dbeaver.io/files/dbeaver-ce-latest-stable.x86_64.rpm
sudo dnf install dbeaver-ce-latest-stable.x86_64.rpm
```


# Fedora Update(Internal Update)
  
## Way 1 - graphical
Use a graphical packet manager like gnome-software or discover

## Way 2.1 - command line (Instant update)
```shell
sudo dnf update --refresh
sudo flatpak update
```
and Reboot

## Way 2.2 - command line (Offline update)
```shell
dnf flatpak update
dnf --refresh offline-upgrade download
dnf offline-upgrade reboot
```


# Fedora Upgrade to a major version(ie. 40 > 41)
## Way 1 - graphical
Use a graphical packet manager like gnome-software or discover

## Way 2 - command line

in these case we are updating from `fedora 39` to `fedora 40`
Docs - https://docs.fedoraproject.org/en-US/quick-docs/upgrading-fedora-offline/
```shell
sudo dnf upgrade --refresh
sudo dnf system-upgrade download --releasever=40
sudo dnf system-upgrade reboot
```
