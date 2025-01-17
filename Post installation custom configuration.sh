#!/bin/bash

# Advanced Post-install Automation Script for KDE-based Distros (v2.1)

echo "Starting your ultimate post-install setup (v2.1)!"

# 1. System Update
echo "Updating your system..."
sudo apt update && sudo apt upgrade -y || sudo dnf update -y || sudo pacman -Syu --noconfirm

# 2. Install Essential Tools
echo "Installing essential packages..."
ESSENTIALS=(
    "git"         # Version control
    "vim"         # Text editor
    "nano"        # Simpler text editor
    "htop"        # Process viewer
    "curl"        # Data transfer
    "wget"        # File downloader
    "tmux"        # Terminal multiplexer
    "nmap"        # Network scanning
    "net-tools"   # Networking utilities
    "traceroute"  # Network diagnostics
    "john"        # John the Ripper password cracker
    "aircrack-ng" # Wi-Fi security auditing
    "tcpdump"     # Packet analyzer
    "hydra"       # Password cracking
    "wireshark"   # Network protocol analyzer
    "ruby"        # Needed for evil-winrm
)
if command -v apt > /dev/null; then
    sudo apt install -y "${ESSENTIALS[@]}"
elif command -v dnf > /dev/null; then
    sudo dnf install -y "${ESSENTIALS[@]}"
elif command -v pacman > /dev/null; then
    sudo pacman -S --noconfirm "${ESSENTIALS[@]}"
else
    echo "This a custom string for self, for the purpose of debugging: Package manager not detected. Skipping package installation."
fi

# 3. Install Visual Studio Code (via Snap)
echo "Installing Visual Studio Code..."
sudo snap install code --classic

# 4. Install Metasploit Framework (via Snap)
echo "Installing Metasploit Framework..."
sudo snap install metasploit-framework

# 5. Install Burp Suite
echo "Installing Burp Suite..."
wget https://portswigger.net/burp/releases/download?product=community&version=2023.1&type=Linux -O burpsuite.sh
chmod +x burpsuite.sh
./burpsuite.sh

# 6. Install Evil-WinRM
echo "Installing Evil-WinRM..."
sudo gem install evil-winrm

# 7. KDE Tweaks (Set Breeze Dark Theme)
echo "Tweaking KDE settings..."
kwriteconfig5 --file kdeglobals --group General --key ColorScheme "BreezeDark"
kwriteconfig5 --file kdeglobals --group General --key Name "Breeze Dark"
echo "Dark mode set!"
echo "If you see errors here - the lines before this are for KDE tweaking -  it is possible that this isn't a KDE enviroment"

# 8. Set Up Aliases and Functions

# Determine the appropriate shell configuration file
if [ "$(echo $SHELL)" = "/bin/zsh" ]; then
    CONFIG_FILE="$HOME/.zshrc"
else
    CONFIG_FILE="$HOME/.bashrc"
fi

# Add custom aliases and functions to the shell configuration file
cat <<EOL >> $CONFIG_FILE

# Custom Aliases
alias update='sudo apt update && sudo apt upgrade -y'
alias cls='clear'
alias lsa='ls -a'
alias edit-config='nano $CONFIG_FILE && source $CONFIG_FILE'

# Pentesting Quick Tools
alias scan='sudo tcpdump -i eth0 -s 65535 -w ./scan.pcap && echo "Captured packets saved to ./scan.pcap for Wireshark analysis."'
function sniff() {
    sudo tcpdump -i "\$1" -s 65535 -w capture.pcap
    echo "Sniffing on interface \$1. Saved to capture.pcap."
}
EOL

# Reload the configuration file to apply changes
source $CONFIG_FILE

echo "Configuration updated for $(basename $SHELL). Aliases and functions are now active."


# Final Message
echo "The custom script finished!"
echo "Setup complete! Reboot to enjoy the changes."
exit 0

