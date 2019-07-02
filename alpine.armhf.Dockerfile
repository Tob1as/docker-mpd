#FROM balenalib/raspberry-pi-alpine:3.9
FROM arm32v6/alpine:3.10

LABEL org.opencontainers.image.authors="Tobias Hargesheimer <docker@ison.ws>" \
	org.opencontainers.image.title="MPD" \
	org.opencontainers.image.description="AlpineLinux with MPD on arm arch" \
	org.opencontainers.image.licenses="Apache-2.0" \
	org.opencontainers.image.url="https://hub.docker.com/r/tobi312/rpi-mpd" \
	org.opencontainers.image.source="https://github.com/Tob1asDocker/rpi-mpd"

#ARG CROSS_BUILD_START=":"
#ARG CROSS_BUILD_END=":"

#RUN [ ${CROSS_BUILD_START} ]

RUN set -x && apk --no-cache add \
	mpd \
	mpc \
	&& mkdir -p /mpd/conf/ && mkdir -p /mpd/music && mkdir -p /mpd/playlists && mkdir -p /mpd/data && mkdir -p /run/mpd/ \
	&& chown -R mpd:audio /mpd && chown -R mpd:audio /run/mpd/

COPY mpd.conf /mpd/conf/mpd.conf

VOLUME ["/mpd/conf","/mpd/music","/mpd/playlists","/mpd/data","/run/mpd"]
 
EXPOSE 6600 8000

ENTRYPOINT ["/usr/bin/mpd", "--no-daemon", "--stdout", "/mpd/conf/mpd.conf"]

#RUN [ ${CROSS_BUILD_END} ]