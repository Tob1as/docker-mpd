FROM arm32v7/alpine:3.11

LABEL org.opencontainers.image.authors="Tobias Hargesheimer <docker@ison.ws>" \
	org.opencontainers.image.title="MPD" \
	org.opencontainers.image.description="AlpineLinux with MPD on arm arch" \
	org.opencontainers.image.licenses="Apache-2.0" \
	org.opencontainers.image.url="https://hub.docker.com/r/tobi312/rpi-mpd" \
	org.opencontainers.image.source="https://github.com/Tob1asDocker/rpi-mpd"

RUN set -eux ; \
	apk --no-cache add \
		mpd \
		mpc \
	; \
	mkdir /var/log/mpd/data/ ; \
	chown -R mpd:audio /var/lib/mpd ; \
	mkdir -p /run/mpd/ ; \
	chown -R mpd:audio /run/mpd/ ; \
	#chown mpd:audio /etc/mpd.conf ; \
	cp /etc/mpd.conf /etc/mpd.conf.backup

COPY mpd.conf /etc/mpd.conf

VOLUME ["/var/lib/mpd"]

EXPOSE 6600 8000

CMD ["/usr/bin/mpd", "--no-daemon", "--stdout", "/etc/mpd.conf"]
