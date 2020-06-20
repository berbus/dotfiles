#!/bin/bash


install_golang () {
	sudo add-apt-repository ppa:longsleep/golang-backports -y
	sudo apt-get update -y
	sudo apt-get install golang-go -y
}

install_gobuster () {
	# https://github.com/OJ/gobuster/releases
	version="v3.0.1"
	name="gobuster-linux-amd64.7z"
	directory=$(echo $name | cut -d '.' -f 1)
	cd /tmp/
	url="https://github.com/OJ/gobuster/releases/download/$version/$name"
	rm -f $name
	wget $url
	7z x $name
	chmod +x "./$directory/gobuster"
	sudo mv "./$directory/gobuster" /usr/bin/
	cd -
}

install_nmap () {
	sudo apt install nmap
}

install_zap () {
	# https://github.com/zaproxy/zaproxy/wiki/Downloads
	version="v2.8.0"
	name="ZAP_2_8_0_unix"
	cd /tmp
	wget "https://github.com/zaproxy/zaproxy/releases/download/$version/$name.sh"
	sudo bash "./$name.sh"
	cd -
}

install_cherrytree () {
	sudo apt install cherrytree
}

install_burpsuite () {
	# https://portswigger.net/burp/communitydownload
	version="2.1.04"
	cd /tmp
	curl "https://portswigger.net/burp/releases/download?product=community&version=$version&type=linux&componentid=100" -o burp.sh
	sh burp.sh
	cd -
}

install_searchsploit () {
	sudo git clone https://github.com/offensive-security/exploitdb.git /opt/exploit-database
	sudo ln -sf /opt/exploit-database/searchsploit /usr/local/bin/searchsploit
}

install_metasploit () {
	cd /tmp
	curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
	  chmod 755 msfinstall && \
	  ./msfinstall
	cd -
}

install_hydra () {
	# https://github.com/vanhauser-thc/thc-hydra
	sudo apt install libssl-dev libssh-dev libidn11-dev libpcre3-dev \
                 libgtk2.0-dev libmysqlclient-dev libpq-dev libsvn-dev \
                 firebird-dev libmemcached-dev libgpg-error-dev \
                 libgcrypt11-dev libgcrypt20-dev
	git clone https://github.com/vanhauser-thc/thc-hydra /tmp/thc-hydra
	cd /tmp/thc-hydra
	./configure
	make
	sudo make install
}

install_john () {
	# https://github.com/magnumripper/JohnTheRipper/blob/bleeding-jumbo/doc/INSTALL-UBUNTU
	sudo apt -y install build-essential libssl-dev git zlib1g-dev
	sudo apt -y install yasm libgmp-dev libpcap-dev pkg-config libbz2-dev
	aux=`pwd`
	cd /tmp
	git clone git://github.com/magnumripper/JohnTheRipper -b bleeding-jumbo john
	cd john/src
	./configure && make -s clean && make -sj4
	cd $aux
}

install_wireshark () {
	sudo apt install wireshark
}

install_mingw () {
	sudo apt install gcc-mingw-w64
}


# install_golang (no longer required for gobuster)
install_gobuster
# install_nmap
# install_zap
# install_cherrytree
# install_burpsuite
# install_searchsploit
# instal_metasploit
# install_hydra
# install_john
# install_wireshark
# install_mingw
