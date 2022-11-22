FROM alpine:3.16

ARG VERSION

RUN set -ex && \
    apk add --no-cache libcap mpd mpc && \
    setcap -r /usr/bin/mpd && \
    apk del libcap && \
    mkdir -p /var/lib/mpd/playlists && \
    mkdir -p /music && \
    touch /var/lib/mpd/database \
        /var/lib/mpd/mpd.pid \
        /var/lib/mpd/state \
        /var/lib/mpd/sticker.sql

COPY mpd.conf /etc/mpd.conf

VOLUME /var/lib/mpd

EXPOSE 6600 8000

CMD ["mpd", "--stdout", "--no-daemon"]

