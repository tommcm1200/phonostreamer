#!/usr/bin/liquidsoap
# set the path and permissions for the logfile
set("log.file.path","/var/log/liquidsoap/phono.log")
set("log.file.perms",777)
set("log.unix_timestamps",true)
#input from soundcard
phono = input.alsa(bufferize=true,fallible=false,device="plughw:1,0")
#stream it to local icecast, default port and password
# output.icecast(%ogg(%flac(samplerate=44100,channels=2,compression=5,bits_per_sample=16)), mount="/phono", name="Phono", format="audio/ogg", description="Turntable FLAC", url="http://192.168.7.155&#8221", genre = "Misc", phono)
# output.icecast(%ogg(%flac(samplerate=44100,channels=2,compression=5,bits_per_sample=16)), mount="/phono", name="Phono", format="audio/ogg", description="Turntable FLAC", host = "localhost", port=8000, password="J5FeedBack", genre = "Misc", phono)

output.icecast(%mp3.vbr,samplerate=44100,channels=2,compression=5,bits_per_sample=16)), mount="/phono", name="Phono", format="audio/ogg", description="Turntable FLAC", host = "localhost", port=8000, password="J5FeedBack", genre = "Misc", phono)
