#!bin/bash
_firefox(){
    echo -e "\u001b[33mInstalling firefox-browser.....\u001b[0m"
    sudo apt update
    sudo apt install firefox
}
_git(){
    echo -e "\u001b[33mInstalling git.....\u001b[0m"
    sudo apt install git
}
_gedit(){
    echo -e "\u001b[33mInstalling gedit (Text Editor).....\u001b[0m"
    sudo apt install gedit
}
_ranger(){
    echo -e "\u001b[33mInstalling ranger (Text Editor).....\u001b[0m"
    sudo apt install ranger
    sudo apt install highlight
}
_neofetch(){
    app="neofetch"
    dpkg -s $app &> /dev/null

    if [ $? -eq 0 ]; then
        echo -e "\u001b[32mneofetch is already installed. \xE2\x9C\x94\u001b[0m"
    else
        echo -e "\u001b[33mInstalling neofetch .....\u001b[0m"
        sudo apt install neofetch
    fi
    
}
_conf_git(){
    echo -e "\u001b[33mConfiguring git .....\u001b[0m"
    echo -e -n "\u001b[36m please enter email address : "
    read email
    echo -e -n "\u001b[33m please enter fullname : "
    read name
    git config --global user.name "$name"
    git config --global user.email "$email"
    
}

_ssh(){
    
    echo -e -n "\u001b[36m please enter email address : "
    read email
    ssh-keygen -t rsa -b 4096 -C "$email"
    echo -e "u001b[36mcopy the content and create a new ssh at https://github.com/settings/keysu001b[0m"
    gedit ~/.ssh/id_rsa.pub
    echo -e -n "\u001b[33m Did you created new SSH key in github ,if yes press [enter].... "
    read perm
    echo -e "Attempts to ssh to GitHub"
    echo -e "result should be something like---"
    echo -e "\u001b[0;2mHi username! You've successfully authenticated, but GitHub does not provide shell access.\u001b[0m"
    ssh -T git@github.com
}
_python3(){
    echo -e "\u001b[33mInstalling python3 .....\u001b[0m"
    sudo apt install python3
}
_pip3(){
    app="python3"
    dpkg -s $app &> /dev/null

    if [ $? -eq 0 ]; then
        echo -e "\u001b[33mInstalling pip3 .....\u001b[0m"
        sudo apt install python3-pip
    else
        sudo apt install python3
        sudo apt install python3-pip
    fi
    
}


echo -e "\u001b[36m welcome to starter package installer \u001b[0m"
echo -e "\u001b[33m Processes... - \u001b[0m"
echo -e "1. firefox-browser."
echo -e "2. git"
echo -e "3. gedit"
echo -e "4. ranger"
echo -e "5. neofetch"
echo -e "6. configuere git"
echo -e "7. SSH connection to github.com"
echo -e -n "\u001b[31m Are you sure to go forward ? [\u001b[32my\u001b[0m/\u001b[31mn]: \u001b[0m"
read perm

if [ $perm == "n" ]
then
echo -e "\u001b[36m closing starter package installer \u001b[0m"
exit 1
fi
echo -e "\u001b[32m-> kickstarting starter package installer \u001b[0m"

echo -e -n "\u001b[35m want to install all? [y/n] : "
read allperm

# firefox install
echo -e -n "\u001b[36m want to install firefox-browser? [y/n] : "
read perm

if [ $perm != "n" ]
then
dpkg -s firefox &> /dev/null

if [ $? -eq 0 ]; then
    echo -e "\u001b[32mfirefox is already installed. \xE2\x9C\x94\u001b[0m"
else
_firefox
fi

else
echo -e "\u001b[32m firefox-browser successfuly Aborted. \xE2\x9D\x8C\u001b[0m"
fi

# gedit install

dpkg -s git &> /dev/null

if [ $? -eq 0 ]; then
    echo -e "\u001b[32mgedit already installed. \xE2\x9C\x94\u001b[0m"
else
_gedit
fi


# git install
echo -e -n "\u001b[36m want to install and configuire git? [y/n] : "
read permi
if [ $permi != "n" ]
then
dpkg -s git &> /dev/null

if [ $? -eq 0 ]; then
    _conf_git
else
    _git
    _conf_git
fi
else
echo -e "\u001b[32m git installation successfuly Aborted. \xE2\x9D\x8C\u001b[0m"
fi


# neofetch install
echo -e -n "\u001b[36m want to install neofetch? [y/n] : "
read permi
if [ $permi != "n" ]
then
_neofetch
else
echo -e "\u001b[32m neofetch installation successfuly Aborted. \xE2\x9D\x8C\u001b[0m"
fi

# _vscode

dpkg -s ranger &> /dev/null

if [ $? -eq 0 ]; then
    echo -e "\u001b[32mranger already installed. \xE2\x9C\x94\u001b[0m"
else
echo -e -n "\u001b[36m want to install ranger? [y/n] : "
read permi
if [ $permi != "n" ]
then
_ranger
else
echo -e "\u001b[32m ranger installation successfuly Aborted. \xE2\x9D\x8C\u001b[0m"
fi

fi



# ssh
echo -e -n "\u001b[36m want to set up github ssh connection? [y/n] : "
read permi
if [ $permi != "n" ]
then
dpkg -s git &> /dev/null

if [ $? -eq 0 ]; then
    _ssh
else
_git
_conf_git
_ssh
fi
else
echo -e "\u001b[32m SSH setup successfuly Aborted. \xE2\x9D\x8C\u001b[0m"
fi


# python install
app="python3"
dpkg -s $app &> /dev/null

if [ $? -eq 0 ]; then
    echo -n ""
else
    echo -e -n "\u001b[31mWe just notied python3 is not installed."
    echo -e -n "\u001b[36m want to install python3? [y/n] : "
    read permi
    if [ $permi != "n" ]
        then
        _python3
        else
        echo -e "\u001b[32m python3 installation successfuly Aborted. \xE2\x9D\x8C\u001b[0m"
    fi
fi

# pip install
app="python3-pip"
dpkg -s $app &> /dev/null

if [ $? -eq 0 ]; then
    echo -n ""
else
    echo -e -n "\u001b[31mWe just notied pip3 is not installed."
    echo -e -n "\u001b[36m want to install pip3? [y/n] : "
    read permi
    if [ $permi != "n" ]
        then
        _pip3
        else
        echo -e "\u001b[32m pip3 installation successfuly Aborted. \xE2\x9D\x8C\u001b[0m"
    fi
fi



echo "---------------------------------------"
app=""
# firefox
app="firefox"
dpkg -s $app &> /dev/null

if [ $? -eq 0 ]; then
    echo -e "| $app ---- \u001b[32m installed \xE2\x9C\x94\u001b[0m"
else
    echo -e "| $app ---- \u001b[31m not installed \xE2\x9D\x8C\u001b[0m"
fi

# git
app="git"
dpkg -s $app &> /dev/null

if [ $? -eq 0 ]; then
    echo -e "| $app ---- \u001b[32m installed \xE2\x9C\x94\u001b[0m"
else
    echo -e "| $app ---- \u001b[31m not installed \xE2\x9D\x8C\u001b[0m"
fi

# gedit
app="gedit"
dpkg -s $app &> /dev/null

if [ $? -eq 0 ]; then
    echo -e "| $app ---- \u001b[32m installed \xE2\x9C\x94\u001b[0m"
else
    echo -e "| $app ---- \u001b[31m not installed \xE2\x9D\x8C\u001b[0m"
fi

# neofetch
app="neofetch"
dpkg -s $app &> /dev/null

if [ $? -eq 0 ]; then
    echo -e "| $app ---- \u001b[32m installed \xE2\x9C\x94\u001b[0m"
else
    echo -e "| $app ---- \u001b[31m not installed \xE2\x9D\x8C\u001b[0m"
fi

# neofetch
app="ranger"
dpkg -s $app &> /dev/null

if [ $? -eq 0 ]; then
    echo -e "| $app ---- \u001b[32m installed \xE2\x9C\x94\u001b[0m"
else
    echo -e "| $app ---- \u001b[31m not installed \xE2\x9D\x8C\u001b[0m"
    
fi

# python3
app="python3"
dpkg -s $app &> /dev/null

if [ $? -eq 0 ]; then
    echo -e "| $app ---- \u001b[32m installed \xE2\x9C\x94\u001b[0m"
else
    echo -e "| $app ---- \u001b[31m not installed \xE2\x9D\x8C\u001b[0m"
fi

# pip3
app="python3-pip"
dpkg -s $app &> /dev/null

if [ $? -eq 0 ]; then
    echo -e "| $app ---- \u001b[32m installed \xE2\x9C\x94\u001b[0m"
else
    echo -e "| $app ---- \u001b[31m not installed \xE2\x9D\x8C\u001b[0m"
fi

echo "---------------------------------------"

# uninitializing functions
unset -f _firefox
unset -f _gedit
unset -f _git
unset -f _neofetch
unset -f _vscode
unset -f _conf_git
unset -f _ssh
