#!/usr/bin/env fish

# Build process:
# docker build -t jkroes92/dockervim:latest --build-args passwd=<passwd> <path-to-dockerfile> > dv_log
# docker volume create r_pkgs
# Then you can run this script
# In Ubuntu, run nvim-qt, or use the shell as you would a normal linux instance

open -a Xquartz
# Wait for X11 shell window to open to close it; only an estimate on time req'd
sleep 8
# Close X11 shell window that closes up (change this if using a different shell based on output of wmctrl -l)
wmctrl -ic (wmctrl -l | grep fish | cut -d' ' -f1)
set ip (ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
xhost + $ip
docker run -it \
 --rm \
 -e DISPLAY=$ip:0 \
 -v (realpath (dirname (status --current-filename)))/nvim:/home/developer/.config/nvim \
 -v (realpath (dirname (status --current-filename)))/fish:/home/developer/.config/fish \
 --mount source=r_pkgs,target=/usr/local/lib/R/site-library \
 jkroes92/dockervim
osascript -e 'quit app "XQuartz"'

# https://gist.github.com/rizkyario/dbf69c21f2e8e3251d3aa7848ee69990
# https://cntnr.io/running-guis-with-docker-on-mac-os-x-a14df6a76efc
# Note that this is a "volume,"
# while -v is a "drive mount." Both are a form of data persistence, but volumes are meant to be managed
# exclusively by docker and are stored in a particular part of the host filesystem, while bind mounts can
# be managed by users directly and can be anywhere the user chooses on the host. Bind mounts are best for
# sharing data between host and container, while volumes are best for simply persisting data across
# containers. 

# TODO: Mounting a volume in docker run overwrites changes to the volume that result from changes to the dockerfile.
# See docker volume prune or docker system prune -a --volumes (rm volumes not referenced by any containers)