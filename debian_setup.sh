







sudo add-apt-repository ppa:jean-francois-dockes/upnpp1 -y
sudo apt-get update -y


apt-get update && apt-get --yes install sudo wget unzip mc

#Next, issue this command to update the distribution.
#This is good because newer versions have fixes for audio and usb-issues:

apt-get dist-upgrade -y

#Next, configure the installation of Mopidy, the music server that is the heart of MusicBox.
#wget -q -O - http://apt.mopidy.com/mopidy.gpg | sudo apt-key add -
#wget -q -O /etc/apt/sources.list.d/mopidy.list http://apt.mopidy.com/mopidy.list

#update time, to prevent update problems
ntpdate -u ntp.ubuntu.com

#Then install all packages we need with this command:
sudo apt-get update && sudo apt-get --yes --no-install-suggests --no-install-recommends install \
  python-setuptools \
  logrotate \
  alsa-utils \
  wpasupplicant \
  gstreamer1.0-alsa \
  ifplugd \
  gstreamer1.0-fluendo-mp3 \
  gstreamer1.0-tools \
  samba \
  dos2unix \
  avahi-utils \
  alsa-base \
  cifs-utils \
  avahi-autoipd \
  libnss-mdns \
  ntpdate \
  ca-certificates \
  ncmpcpp \
  alsa-firmware-loaders \
  iw \
  iptables \
  build-essential \
  python-dev \
  python-pip \
  python-gst-1.0 \
  gstreamer1.0-plugins-good \
  gstreamer1.0-plugins-bad \
  gstreamer1.0-plugins-ugly \
  usbmount \
  monit \
  upmpdcli \
  watchdog \
  mpc \
  dosfstools \
  python-cffi




















#Add the user to the group audio:
usermod -a -G audio mopidy

#Create a couple of directories inside the user dir:
mkdir -p /var/lib/mopidy/.config/mopidy
mkdir -p /var/lib/mopidy/.cache/mopidy
mkdir -p /var/lib/mopidy/.local/share/mopidy
chown -R mopidy:mopidy /var/lib/mopidy

#**Create Music directory for MP3/OGG/FLAC **
#Create the directory containing the music and the one where the network share is mounted:
mkdir -p /music/MusicBox
mkdir -p /music/Network
mkdir -p /music/USB
mkdir -p /music/USB2
mkdir -p /music/USB3
mkdir -p /music/USB4
chmod -R 777 /music
chown -R mopidy:mopidy /music
