#!/bin/bash

echo Live-stream secret: $1

echo Live-stream INPUT_AUDIO_FORMAT: ${INPUT_AUDIO_FORMAT}
echo Live-stream INPUT_AUDIO_STREAM: ${INPUT_AUDIO_STREAM}

echo Live-stream INPUT_VIDEO_FORMAT: ${INPUT_VIDEO_FORMAT}
echo Live-stream INPUT_VIDEO_STREAM: ${INPUT_VIDEO_STREAM}

echo Live-stream OUTPUT_ACODEC: ${OUTPUT_ACODEC}
echo Live-stream OUTPUT_VCODEC: ${OUTPUT_VCODEC}

avconv \
  -re \
  -ar 44100 \
  -ac 2 \

  -f ${INPUT_AUDIO_FORMAT} \
  -i ${INPUT_AUDIO_STREAM} \
  -acodec pcm_s16le \

  -f ${INPUT_VIDEO_FORMAT} \
  -i ${INPUT_VIDEO_STREAM} \

  -vcodec ${OUTPUT_VCODEC} \
  -acodec ${OUTPUT_ACODEC} \
  -ab 128k \
  -g 50 \
  -strict experimental \
  -f flv rtmp://a.rtmp.youtube.com/live2/$1
