# MPD (Music Player Daemon) on Raspberry Pi / armhf

### Supported tags
-	[`latest` (*raspbian/Dockerfile*)](https://github.com/TobiasH87Docker/rpi-mpd/blob/master/latest/Dockerfile)
-	[`alpine` (*alpine/Dockerfile*)](https://github.com/TobiasH87Docker/rpi-mpd/blob/master/alpine/Dockerfile)

(*It always uses the latest version contained in the distributions.*)

### What is MPD?
Music Player Daemon (MPD) is a free and open music player server. It plays audio files, organizes playlists and maintains a music database. In order to interact with it, a client program is needed. The MPD distribution includes mpc, a simple command line client.
> [wikipedia.org/wiki/Music_Player_Daemon](https://en.wikipedia.org/wiki/Music_Player_Daemon) , [musicpd.org](https://www.musicpd.org/) and [github.com/MaxKellermann/MPD](https://github.com/MaxKellermann/MPD)

### How to use this image
* ``` $ docker pull tobi312/rpi-mpd ```
* Optional: ``` $ mkdir -p /home/pi/.config/mpd && mkdir -p /home/pi/.local/share/mpd/data && mkdir -p /home/pi/.local/share/mpd/playlists && chmod 777 -R /home/pi/.local/share/mpd/ && touch /home/pi/.config/mpd/mpd.conf ``` and edit optional [mpd.conf](https://github.com/TobiasH87Docker/rpi-mpd/blob/master/mpd.conf)
* ``` $ docker run --name mpd -v /home/pi/.config/mpd:/mpd/conf -v /home/pi/.local/share/mpd/data:/mpd/data -v /home/pi/.local/share/mpd/playlists:/mpd/playlists -v /home/pi/Music:/mpd/music:ro --device=/dev/snd:/dev/snd -p 6600:6600 -p 8000:8000 -d tobi312/rpi-mpd ``` 

or build it yourself
* ``` $ git clone https://github.com/TobiasH87Docker/rpi-mpd.git && cd rpi-mpd ```
* ``` $ docker build -t tobi312/rpi-mpd . ``` 
* Optional: ``` $ mkdir -p /home/pi/.config/mpd && mkdir -p /home/pi/.local/share/mpd/data && mkdir -p /home/pi/.local/share/mpd/playlists && chmod 777 -R /home/pi/.local/share/mpd/ && cp mpd.conf /home/pi/.config/mpd/ ``` and edit optional [mpd.conf](https://github.com/TobiasH87Docker/rpi-mpd/blob/master/mpd.conf)
* ``` $ docker run --name mpd -v /home/pi/.config/mpd:/mpd/conf -v /home/pi/.local/share/mpd/data:/mpd/data -v /home/pi/.local/share/mpd/playlists:/mpd/playlists -v /home/pi/Music:/mpd/music:ro --device=/dev/snd:/dev/snd -p 6600:6600 -p 8000:8000 -d tobi312/rpi-mpd ``` 

* http://localhost:8000 for Stream | Host: Host/IP , Port: 6600 for MPD Client, example: [GMPC](https://gmpclient.org/) or [MPDroid(Android)](https://play.google.com/store/apps/details?id=com.namelessdev.mpdroid)

### This Image on
* [DockerHub](https://hub.docker.com/r/tobi312/rpi-mpd/)
* [GitHub](https://github.com/TobiasH87Docker/rpi-mpd)
