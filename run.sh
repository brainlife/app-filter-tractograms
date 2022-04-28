#!/bin/bash

track=`jq -r '.track' config.json`
labels=`jq -r '.labels' config.json`

[ ! -d ./filtered_track ] && mkdir -p filtered_track

[ ! -f ./filtered_track/track.tck ] && connectome2tck ${track} ${labels} ./filtered_ -nodes 1 -exclusive -keep_self -nthreads 8 && mv ./filtered_*.tck ./filtered_track/track.tck

[ ! -f ./filtered_track/track.tck ] && echo "something went wrong. check derivatives" && exit 1 || echo "complete!" && exit 0
