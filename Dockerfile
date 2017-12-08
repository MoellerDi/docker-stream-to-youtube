FROM debian

RUN apt-get update && apt-get -qy install \
  libav-tools && \
  rm -rf /var/lib/apt/lists/*

COPY entry.sh	/root/
RUN chmod +x /root/entry.sh

## --- ENV ---
ENV \
    INPUT_VIDEO=http://octopi.local:8080/?action=stream \
    INPUT_VCODEC=h264 \
    INPUT_AUDIO=/dev/zero \
    INPUT_ACODEC=aac

ENTRYPOINT ["/root/entry.sh"]