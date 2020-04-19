#!/bin/bash
# Very strongly inspired by https://github.com/ShutdownRepo/Exegol project.

if [[ $EUID -ne 0 ]]; then
echo "You must be a root user" 2>&1
exit 1
fi

echo "[+] Preparing filesystem"
mkdir -p /opt/tools/ /opt/tools/bin/ /opt/resources/ /opt/resources/windows/ /opt/resources/linux/

# Python pip
echo "[+] Installing python-pip"
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
rm get-pip.py
pip install wheel
pip3 install wheel

# Oh-my-zsh
echo "[+] Installing oh-my-zsh and config"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sed -i 's/robbyrussell/gentoo/g' ~/.zshrc
echo 'export GOPATH=/root/go/bin' >> ~/.zshrc
echo 'export GO111MODULE=on' >> ~/.zshrc
echo 'export PATH=$GOPATH:$PATH' >> ~/.zshrc
echo 'export PATH=/opt/tools/bin:$PATH' >> ~/.zshrc

# Recon tool
echo "[+] Installing autorecon"
git -C /opt/tools/ clone https://github.com/Tib3rius/AutoRecon
cd /opt/tools/AutoRecon/
pip3 install -r requirements.txt

# Evil winrm
gem install winrm winrm-fs colorize stringio
gem install evil-winrm

# SSRF scanner
echo "[+] Installing SSRFmap"
git -C /opt/tools/ clone https://github.com/swisskyrepo/SSRFmap
cd /opt/tools/SSRFmap
pip3 install -r requirements.txt

# File upload fuzzer
echo "[+] Installing fuxploider"
git -C /opt/tools/ clone https://github.com/almandin/fuxploider.git
cd /opt/tools/fuxploider
pip3 install -r requirements.txt

# Web fuzzer
echo "[+] Installing ffuf"
go get -v -u github.com/ffuf/ffuf

# Impacket scripts
echo "[+] Installing Impacket scripts"
git -C /opt/tools/ clone https://github.com/SecureAuthCorp/impacket
cd /opt/tools/impacket/
pip3 install .

# Active directory tool
echo "[+] Installing lsassy with pip, and cme module by reinstalling cme with lsassy in cmd/modules/"
git -C /opt/tools/ clone https://github.com/Hackndo/lsassy/
cd /opt/tools/lsassy
python3 setup.py install

# Active directory tool
echo "[+] Installing sprayhound"
git -C /opt/tools/ clone https://github.com/Hackndo/sprayhound
cd /opt/tools/sprayhound
apt -y install libsasl2-dev libldap2-dev
pip3 install "pyasn1<0.5.0,>=0.4.6"
python3 setup.py install

# Active directory tool
echo "[+] Installing neo4j and Python ingestor for BloodHound"
git -C /opt/tools/ clone https://github.com/fox-it/BloodHound.py
cd /opt/tools/BloodHound.py/
python setup.py install
apt -y install neo4j

# Active directory tool
echo "[+] Installing Python Kernel Exploit Kit (pykek) for MS14-068"
git -C /opt/tools/ clone https://github.com/preempt/pykek

# AV evasion
echo "[+] Installing darkarmour"
git -C /opt/tools/ clone https://github.com/bats3c/darkarmour
cd /opt/tools/darkarmour
apt -y install mingw-w64-tools mingw-w64-common g++-mingw-w64 gcc-mingw-w64 upx-ucl osslsigncode

# Reverse shell generator
echo "[+] Installing shellerator"
git -C /opt/tools clone https://github.com/ShutdownRepo/shellerator
cd /opt/tools/shellerator
pip3 install -r requirements.txt

# Awesome webshell generator/handler
echo "[+] Installing weevely"
git -C /opt/tools clone https://github.com/epinna/weevely3.git
cd /opt/tools/weevely3
pip3 install -r requirements.txt --upgrade
