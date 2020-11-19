# easy-radio
Docker image to easily setup an internet radio station using liquidsoap and icecast

- [Liquidsoap 1.4.3](https://www.liquidsoap.info/doc-1.4.3/) *
- [Icecast 2.4.4](https://icecast.org/docs/icecast-2.4.1/)

## Start container
### Using **docker-compose**
Update `docker-compose.xml` with the path to your music folder
```
version: "2"
services:
  radio:
    image: hamishbrown/easy-radio:latest
    restart: unless-stopped
    environment: 
      - TZ=Europe/Dublin
      - ICECAST_PASS=hackme # change in icecast.xml and update here
    ports:
      - 8000:8000
    volumes:
      - </path/to/music/folder>:/tracks:ro     # REQUIRED: update with the path to your host music folder
      - ./icecast.xml:/radio/icecast.xml:rw   # optional: use to override icecast defaults. Recommended to change default password
      - ./live.liq:/radio/live.liq:rw         # optional: override to use your own script

```
Start container
```
docker-compose up -d
```
### Using **docker**
Start container
```
docker run -d -p 8000:8000  -e ICECAST_PASS=hackme -v </path/to/music/folder>:/tracks:ro hamishbrown/easy-radio:latest
```
## Enjoy
Wait a few seconds depending on the number of tracks in your music folder

Open your browser at
```
http://localhost:8000/radio
```
### Optional
Use `radio.subdomain.conf` with [linuxserver/swag](https://hub.docker.com/r/linuxserver/swag)

----------
## Build Your Own
Clone the repo
```
git clone https://github.com/hamishbrown/easy-radio.git
```
Build the image
```bash
docker build -t hamishbrown/easy-radio ./easy-radio
```

 \* arm32v7 image uses [Liquidsoap 1.4.1](https://www.liquidsoap.info/doc-1.4.1/)