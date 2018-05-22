sudo add-apt-repository ppa:jean-francois-dockes/upnpp1 -y
sudo apt-get update -y

apt-get update && apt-get --yes install sudo wget unzip mc ntpdate

#Next, issue this command to update the distribution.
#This is good because newer versions have fixes for audio and usb-issues:

apt-get dist-upgrade -y

#Next, configure the installation of Mopidy, the music server that is the heart of MusicBox.
#wget -q -O - http://apt.mopidy.com/mopidy.gpg | sudo apt-key add -
#wget -q -O /etc/apt/sources.list.d/mopidy.list http://apt.mopidy.com/mopidy.list

#update time, to prevent update problems
ntpdate -u ntp.ubuntu.com

sudo apt-get install build-essential python-dev python-pip python-gst-1.0 \
    gir1.2-gstreamer-1.0 gir1.2-gst-plugins-base-1.0 \
    gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly \
    gstreamer1.0-tools
    
pip install -U mopidy

##CHECKPOINT
sudo pip install -U mopidy \
    mopidy-spotify \
    mopidy-local-sqlite \
    mopidy-scrobbler \
    mopidy-soundcloud \
    mopidy-dirble \
    mopidy-tunein \
    mopidy-gmusic \
    mopidy-mobile \
    mopidy-moped \
    mopidy-musicbox-webclient \
    mopidy-websettings \
    mopidy-internetarchive \
    mopidy-podcast \
    mopidy-podcast-itunes \
    Mopidy-Simple-Webclient \
    mopidy-somafm \
    mopidy-spotify-tunigo \
    mopidy-youtube


python -m pip install --upgrade pip setuptools
# Attempted workarounds for SSL/TLS issues in old Python version.
pip install --upgrade certifi urllib3[secure] requests[security] backports.ssl-match-hostname backports-abc
# Upgrade some dependencies.
pip install --upgrade gmusicapi pykka pylast pafy youtube-dl
# The lastest versions that are still supported in Wheezy (Gstreamer 0.10).
pip install tornado==4.4
pip install mopidy==1.1.2
pip install mopidy-musicbox-webclient==2.5.0
pip install --no-deps --upgrade https://github.com/pimusicbox/mopidy-websettings/zipball/develop
pip install mopidy-websettings==0.2.3
pip install mopidy-mopify==1.6.1
pip install mopidy-mobile==1.8.0
pip install mopidy-youtube==2.0.2
pip install mopidy-gmusic==2.0.0
pip install mopidy-spotify-web==0.3.0
pip install mopidy-spotify-tunigo==1.0.0
# Custom version with Web API OAuth fix backported from v3.1.0
pip install --no-deps --upgrade https://github.com/pimusicbox/mopidy-spotify/zipball/backport-oauth
pip install mopidy-tunein==0.4.1
pip install mopidy-local-sqlite==1.0.0
pip install mopidy-scrobbler==1.2.0
# Unreleased mopidy-soundcloud has some useful fixes.
pip install --no-deps --upgrade https://github.com/mopidy/mopidy-soundcloud/archive/faeb6710980f12b50b03bf78c1878be751b8e21a.zip
pip install mopidy-dirble==1.3.0
pip install mopidy-podcast==2.0.1
pip install mopidy-podcast-itunes==2.0.0
pip install mopidy-internetarchive==2.0.3
pip install mopidy-tidal==0.2.2

















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
