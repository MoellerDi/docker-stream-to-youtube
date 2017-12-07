FROM ffmpeg

RUN apt-get update && apt-get -qy install \
  libraspberrypi-bin && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /root/
COPY entry.sh	.
RUN chmod +x entry.sh

## --- ENV ---
ENV \
    INPUT_VIDEO=http://octopi.local:8080/?action=stream \
    INPUT_VCODEC=h264 \
    INPUT_AUDIO=/dev/zero \
    INPUT_ACODEC=aac

ENTRYPOINT ["./entry.sh"]