#!/bin/bash

echo Live-stream secret: $1

echo Live-stream INPUT_VIDEO: ${INPUT_VIDEO}
echo Live-stream INPUT_VCODEC: ${INPUT_VCODEC}
echo Live-stream INPUT_AUDIO: ${INPUT_AUDIO}
echo Live-stream INPUT_ACODEC: ${INPUT_ACODEC}

# ffmpeg -f mjpeg \
#   -i ${INPUT_VIDEO} \
#   -an \
#   -vcodec ${INPUT_VCODEC} \
#   -ar 44100 \
#   -ac 2 \
#   -acodec pcm_s16le \
#   -f s16le \
#   -ac 2 \
#   -i ${INPUT_AUDIO} \
#   -acodec ${INPUT_ACODEC} \
#   -ab 128k \
#   -g 50 \
#   -strict experimental \
#   -f flv rtmp://a.rtmp.youtube.com/live2/$1

avconv \
  -re \
  -ar 44100 \
  -ac 2 \
  -acodec pcm_s16le \
  -f s16le \
  -ac 2 \
  -i ${INPUT_AUDIO} \
  -f h264 \
  -i ${INPUT_VIDEO} \
  -vcodec ${INPUT_VCODEC} \
  -acodec ${INPUT_ACODEC} \
  -ab 128k \
  -g 50 \
  -strict experimental \
  -f flv rtmp://a.rtmp.youtube.com/live2/$1
