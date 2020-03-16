# Dockerfile inspired by http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/
# macOS docker GUI instructions provided by https://cntnr.io/running-guis-with-docker-on-mac-os-x-a14df6a76efc
# Reudce size of docker layer by removing results of apt-get update:
# rm -r /var/lib/apt/lists/*

FROM ubuntu:18.04

# Password
ARG pass

# Convert Ubuntu minimal image to Ubuntu server
# Installs e.g. man pages and tzdata
RUN yes | unminimize

# Noninteractive apt-install and dpkg-reconfigure during build-time only
ARG DEBIAN_FRONTEND=noninteractive

# Future interactive installations (apt-utils already installed)
RUN apt-get update &&\
    apt-get install -y debconf-utils &&\
    rm -r /var/lib/apt/lists/*

# Generate and set locale to UTF-8
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen &&\
    locale-gen

ENV LC_ALL en_US.UTF-8

# Set timezone to Los Angeles
RUN ln -fs /usr/share/zoneinfo/America/Los_Angeles /etc/localtime &&\
    dpkg-reconfigure tzdata

# Create user and home directory
RUN useradd -m developer &&\
    # Grant user access to e.g. /usr/local/lib/R/site-library
    adduser developer staff &&\
    # Create user password
    echo "developer:$pass" | chpasswd &&\
    # Enable sudo
    echo "developer ALL=(ALL) ALL" > /etc/sudoers.d/developer &&\
    chmod 0440 /etc/sudoers.d/developer
    
# Get add-apt command for installation from external repositories
RUN apt-get update &&\
    apt-get install -y software-properties-common &&\
    rm -r /var/lib/apt/lists/*

# Install R (from CRAN-maintained repo)
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 &&\
    apt-add-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/' &&\
    apt-get update &&\
    apt-get install -y r-base libcurl4-openssl-dev libssl-dev libxml2-dev &&\
    rm -r /var/lib/apt/lists/*


# Pip isn't installed with Python
RUN apt-get update &&\
    apt-get install -y python3-pip &&\
    rm -r /var/lib/apt/lists/*

# Use the fish shell (ppa req'd to get completion)
RUN apt-add-repository ppa:fish-shell/release-3 &&\
    apt-get update &&\
    apt-get install -y fish &&\
    rm -r /var/lib/apt/lists/*

RUN chsh -s /usr/bin/fish developer
ENV SHELL /usr/bin/fish

# Install neovim
RUN apt-get update &&\
    apt-get install -y neovim-qt curl git &&\
    rm -r /var/lib/apt/lists/*
    
# Change user from sudo to developer before creating files/directories
USER developer

# Set working directory for shorter paths in this file and for container startup
WORKDIR /home/developer

# Configure neovim
RUN mkdir -p .config/nvim &&\
    mkdir -p .cache/dein &&\
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh &&\
    chmod +x installer.sh &&\
    ./installer.sh /home/developer/.cache/dein &&\
    rm installer.sh

# Start interactive sessions in a fish shell
CMD ["fish", "--login"]

# R packages
# RUN R -e 'install.packages("tidyverse")'

# TODO: Find work documents on R-linux directories and earlier emacs notes on R environment variables

########## NOTES ##############
# Timezone bug: https://bugs.launchpad.net/ubuntu/+source/tzdata/+bug/1554806

# useradd edits /etc/passwd, /etc/shadow, /etc/group, and /etc/gshadow (uid, gid default to 1000; shell defaults to sh)
# and creates home directory (-m), which defaults to /home/<user>

# macOS docker auto-maps macOS UIDs to different linux UIDs: 
# https://stackoverflow.com/questions/43097341/docker-on-macosx-does-not-translate-file-ownership-correctly-in-volumes
# If you specify a username, the standard first-user UID/GID of 1000 will be given to the name

# The sudoer syntax: User Host = (Runas) Options Command
# Below we are saying to let developer sudo-run any command as anyone.
# (It's a risky config if anyone ever had access through the web to our docker container but fine otherwise)
# Host simply controls what hosts this would be valid on if this file were present on the host. We say all hosts.
# The NOPASSWD: option can be specified to sudo without a password

# Additional reading:
# https://goinbigdata.com/docker-run-vs-cmd-vs-entrypoint/
# https://lwn.net/Articles/676831/
# https://blog.phusion.nl/2015/01/20/docker-and-the-pid-1-zombie-reaping-problem/