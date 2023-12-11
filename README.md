# YTDL Cron Docker

Sets up [LinuxServer.io alpine base image](https://github.com/linuxserver/docker-baseimage-alpine) with the [universal-cron mod](https://github.com/linuxserver/docker-mods/tree/universal-cron) enabled and [YT-DLP](https://github.com/yt-dlp/yt-dlp) installed.

Used to have yt-dlp peform some action at an interval based on cron.

## Usage

Mount a volume at the container path `/config`. The file `/config/crontabs/abc` will be created if it does not exist. Don't forget to set your [PUID and PGID for correct file permissions!](https://docs.linuxserver.io/general/understanding-puid-and-pgid/)

Add a cron express and yt-dlp command in `/config/crontabs/abc`. Restart the container for changes to the cron file to take effect.

EX:

```
# min   hour    day     month   weekday command
*/2 * * * * yt-dlp http://example.com/live -x --audio-format mp3 --audio-quality 3 --download-sections "*0-30" -o "/config/streams/%(epoch>%Y-%m-%d--%H-%M-%S)s-test.mp3"
```

Every 2nd minute of the hour ytdl will download from `http://example.com/live` for 30 seconds and convert to mp3, saving at `/config/streams/[Y-M-D--H-M-S]-test.mp3`