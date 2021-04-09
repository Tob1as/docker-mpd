# MPD (Music Player Daemon) on Raspberry Pi / ARM

### Supported tags
-	[`debian` (*Dockerfile*)](https://github.com/Tob1asDocker/rpi-mpd/blob/master/debian.armhf.Dockerfile) (Debian 10 Buster (Slim))
-	[`alpine` (*Dockerfile*)](https://github.com/Tob1asDocker/rpi-mpd/blob/master/alpine.armhf.Dockerfile) (on [AlpineLinux](https://pkgs.alpinelinux.org/package/v3.13/community/armhf/mpd) 3.13)
-	[`alpine-nocap` (*Dockerfile*)](https://github.com/Tob1asDocker/rpi-mpd/blob/master/alpine.armhf.3_11.Dockerfile) (on [AlpineLinux](https://pkgs.alpinelinux.org/package/v3.11/community/armhf/mpd) 3.11)

### What is MPD?
Music Player Daemon (MPD) is a free and open music player server. It plays audio files, organizes playlists and maintains a music database. In order to interact with it, a client program is needed. The MPD distribution includes mpc, a simple command line client.
> [wikipedia.org/wiki/Music_Player_Daemon](https://en.wikipedia.org/wiki/Music_Player_Daemon) 

### About these images:
* based on official Images: [debian](https://hub.docker.com/_/debian) and [alpine](https://hub.docker.com/_/alpine)
* It always uses the latest version contained in the distributions.
* More infromation about MPD: [musicpd.org](https://www.musicpd.org/) and [github.com/MusicPlayerDaemon/MPD](https://github.com/MusicPlayerDaemon/MPD)

### How to use this image
```sh
docker run --name mpd -p 6600:6600 -p 8000:8000 --device=/dev/snd:/dev/snd --cap-add=sys_nice -v $(pwd)/music:/var/lib/mpd/music:rw -v $(pwd)/playlists:/var/lib/mpd/playlists:rw -v $(pwd)/playlists:/var/lib/mpd/playlists:rw -v $(pwd)/data:/var/lib/mpd/data:rw -d tobi312/rpi-mpd:debian
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
    #image: tobi312/rpi-mpd:alpine
    #image: tobi312/rpi-mpd:alpine-nocap
    container_name: mpd
    ports:
      - 6600:6600
      - 8000:8000
    volumes:
      - ./music:/var/lib/mpd/music:rw
      - ./playlists:/var/lib/mpd/playlists:rw
      - ./data:/var/lib/mpd/data:rw
      #- ./mpd.conf:/etc/mpd.conf:rw
    devices:
      - "/dev/snd:/dev/snd"
    cap_add:
      - SYS_NICE
    restart: unless-stopped
```

#### Troubleshooting

<details>
<summary>If your container fails to start with Images that based on Alpine 3.13 or newer Debian/Ubuntu on ARM devices...</summary>
<p>

... with Raspbian/Debian 10 Buster (32 bit) then update `libseccomp2`[*](https://packages.debian.org/buster-backports/libseccomp2) to >=2.4.4 and restart the container. (Source: [1](https://docs.linuxserver.io/faq#libseccomp), [2](https://github.com/owncloud/docs/pull/3196#issue-577993147), [3](https://github.com/moby/moby/issues/40734))  
  
Example (wrong date):
```sh
$ docker run --rm --name testing -it alpine:3.13 date
Sun Jan  0 00:100:4174038  1900
```
  
Solution:
```sh
 sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 04EE7237B7D453EC 648ACFD622F3D138
 echo "deb http://deb.debian.org/debian buster-backports main" | sudo tee -a /etc/apt/sources.list.d/buster-backports.list
 sudo apt update
 sudo apt install -t buster-backports libseccomp2
```
</p>
</details>

<details>
<summary>"Permission denied" in logs</summary>
<p>
  
Solution:
```sh
mkdir {music,playlists,data} && chmod 777 {music,playlists,data}
```
</p>
</details>

### This Image on
* [DockerHub](https://hub.docker.com/r/tobi312/rpi-mpd)
* [GitHub](https://github.com/Tob1asDocker/rpi-mpd)
