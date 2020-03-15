#!/usr/bin/env fish
open -a Xquartz
set ip (ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
xhost + $ip
docker run -it\
 -e DISPLAY=$ip:0\
 -v ~/unix-modes/nvim:/home/developer/.config/nvim\
 jkroes92/dockervim
# osascript -e 'quit app XQuartz'

# https://gist.github.com/rizkyario/dbf69c21f2e8e3251d3aa7848ee69990
# https://cntnr.io/running-guis-with-docker-on-mac-os-x-a14df6a76efc
