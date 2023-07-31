#!/home/pi/.opam/default/bin/liquidsoap
# set the path and permissions for the logfile
set("log.file.path","/var/log/liquidsoap/phono.log")
set("log.file.perms",777)
set("log.unix_timestamps",true)
#input from soundcard
phono = input.alsa(bufferize=true,fallible=false,device="plughw:1,0")
#stream it to local icecast, default port and password

output.icecast(%mp3(bitrate=320),
host = "localhost", port = 8000,
password = "password", mount = "stream.mp3",
name="Phono Stream", description="Phono Stream.",
phono)

output.icecast(%ogg(%flac(samplerate=44100,
        channels=2,
        compression=5,
        bits_per_sample=16)), 
host="localhost",port=8000,password="password",
mount="stream.flac",
name="Phono Stream", description="Phono Stream.",
phono
)

# output.icecast(%fdkaac(channels=2, samplerate=44100, bandwidth="auto"),
# host="localhost",port=8000,password="password",
# mount="stream.aac",
# name="Phono Stream", description="Phono Stream.",
# phono)

# output.icecast(%ffmpeg(format="mpegts",
#   %audio(codec="libfdk_aac",samplerate=22050,b="32k",
#          afterburner=1,profile="aac_he_v2")),
# host = "localhost", port = 8000,
# password = "password", mount = "stream.mp3",
# name="myStation Main Stream", description="The myStation main stream.",
# phono)


# %flac(samplerate=44100,
#         channels=2,
#         compression=5,
#         bits_per_sample=16)


