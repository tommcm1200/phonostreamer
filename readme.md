


http://morituri.c1.biz/content/raspberry-pi/How_to_compile_ffmpeg_on_a_raspberry_pi_(with_x264,_mp3_and_aac_encoding).php

https://www.sr3d.co.uk/darkice-setup.html

git clone https://github.com/mstorsjo/fdk-aac.git 

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install icecast2 pkg-config autoconf automake libtool yasm liquidsoap


./autogen.sh
./configure --enable-shared --enable-static
sudo make -j4
sudo make install
sudo ldconfig




/home/pi/phonostreamer/phono.liq

chmod 777 /run/liquidsoap
/etc/init.d/liquidsoap start