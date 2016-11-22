# Dockerfile for MPD on Raspberry Pi
* https://www.musicpd.org/
* https://github.com/MaxKellermann/MPD

Use:
* ``` git clone REPOSITORY && cd rpi-mpd ```
* Optional: ``` mkdir -p /home/pi/.config/mpd && mkdir -p /home/pi/.local/share/mpd/data && mkdir -p /home/pi/.local/share/mpd/playlists && chmod 777 -R /home/pi/.local/share/mpd/ && cp mpd.conf /home/pi/.config/mpd/ ```
* ``` docker build -t rpi-mpd . ``` 
* ``` docker run --name mpd -v /home/pi/.config/mpd:/mpd/conf -v /home/pi/.local/share/mpd/data:/mpd/data -v /home/pi/.local/share/mpd/playlists:/mpd/playlists -v /home/pi/Music:/mpd/music:ro -p 6600:6600 -p 8000:8000 rpi-mpd ``` 
* http://localhost:8000 for Stream | Host: localhost , Port: 6600 for MPD Client [Auremo](https://auremo.codeplex.com/) or [GMPC](https://gmpclient.org/)