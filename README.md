# MPD - Music Player Daemon (Docker Image)

### Supported tags
-	[`debian` (*Dockerfile*)](https://github.com/Tob1as/docker-mpd/blob/master/debian.Dockerfile)
-	[`alpine` (*Dockerfile*)](https://github.com/Tob1as/docker-mpd/blob/master/alpine.Dockerfile) (Recommended, small image)

Alternatively use this MPD Docker image: https://github.com/giof71/mpd-alsa-docker

### What is MPD?
Music Player Daemon (MPD) is a free and open music player server. It plays audio files, organizes playlists and maintains a music database. In order to interact with it, a client program is needed. The MPD distribution includes mpc, a simple command line client.
> [wikipedia.org/wiki/Music_Player_Daemon](https://en.wikipedia.org/wiki/Music_Player_Daemon) 

### About these images:
* based on official Images: [debian](https://hub.docker.com/_/debian) and [alpine](https://hub.docker.com/_/alpine)
* It always uses the latest version contained in the distributions.
* More infromation about MPD: [musicpd.org](https://www.musicpd.org/) and [github.com/MusicPlayerDaemon/MPD](https://github.com/MusicPlayerDaemon/MPD)

### How to use this image
```sh
docker run --name mpd \
-p 6600:6600 -p 8000:8000 \
--device=/dev/snd:/dev/snd \
--cap-add=sys_nice \
-v $(pwd)/music:/var/lib/mpd/music:rw \
-v $(pwd)/playlists:/var/lib/mpd/playlists:rw \
-v $(pwd)/data:/var/lib/mpd/data:rw \
-d tobi312/rpi-mpd:alpine
```

optional (own config): 
1. download [mpd.conf](https://github.com/Tob1as/docker-mpd/blob/master/mpd.conf) and edit
2. add to docker run command: ``` -v $(pwd)/mpd.conf:/etc/mpd.conf ```


http://localhost:8000 for Stream | Host: Host/IP , Port: 6600 for MPD Client.

**Clients**:  
List of MPD Clients you can find here: https://www.musicpd.org/clients/  
Examples: [mympd](https://github.com/jcorporation/myMPD) or [ampd](https://github.com/rain0r/ampd), see [docker-compose.yml](https://github.com/Tob1as/docker-mpd/blob/master/docker-compose.yml)-File.

#### Docker-Compose

```yaml
version: '2.4'
services:
  mpd:
    #image: tobi312/rpi-mpd:debian
    image: tobi312/rpi-mpd:alpine
    container_name: mpd
    restart: unless-stopped
    ports:
      - 6600:6600  # MPD Client
      - 8000:8000  # Stream
    volumes:
      - ./Music:/var/lib/mpd/music:rw
      - ./playlists:/var/lib/mpd/playlists:rw
      - ./data:/var/lib/mpd/data:rw
      #- ./mpd.conf:/etc/mpd.conf:rw
    devices:
      - "/dev/snd:/dev/snd"
```

#### Troubleshooting

<details>
<summary>"Permission denied" in logs</summary>
<p>
  
Solution:
```sh
mkdir {Music,playlists,data} && chmod 777 {Music,playlists,data}
```
</p>
</details>

### This Image on
* [DockerHub](https://hub.docker.com/r/tobi312/rpi-mpd)
* [GitHub](https://github.com/Tob1as/docker-mpd)
