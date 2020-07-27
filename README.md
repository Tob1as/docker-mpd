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
```sh
docker run --name mpd -p 6600:6600 -p 8000:8000 --device=/dev/snd:/dev/snd -v $(pwd)/music:/var/lib/mpd/music:rw -v $(pwd)/playlists:/var/lib/mpd/playlists:rw -v $(pwd)/playlists:/var/lib/mpd/playlists:rw -v $(pwd)/data:/var/lib/mpd/data:rw -d tobi312/rpi-mpd:latest
```

optional (own config): 
1. download [mpd.conf](https://github.com/Tob1asDocker/rpi-mpd/blob/master/mpd.conf) and edit
2. add to docker run command: ``` -v $(pwd)/mpd.conf:/etc/mpd.conf ```

http://localhost:8000 for Stream | Host: Host/IP , Port: 6600 for MPD Client.  
Example Client: [MPDroid(Android)](https://play.google.com/store/apps/details?id=com.namelessdev.mpdroid), more see https://www.musicpd.org/clients/

#### Docker-Compose

```yaml
version: '2.4'
services:
  mpd:
    image: tobi312/rpi-mpd:latest
    container_name: mpd
    ports:
      - 6600:6600
      - 8000:8000
    volumes:
      - ./music:/var/lib/mpd/music:rw
      - ./playlists:/var/lib/mpd/playlists:rw
      #- ./data:/var/lib/mpd/data:rw
      #- /etc/timezone:/etc/timezone:ro
      #- /etc/localtime:/etc/localtime:ro
    devices:
      - "/dev/snd:/dev/snd"
    restart: unless-stopped
```

### This Image on
* [DockerHub](https://hub.docker.com/r/tobi312/rpi-mpd)
* [GitHub](https://github.com/Tob1asDocker/rpi-mpd)
