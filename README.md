### Post-installation-custom-configuration
This is a script that i use to automate my workflow in any given linux distribution.
 This script updates and upgrades the system, and installs: git, vim, nano, htop, curl, wget, tmux, nmap, net-tools, traceroute, john, aircrack-ng, tcpdump, hydra, wireshark, ruby, evil-winrm and many more..
 
also it tweaks the KDE to preffred design by me, and set alias for common commands and operation such as: cls as clear, and lsa as ls -a, and many more.
it contains an alias "scan" for quick packet (tcpdump) scaning in the CLI that outputs  a pcap file but in a compatible size for wireshark if the use of it is necessary.

I had a script that handles apt update and upgrade in a one liner that inspire me to make the current one.
###Usage

```bash
chmod +x ./Post\ installation\ custom\ configuration.sh && ./Post\ installation\ custom\ configuration.sh
```


