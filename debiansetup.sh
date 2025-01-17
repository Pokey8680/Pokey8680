#!/bin/bash

#title
clear
echo "Pokey's Debian Setup Script"
echo "This script will install my preffered programs and apps"
read -p "Press enter to continue"
clear

# update system (apt)
echo " "
echo "Updating system..."
echo " "
sudo apt update && sudo apt upgrade -y
clear

#add firefox repo from mozilla and install it from there instead of debian's repo (esr)
echo " "
echo "Replacing Firefox ESR with Stable Firefox..."
#Create a directory to store apt repository keys if it dosen't exist
sudo install -d -m 0755 /etc/apt/keyrings

#install wget
sudo apt install wget

#add mozilla repo
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null

#prioritize mozilla repo
echo '
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000
' | sudo tee /etc/apt/preferences.d/mozilla 

#install firefox from mozilla repo
sudo apt install firefox -y
echo "Done!"
echo " "
clear

#install other preferred stuff (apt)
echo "Installing Apps..."
echo " "
sudo apt install vlc obs-studio htop hollywood gimp flatpak fastboot gitg gparted gnome-tweaks gnome-extensions gnome-software-plugin-flatpak -y
echo " "
echo "Done!"
clear

#remove junk
echo " "
echo "Removing Junk..."
sudo apt remove gnome-games firefox-esr -y
echo "Done!"
clear

#clean up
echo "Cleaning up..."
echo " "
sudo apt autoremove -y
echo " "
echo "Done!"

#configure flatpak and gnome-software
echo " "
echo "Configuring Flatpak..."
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
echo "Done!"
echo "You will need to install the apps manually"
echo " "
clear
echo " "
echo " "
echo "Hopefully this should help you get started!"
sleep 3
exit



