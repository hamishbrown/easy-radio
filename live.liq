set("log.stdout", true)

output.icecast(%mp3,
    host = "localhost", port = 8000, password = getenv("ICECAST_PASS"),
    mount = "radio", normalize(mksafe(playlist("/tracks"))))
