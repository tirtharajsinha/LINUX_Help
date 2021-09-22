# packages needed

## instructions
1. before installing any package run  - ``` sudo apt-get update ```

## package manager
1. snap - ``` sudo apt install snapd ```
2. apt-get - comes default in debian based distro.


## Text Editor
1. Vs code - [Download](https://code.visualstudio.com/download)
2. gedit - ``` sudo apt install gedit ```
3. Notepad++ ``` sudo snap install notepad-plus-plus ```


## browser
1. firefox - ``` sudo apt install firefox ```
2. chrome - [Download](https://www.google.com/chrome/)
3. brave
> to install brave follow this commands
```

sudo apt install apt-transport-https curl

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install brave-browser

```

## git 
install - ``` sudo apt install git ```
### set up ssh - 
1. generate key
```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```
press enter three times

2. copy genereted key
```
gedit ~/.ssh/id_rsa.pub
```
3. copy the content and create a new ssh at https://github.com/settings/keys

4. Attempts to ssh to GitHub
```
ssh -T git@github.com
```
result should be something like. 
> Hi username! You've successfully authenticated, but GitHub does not
> provide shell access.
