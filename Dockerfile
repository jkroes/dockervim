# TODO: Find work documents on R-linux library dirs and earlier emacs notes on R environment variables

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
    apt-get install -y python-pip python3-pip &&\
    rm -r /var/lib/apt/lists/*

# Use the fish shell (ppa req'd to get completion)
RUN apt-add-repository ppa:fish-shell/release-3 &&\
    apt-get update &&\
    apt-get install -y fish &&\
    rm -r /var/lib/apt/lists/*

ENV SHELL /usr/bin/fish
RUN chsh -s /usr/bin/fish developer

# SHELL ["/usr/bin/fish", "-c"]

# Install curl, git, ag (for vim-ctrlspace), and ruby (Neovim provider)
RUN apt-get update &&\     
    apt-get install -y curl git silversearcher-ag ruby-full &&\
    gem install neovim &&\
    rm -r /var/lib/apt/lists/*

# ripgrep (for vim-clap, :Clap grep)
RUN curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb &&\
    # Seems to solve an issue with a file provided by fish shell
    dpkg-divert --add --divert /usr/share/fish/completions/rg.fish.0 --rename \
    --package ripgrep /usr/share/fish/completions/rg.fish &&\
    dpkg -i ripgrep_11.0.2_amd64.deb &&\
    rm ripgrep_11.0.2_amd64.deb

# fd (needed for vim-clap, :Clap files)
RUN curl -LO https://github.com/sharkdp/fd/releases/download/v7.5.0/fd-musl_7.5.0_amd64.deb &&\
    dpkg -i fd-musl_7.5.0_amd64.deb &&\
    rm fd-musl_7.5.0_amd64.deb

# Install hub
RUN curl -LO https://github.com/github/hub/releases/download/v2.14.2/hub-linux-amd64-2.14.2.tgz &&\
    tar -xf hub-linux-amd64-2.14.2.tgz &&\
    rm -dfr hub-linux-amd64-2.14.2.tgz &&\
    hub-linux-amd64-2.14.2/install &&\
    rm -dfr hub-linux-amd64-2.14.2

# Install universal-ctags
RUN apt-get update &&\     
    apt-get install -y autoconf automake python3-docutils libseccomp-dev libjansson-dev libyaml-dev &&\
    rm -r /var/lib/apt/lists/* &&\
    git clone https://github.com/universal-ctags/ctags &&\
    cd ctags &&\
    ./autogen.sh &&\
    ./configure &&\
    make &&\
    make install &&\
    cd .. &&\
    rm -dfr ctags

# Install nodejs for coc.nvim
RUN curl -sL https://deb.nodesource.com/setup_12.x  | bash - &&\
    apt-get -y install nodejs &&\
    npm install -g neovim

# User-created files and user-installed software
USER developer
WORKDIR /home/developer
COPY .gitconfig .
COPY .ctags .
COPY .gitignore_global .

# Configure hub to run nvim-plugins.fish (global config is user-specific)
RUN git config --global hub.protocol https &&\
    git config --global url."https://github.com/".insteadOf git@githun.com: &&\
    git config --global ur.l"https://".insteadOf git://

# Install Neovim 0.4.3
# TODO: See the spacevim dockerfile for building from source
RUN curl -LO https://github.com/neovim/neovim/releases/download/v0.4.3/nvim.appimage &&\
    chmod u+x nvim.appimage &&\
    ./nvim.appimage --appimage-extract &&\
    rm nvim.appimage &&\
    mkdir apps &&\
    mv squashfs-root apps/nvim &&\
    # https://github.com/roxma/nvim-yarp/issues/21
    # https://github.com/neovim/neovim/wiki/FAQ
    # pip3 install --upgrade neovim
    python -m pip install setuptools &&\
    # The first may be equivalent to the second, but the FAQ recommended this
    python -m pip install --upgrade pynvim &&\
    python2 -m pip install --upgrade pynvim &&\
    python3 -m pip install --upgrade pynvim

# Python packages
RUN pip3 install -U jedi jedi-language-server

# Configure neovim
RUN mkdir -p .config/nvim 
    # mkdir -p .cache/dein &&\
    # curl -LO https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh &&\
    # chmod +x installer.sh &&\
    # ./installer.sh /home/developer/.cache/dein &&\
    # rm installer.sh

# Install Source Code Pro monospaced font (GUI only)
# NOTE: For TUI, install the desired font on host and set terminal to use host font
RUN curl -LO https://github.com/adobe-fonts/source-code-pro/archive/2.030R-ro/1.050R-it.zip &&\
    mkdir ~/.fonts &&\
    unzip 1.050R-it.zip &&\
    rm 1.050R-it.zip &&\
    mv source-code-pro-*-it/OTF/*.otf ~/.fonts/ &&\
    rm -rf source-code-pro* &&\
    fc-cache -fv

# Coloration in vim (apparently not necessary in neovim)
# ENV TERM=xterm-256color

# Generate ctags
## Python
RUN ctags -R --fields=+l --languages=python --python-kinds=-iv -f ./tags $(python -c "import os, sys; print(' '.join('{}'.format(d) for d in sys.path if os.path.isdir(d)))")

# Run neovim setup (package installation and UpdateRemotePlugins)
# Doesn't seem to install plugins
# RUN ~/apps/nvim/usr/bin/nvim +UpdateRemotePlugins +qall

# Start interactive sessions in a fish shell
CMD ["fish", "--login"]

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