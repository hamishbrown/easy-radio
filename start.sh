#!/bin/bash

# start Icecast in background
icecast2 -b -c /radio/icecast.xml

# start liquidsoap
liquidsoap /radio/live.liq