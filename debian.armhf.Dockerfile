FROM arm32v7/debian:buster-slim

LABEL org.opencontainers.image.authors="Tobias Hargesheimer <docker@ison.ws>" \
	org.opencontainers.image.title="MPD" \
	org.opencontainers.image.description="Debian 10 Buster with MPD on arm arch" \
	org.opencontainers.image.licenses="Apache-2.0" \
    org.opencontainers.image.created="${BUILD_DATE}" \
    org.opencontainers.image.revision="${VCS_REF}" \
	org.opencontainers.image.url="https://hub.docker.com/r/tobi312/rpi-mpd" \
	org.opencontainers.image.source="https://github.com/Tob1asDocker/rpi-mpd"

RUN set -eux ; \
	apt-get update ; \
	apt-get install -y \
		mpd \
		mpc \
	; \
	rm -rf /var/lib/apt/lists/* ; \
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
