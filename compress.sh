#!/bin/bash

cd output
docker run  --rm -v $(pwd)/:/var/workdir/ kolyadin/pngquant  --force --ext .png *.png

