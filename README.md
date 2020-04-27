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
amap
autorecon
bloodhound
bsdmainutils
cewl
crackmapexec
crunch
darkarmour
dirb
dirbuster
dnsenum
dnsrecon
dnsutils
dos2unix
enum4linux
exploitdb
ffuf
ftp
fuxploider
gobuster
hashcat
hping3
hydra
impacket-scripts
john
joomscan
lsassy
masscan
metasploit-framework
mimikatz
nbtscan
ncat
netcat-traditional
nikto
nmap
nosqlmap
onesixtyone
patator
passing-the-hash
powershell
powersploit
pykek
python3-impacket
recon-ng
responder
samdump2
seclists
smbclient
smbmap
smtp-user-enum
socat
sprayhound
sqlmap
ssh-audit
sslscan
ssrfmap
tcpdump
testssl.sh
theharvester
wafw00f
weevely
wfuzz
whatweb
wordlists
wpscan
```

You can easily modify the Dockerfile to add more tools. Enjoy :)

## Other project

If you want something much heavier and more complete, feel free to use Exegol from my friend Shutdown: https://github.com/ShutdownRepo/Exegol.
