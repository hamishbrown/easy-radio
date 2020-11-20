FROM ubuntu

ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
&& apt-get update && apt-get install -y -q --no-install-recommends liquidsoap \
&& apt-get install -y -q --no-install-recommends icecast2 \
&& apt-get clean && rm -r /var/lib/apt/lists/* \
&& usermod -aG icecast liquidsoap && chmod -R a+w /var/log/icecast2 \
&& mkdir /usr/share/liquidsoap/1.4.1 \
&& ln -s /usr/share/liquidsoap/libs /usr/share/liquidsoap/1.4.1/

USER liquidsoap

WORKDIR /radio 

COPY icecast.xml live.liq start.sh  ./

EXPOSE 8000

ENTRYPOINT ["/radio/start.sh"]