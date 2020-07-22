#!/bin/bash

cd output
docker run -it --rm -v $(pwd)/:/var/workdir/ kolyadin/pngquant --verbose --force --ext .png *.png

