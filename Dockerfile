FROM savonet/liquidsoap:v1.4.3

RUN apt-get update \
   && apt-get install -y -q --no-install-recommends \
      icecast2 \
   && apt-get clean \
   && rm -r /var/lib/apt/lists/* \
   && usermod -aG icecast liquidsoap && chmod -R a+w /var/log/icecast2

USER liquidsoap

WORKDIR /radio 

COPY icecast.xml live.liq start.sh  ./

EXPOSE 8000

ENTRYPOINT ["/radio/start.sh"]