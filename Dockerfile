# Dockerfile kali-light

# Official base image
FROM kalilinux/kali-rolling

# Set working directory to /root
WORKDIR /root

# Apt
RUN apt -y update --fix-missing && apt -y upgrade && apt -y autoremove && apt clean

# Basic tools
RUN apt install apt-utils aircrack-ng crackmapexec crunch curl dirb dirbuster dnsenum dnsrecon dnsutils dos2unix enum4linux exploitdb ftp gcc git gobuster hashcat hping3 hydra impacket-scripts john joomscan libffi-dev make masscan metasploit-framework mimikatz nasm ncat netcat-traditional nikto nmap patator php powersploit proxychains python2 python3 python3-pip python3-setuptools python3-impacket python-setuptools python-dev recon-ng responder ruby-dev samba samdump2 smbclient smbmap snmp socat sqlmap sslscan theharvester vim wafw00f weevely wfuzz whois wordlists seclists wpscan zsh ssh-audit iputils-ping tcpdump proxychains whatweb smtp-user-enum onesixtyone cewl nbtscan amap golang testssl.sh bsdmainutils powershell -y --no-install-recommends

# Advanced tools
ADD ./install.sh /root/install.sh
RUN chmod +x /root/install.sh && /root/install.sh && rm /root/install.sh

# History (keep old history)
ADD ./conf/history /root/history
RUN cat /root/history >> /root/.zsh_history
RUN h=$(cat /root/.zsh_history | sort | uniq)
RUN echo $h > /root/.zsh_history
RUN rm /root/history

# Aliases
ADD ./conf/aliases /opt/aliases
RUN echo 'source /opt/aliases' >> /root/.zshrc

# Open shell
CMD ["/bin/zsh"]