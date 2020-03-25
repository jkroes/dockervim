#!/usr/bin/env fish

# Path to plugins within package for neovim is $pdir/<pkg-name>/start/<plugin>, where pkg-name can be anything
# */start/ is where packages are autoloaded
# */opt/ at the same level as start is for packages that are manually loaded via packadd
# Underneath the last dir, the plugin directory structure remains as expected

set -l pdir ~/.local/share/nvim/site/pack " See &packpath
set -l startdir "$pdir/plugins/start"
mkdir -p "$startdir"

# vim-which-key: Display key bindings
git clone --depth=1 https://github.com/liuchengxu/vim-which-key "$startdir/vim-which-key"

# Vimwiki: Note taking
#curl -LO https://github.com/vimwiki/vimwiki/archive/v2.4.1.zip 
#unzip -d "$startdir" v2.4.1.zip
#rm v2.4.1.zip

# Generate help files
nvim --headless +"helptags ALL" +qa

# git clone vimwiki/vimwiki "$vw_dir"
# git --git-dir="$vimwiki_dir/.git" checkout tags/v2.4.1
