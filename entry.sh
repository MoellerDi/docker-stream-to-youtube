#!/bin/bash

echo Live-stream secret: $1

echo Live-stream INPUT_AUDIO_FORMAT: ${INPUT_AUDIO_FORMAT}
echo Live-stream INPUT_AUDIO_STREAM: ${INPUT_AUDIO_STREAM}

echo Live-stream INPUT_VIDEO_FORMAT: ${INPUT_VIDEO_FORMAT}
echo Live-stream INPUT_VIDEO_STREAM: ${INPUT_VIDEO_STREAM}

echo Live-stream OUTPUT_ACODEC: ${OUTPUT_ACODEC}
echo Live-stream OUTPUT_VCODEC: ${OUTPUT_VCODEC}

avconv \
  -re \ # read input at native frame rate
  -ar 44100 \ # set audio sampling rate (in Hz)
  -ac 2 \ # set number of audio channels

  -f ${INPUT_AUDIO_FORMAT} \ # Force input format
  -i ${INPUT_AUDIO_STREAM} \ # input source
  -acodec pcm_s16le \

  -f ${INPUT_VIDEO_FORMAT} \ # Force input format 
  -i ${INPUT_VIDEO_STREAM} \ # input source

  -vcodec ${OUTPUT_VCODEC} \ # Set the video codec
  -acodec ${OUTPUT_ACODEC} \ # Set the audio codec
  -ab 128k \
  -g 50 \ # set the group of picture (GOP) size
  -strict experimental \ # allow non-standardized experimental things
  -f flv rtmp://a.rtmp.youtube.com/live2/$1
