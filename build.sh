#!/bin/bash

echo "================================="
echo "   Cytus II DB Build Tool V2.0   "
echo "          A.R.C.  Tech.          "
echo "================================="

# clean build
rm -rf ./web/public/data ./web/public/audios ./web/public/images ./web/public/videos

mkdir ./res/converted
mkdir ./res/converted/data
mkdir ./res/converted/data/imposts
mkdir ./res/converted/data/osfiles
mkdir ./res/converted/data/subtitles
mkdir ./res/converted/audios
mkdir ./res/converted/audios/bgms
mkdir ./res/converted/audios/sounds
mkdir ./res/converted/audios/story
mkdir ./res/converted/audios/extra
mkdir ./res/converted/images
mkdir ./res/converted/images/imfiles
mkdir ./res/converted/images/osfiles
mkdir ./res/converted/images/imavatars
mkdir ./res/converted/images/osavatars
mkdir ./res/converted/images/osspecial

# script
python parse.py $1

# static
cp -r ./res/export/images ./web/public
cp -r ./res/export/videos ./web/public
cp -r ./res/converted/data ./web/public
cp -r ./res/converted/audios ./web/public
cp -r ./res/converted/images ./web/public

# raw assets
cp -r ./res/export/assets/game/15_os/bundleassets/osstickers ./web/public/images

cd ./web && npm i && npm run build