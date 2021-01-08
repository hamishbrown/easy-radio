set("log.stdout", true)
#set("log.file.path","/radio/live.log") # Optional. Path to Liquidsoap logfile

output.icecast(%fdkaac(channels=2, samplerate=44100, bitrate=64, afterburner=false, transmux="adts", sbr_mode=false),
    host = "localhost", port = 8000, password = getenv("ICECAST_PASS"),
    mount = "radio", normalize(mksafe(playlist("/tracks"))))