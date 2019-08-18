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
  echo -e "$red [$green+$red]$off Installing Perl ...";
pkg install -y perl
echo -e "$red [$green+$red]$off Installing JSON Module ...";
cpan install JSON
  echo -e "$red [$green+$red]$off Checking directories ..."

if [ -e "/data/data/com.termux/files/usr/share/Detektif" ]; then
  echo -e "$red [$green+$red]$off A previous installation was found Do you want to replace it? [Y/n]: "
read replace
if [ "$replace" == "y" ] || [ "$replace" == "Y" ] || [ -z "$replace" ]; then
 rm -r "/data/data/com.termux/files/usr/share/Detektif"
 rm "/data/data/com.termux/files/usr/bin/Detektif"
else
  echo -e "$red [$green✘$red]$off If You Want To Install You Must Remove Previous Installations";
  echo -e "$red [$green✘$red]$off Installation Failed";
 exit
fi
fi

  echo -e "$red [$green+$red]$off Installing ...";
 mkdir "/data/data/com.termux/files/usr/share/Detektif" 
 cp "Th3inspector.pl" "/data/data/com.termux/files/usr/share/Detektif"
 cp "install.sh" "/data/data/com.termux/files/usr/share/Detektif"
 cp "update.sh" "/data/data/com.termux/files/usr/share/Detektif"
 chmod +x /data/data/com.termux/files/usr/share/Detektif/update.sh
  echo -e "$red [$green+$red]$off Creating Symbolic Link ...";
  echo "#!/data/data/com.termux/files/usr/bin/bash 
perl /data/data/com.termux/files/usr/share/Detektif/Detektif.pl" '${1+"$@"}' > "IpLocation";
 cp "Th3inspector" "/data/data/com.termux/files/usr/bin"
 chmod +x "/data/data/com.termux/files/usr/bin/Detektif"
 rm "IpLocation";
 if [ -d "/data/data/com.termux/files/usr/share/Detektif" ] ;
then
echo -e "$red [$green+$red]$off Tool successfully installed and will start in 5s!";
echo -e "$red [$green+$red]$off You can execute tool by typing Detektif"
sleep 5;
Detektif
else
echo -e "$red [$green✘$red]$off Tool Cannot Be Installed On Your System! Use It As Portable !";
    exit
fi
}

function linux() {
echo -e "$red [$green+$red]$off Installing Perl ...";
sudo apt-get install -y perl
echo -e "$red [$green+$red]$off Installing JSON Module ...";
cpan install JSON
  echo -e "$red [$green+$red]$off Checking directories..."
if [ -d "/usr/share/Th3inspector" ]; then
    echo -e "$red [$green+$red]$off A Directory Detektif Was Found! Do You Want To Replace It? [Y/n]:" ;
    read replace
    if [ "$replace" = "y" ]; then
      sudo rm -r "/usr/share/Detektif"
      sudo rm "/usr/share/icons/Detektif.png"
      sudo rm "/usr/share/applications/Detektif.desktop"
      sudo rm "/usr/local/bin/Detektif"

else
echo -e "$red [$green✘$red]$off If You Want To Install You Must Remove Previous Installations";
echo -e "$red [$green✘$red]$off Installation Failed";
        exit
    fi
fi 

echo -e "$red [$green+$red]$off Installing ...";
echo -e "$red [$green+$red]$off Creating Symbolic Link ...";
echo -e "#!/bin/bash
perl /usr/share/Detektif/Detektif.pl" '${1+"$@"}' > "Detektif";
    chmod +x "Detektif";
    sudo mkdir "/usr/share/Detektif"
    sudo cp "install.sh" "/usr/share/Detektif"
    sudo cp "update.sh" "/usr/share/Detektif"
    sudo chmod +x /usr/share/Detektif/update.sh
    sudo cp "Th3inspector.pl" "/usr/share/Detektif"
    sudo cp "config/Detektif.png" "/usr/share/icons"
    sudo cp "config/Detektif.desktop" "/usr/share/applications"
    sudo cp "Detektif" "/usr/local/bin/"
    rm "Detektif";

if [ -d "/usr/share/Detektif" ] ;
then
echo -e "$red [$green+$red]$off Tool Successfully Installed And Will Start In 5s!";
echo -e "$red [$green+$red]$off You can execute tool by typing Th3inspector"
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
else
echo -e "$red [$green✘$red]$off Tool Cannot Be Installed On Your System! Use It As Portable !";
    exit
fi
