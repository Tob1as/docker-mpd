# MPD (Music Player Daemon) on Raspberry Pi / ARM

### Supported tags
-	[`latest` (*Dockerfile*)](https://github.com/Tob1asDocker/rpi-mpd/blob/master/debian.armhf.Dockerfile) (Debian 10 Buster (Slim))
-	[`alpine` (*Dockerfile*)](https://github.com/Tob1asDocker/rpi-mpd/blob/master/alpine.armhf.Dockerfile) (on [AlpineLinux](https://pkgs.alpinelinux.org/package/v3.12/community/armhf/mpd) 3.12)

### What is MPD?
Music Player Daemon (MPD) is a free and open music player server. It plays audio files, organizes playlists and maintains a music database. In order to interact with it, a client program is needed. The MPD distribution includes mpc, a simple command line client.
> [wikipedia.org/wiki/Music_Player_Daemon](https://en.wikipedia.org/wiki/Music_Player_Daemon) 

### About these images:
* based on official Images: [arm32v7/debian](https://hub.docker.com/r/arm32v7/debian/) and [arm32v7/alpine](https://hub.docker.com/r/arm32v7/alpine/)
* It always uses the latest version contained in the distributions.
* More infromation about MPD: [musicpd.org](https://www.musicpd.org/) and [github.com/MusicPlayerDaemon/MPD](https://github.com/MusicPlayerDaemon/MPD)

### How to use this image
``` docker run --name mpd \-p 6600:6600 -p 8000:8000 -v $(pwd)/music:/var/lib/mpd/music:rw -v $(pwd)/playlists:/var/lib/mpd/playlists:rw -v $(pwd)/playlists:/var/lib/mpd/playlists:rw -v :$(pwd)/db:/var/lib/mpd/db:rw tobi312/rpi-mpd:latest ```

optional: 
* download mpd.conf and edit: [mpd.conf](https://github.com/Tob1asDocker/rpi-mpd/blob/master/mpd.conf)
* add to docker run command: ``` -v :$(pwd)/mpd.conf:/etc/mpd.conf ```
* example for device: ```--device=/dev/snd:/dev/snd```

http://localhost:8000 for Stream | Host: Host/IP , Port: 6600 for MPD Client, example: [GMPC](https://gmpclient.org/) or [MPDroid(Android)](https://play.google.com/store/apps/details?id=com.namelessdev.mpdroid)

### This Image on
* [DockerHub](https://hub.docker.com/r/tobi312/rpi-mpd)
* [GitHub](https://github.com/Tob1asDocker/rpi-mpd)
