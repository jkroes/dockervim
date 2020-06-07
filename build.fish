#!/usr/bin/env fish
# Call this script with password as sole argument

# Should work even with spaces in path
set -l rootdir (realpath (dirname (status --current-filename)))

docker build -t jkroes92/dockervim:latest --build-arg pass=$argv[1] "$rootdir"

# Clear docker volumes storing persistent but replaceable data (e.g., R packages)
if docker volume ls | grep r_pkgs  > /dev/null
    docker volume rm r_pkgs  > /dev/null
    docker volume create r_pkgs  > /dev/null
end
if docker volume ls | grep home  > /dev/null
    docker volume rm home  > /dev/null
    docker volume create home  > /dev/null
end


# Clear application history files from bind mounts holding persistent and irreplaceable data (e.g., config and scripts)

rm -f "$rootdir/nvim/.netrwhist"
