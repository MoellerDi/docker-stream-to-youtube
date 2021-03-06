FROM debian

RUN apt-get update && apt-get -qy install \
  libav-tools && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /root/
COPY entry.sh	./
RUN chmod +x ./entry.sh

ENTRYPOINT ["./entry.sh"]
