#!/bin/bash
# Rebuild explainer.mp4 from the slides.
# Usage: bash build.sh   (run after python3 make_slides.py)
ffmpeg -y -v error \
  -loop 1 -t 10 -i slides/s1.png -loop 1 -t 10 -i slides/s2.png \
  -loop 1 -t 10 -i slides/s3.png -loop 1 -t 10 -i slides/s4.png \
  -loop 1 -t 10 -i slides/s5.png -loop 1 -t 10 -i slides/s6.png \
  -filter_complex "[0:v][1:v][2:v][3:v][4:v][5:v]concat=n=6:v=1:a=0,fade=t=in:st=0:d=0.5,fade=t=out:st=59.5:d=0.5,format=yuv420p[v]" \
  -map "[v]" -r 30 -c:v libx264 -crf 23 -preset veryfast explainer.mp4
