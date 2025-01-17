### Post-Installation Custom Configuration

This script is used to automate my workflow in any given Linux distribution. It updates and upgrades the system, and installs: git, vim, nano, htop, curl, wget, tmux, nmap, net-tools, traceroute, john, aircrack-ng, tcpdump, hydra, wireshark, ruby, evil-winrm, and many more.

It also tweaks KDE to a preferred design by me, and sets aliases for common commands and operations, such as `cls` for `clear`, and `lsa` for `ls -a`, and many more.

It contains an alias `scan` for quick packet (tcpdump) scanning in the CLI that outputs a pcap file in a compatible size for Wireshark if its use is necessary.
I had a script that handled `apt update` and `upgrade` in a one-liner that inspired me to make the current one.

### Usage

```bash
chmod +x ./Post\ installation\ custom\ configuration.sh && ./Post\ installation\ custom\ configuration.sh
```
