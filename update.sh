#!/bin/bash

red="\e[0;31m"
green="\e[0;32m"
off="\e[0m"

function banner() {
clear
echo " ____   ______  _____  ______  __   __  _____   _  ______";
echo " || \\  ||    ||_   _| ||    | ||  //  |_   _| | | ||";
echo " ||  \\ ||___    | |   ||___   || //     | |   | | ||__";
echo " ||  // ||       | |   ||      || \\     | |   | | ||";
echo " ||__/  ||____/  |_|   ||____/ ||  \\    |_|   |_| ||";
echo " ~~~~~  ~~~~~~~  ~~~   ~~~~~~~ ~~   ~~   ~~~   ~~~ ~~ ";
echo "                                                          ";
echo "  ___             _        _ _           ";
echo " |_ _|  _ __  ___| |_ __ _| | | ___ _ __ ";
echo "  | |  | '_ \/ __| __/ _\`| | |/ _ \ '__|";
echo "  | |  | | | \__ \ || (_| | | |  __/ |   ";
echo " |___| |_| |_|___/\__\__,_|_|_|\___|_|   ";
echo " ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ";
echo "                                         ":
}

function termux() {
echo -e "$red [$green+$red]$Cleaning Up Old Directories ...";
  rm -r "/data/data/com.termux/files/usr/share/Detektif"
  echo -e "$red [$green+$red]$off Installing ...";
  git clone https://github.com/BLackWhite0711/Detektif "/data/data/com.termux/files/usr/share/Detektif";
  rm -r "/data/data/com.termux/files/usr/share/Detektif/config"

if [ -d "/data/data/com.termux/files/usr/share/Detektif" ] ;
then
echo -e "$red [$green+$red]$off Tool Successfully Updated And Will Start In 5s!";
echo -e "$red [$green+$red]$off You can execute tool by typing Detektif"
sleep 5;
Detektif
else
echo -e "$red [$green✘$red]$off Tool Cannot Be Installed On Your System! Use It As Portable !";
    exit
fi 
}

function linux() {
echo -e "$red [$green+$red]$off Cleaning Up Old Directories ...";
  sudo rm -r "/usr/share/Detektif"
  echo -e "$red [$green+$red]$off Installing ...";
 sudo git clone https://github.com/BLackWhite0711/Detektif "/usr/share/Detektif";
  sudo rm -r "/usr/share/Detektif/config"

if [ -d "/usr/share/Detektif" ] ;
then
echo -e "$red [$green+$red]$off Tool Successfully Updated And Will Start In 5s!";
echo -e "$red [$green+$red]$off You can execute tool by typing Detektif";
sleep 5;
Detektif
else
echo -e "$red [$green✘$red]$off Tool Cannot Be Installed On Your System! Use It As Portable !";
    exit
fi 
}

if [ -d "/data/data/com.termux/files/usr/" ]; then
banner
echo -e "$red [$green+$red]$off Detektif Will Be Installed In Your System";
termux
elif [ -d "/usr/bin/" ];then
banner
echo -e "$red [$green+$red]$off Detektif Will Be Installed In Your System";
linux
fi
