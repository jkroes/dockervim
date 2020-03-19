#!/usr/bin/env fish

docker run -it \
 --rm \
 -v (realpath (dirname (status --current-filename)))/nvim:/home/developer/.config/nvim \
 -v (realpath (dirname (status --current-filename)))/fish:/home/developer/.config/fish \
 --mount source=r_pkgs,target=/usr/local/lib/R/site-library \
 jkroes92/dockervim