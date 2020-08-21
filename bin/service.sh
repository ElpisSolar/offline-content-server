# Make directory for kiwix and install kiwix tools
mkdir -p /usr/src/kiwix
apt-get install wget openssl nginx -y

if [ $(uname -m) = "x86_64" ]; then
	KIWIX=kiwix-tools_linux-x86_64-3.1.2
else
	KIWIX=kiwix-tools_linux-armhf-3.1.2
fi

wget -qO- https://download.kiwix.org/release/kiwix-tools/$KIWIX.tar.gz | tar -xvz -C /usr/src/kiwix
mv -v /usr/src/kiwix/$KIWIX/* /usr/bin/
rm -rf /usr/src/kiwix

# start nginx
# TODO: need to specify nginx reverse proxy configuration
sudo systemctl start nginx

# TODO: install go for questionnaire

# TODO: download digital-hub-ui

# TODO: install and compile s6 https://skarnet.org/software/s6/

# TODO: run go and digital-hub-ui (flask application) using s6

echo "Service configuration complete."

# reboot if wlan configuration was run.
