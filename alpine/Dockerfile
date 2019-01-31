FROM balenalib/raspberry-pi-alpine:3.6

MAINTAINER Tobias Hargesheimer <docker@ison.ws>

RUN [ "cross-build-start" ]

RUN set -x && apk --no-cache add \
	mpd \
	mpc \
	&& mkdir -p /mpd/conf/ && mkdir -p /mpd/music && mkdir -p /mpd/playlists && mkdir -p /mpd/data && mkdir -p /run/mpd/ \
	&& chown -R mpd:audio /mpd && chown -R mpd:audio /run/mpd/

COPY mpd.conf /mpd/conf/mpd.conf

RUN [ "cross-build-end" ]

VOLUME ["/mpd/conf","/mpd/music","/mpd/playlists","/mpd/data","/run/mpd"]
 
EXPOSE 6600 8000

ENTRYPOINT ["/usr/bin/mpd", "--no-daemon", "--stdout", "/mpd/conf/mpd.conf"]
