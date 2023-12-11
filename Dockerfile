FROM lsiobase/alpine:3.18

ENV DOCKER_MODS=linuxserver/mods:universal-cron

COPY docker/root/ /

RUN apk add yt-dlp