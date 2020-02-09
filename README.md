# Light Kali Linux Docker image

Light and containerized version of Kali Linux with Docker containing only the useful tools and allowing to be launched on the fly

## Install

Clone the project

```bash
git clone https://github.com/thibaudrobin/docker-kali-light.git
cd docker-kali-light
```

Build the image

```bash
docker build -t kali-light .
```

Create containers

```
pip install docker-compose --user
sudo mkdir /mnt/share-kali-light
docker-compose run kali-light
```

Create some alias

```bash
echo "alias kali='docker-compose -f $HOME/docker-kali-light/docker-compose.yml run kali-light'" >> .bashrc && source .bashrc
```

More infos : https://thibaud-robin.fr/articles/docker-kali/

## Tools installed

```md
aircrack-ng
crackmapexec
crunch
curl
dirb
dirbuster
dnsenum
dnsrecon
dnsutils
dos2unix
enum4linux
exploitdb
ftp
git
gobuster
hashcat
hping3
hydra
impacket-scripts
john
joomscan
masscan
metasploit-framework
mimikatz
nasm
ncat
netcat-traditional
nikto
nmap
patator
php
powersploit
proxychains
python-impacket
python-pip
python2
python3
recon-ng
responder
samba
samdump2
smbclient
smbmap
snmp
socat
sqlmap
sslscan
sslstrip
theharvester
vim
wafw00f
weevely
wfuzz
whois
wordlists
wpscan
```

You can easily modify the Dockerfile to add more tools. Enjoy :)