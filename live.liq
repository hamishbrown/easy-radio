set("log.stdout", true)
#set("log.file.path","/radio/live.log") # Optional. Path to Liquidsoap logfile

output.icecast(%mp3(bitrate=128),
    host = "localhost", port = 8000, password = getenv("ICECAST_PASS"),
    mount = "radio", normalize(mksafe(playlist("/tracks"))))