if &compatible
    set nocompatible
endif

" Initialize vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
        !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" List of plugins
call plug#begin()
Plug 'dracula/vim', {'as':'dracula'}
Plug 'liuchengxu/vim-which-key'
Plug 'sunaku/vim-shortcut'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install()} }
        Plug 'junegunn/fzf.vim'
Plug 'vimwiki/vimwiki'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
	" README recommends loading this last
	Plug 'ryanoasis/vim-devicons' 
Plug 'tpope/vim-surround'
Plug 'jalvesaq/Nvim-R'
call plug#end()

"Install missing plugins
if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
"        PlugInstall --sync | q
        PlugInstall --sync " Temporary until testing is finished
endif

" Enable file type detection and loading of type-specific plugin and indent
" scripts, and syntax highlighting
filetype plugin indent on
syntax enable

" Color configuration
set background=dark " Must be compatible with colorscheme
if has_key(g:plugs, 'dracula')
	colorscheme dracula " If using iTerm2, set Profiles>Colors>Colors Presets><colortheme>
end
set t_Co=256
if $COLORTERM == 'truecolor' " iTerm2 supports 256-bit color
	set termguicolors "Ignored in nvim-qt. Disastrous in Terminal.app (8-bit color, as in TERM=xterm-256)
endif

" Mappings
let g:mapleader = "\<Space>"
let g:maplocalleader = ';'
inoremap kj <ESC> 
" Expand :h<SPC> to :tab help
cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == 'h' ? 'tab help' : 'h'

" vim-which-key: Display key bindings mapped to (local) leader
" Note that (local)leader is hardcoded in nnoremap below
if has_key(g:plugs, 'vim-which-key')  
	nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
	nnoremap <silent> <localleader> :<c-u>WhichKey ','<CR>
	let g:which_key_fallback_to_native_key = 1
	"nnoremap <silent> g :<c-u>WhichKey 'g'<CR>

	set timeoutlen=1000
	"let g:WhichKeyFormatFunc = function('my_wk_format')
	let g:which_key_use_floating_win = 1
	if g:which_key_use_floating_win
		let g:which_key_floating_opts = {'col': -2, 'width': +3}
		if g:colors_name == 'dracula'
			hi link WhichKeyFloating DraculaFg
		endif
	endif
endif

" vim-shortcut: Fuzzy key finder
if has_key(g:plugs, 'vim-shortcut')
        "runtime plugin/shortcut.vim  "Find and load file from dirs in &runtimepath
	"source ~/.config/nvim/base_shortcuts.vim
	noremap <leader>s :<c-u>Shortcuts<CR>
endif

" vim-clap: experimental fuzzy finder and dispatcher
"
" Selected features: 
" preview of files when browing (in normal mode)
" Tab completes dirs 
" c-g or c-c exits if normal mode is enabled
" open files via c-x, c-t, or c-v
if has_key(g:plugs, 'vim-clap')
	noremap <Leader>fl :<c-u>Clap blines<CR>
	noremap <Leader>fL :<c-u>Clap lines<CR>
	noremap <Leader>fb :<c-u>Clap buffers<CR>
	noremap <Leader>fc :<c-u>Clap command<CR>
	noremap <Leader>f: :<c-u>Clap hist:<CR>
	noremap <Leader>f/ :<c-u>Clap hist/<CR>
	" m for most recent
	" Need to configure to exclude help files?
	noremap <Leader>fm :<c-u>Clap hisory<CR>
	noremap <Leader>ff :<c-u>Clap filer<CR>
	noremap <Leader>fF :<c-u>Clap files ++finder=fd --type f --hidden .<CR>
	noremap <Leader>fg :<c-u>Clap grep<CR>
	noremap <Leader>fh :<c-u>Clap help_tags<CR>
	" https://medium.com/breathe-publication/understanding-vims-jump-list-7e1bfc72cdf0
	noremap <Leader>fj :<c-u>Clap jumps<CR>
	noremap <Leader>fr :<c-u>Clap registers<CR>
	noremap <Leader>fy :<c-u>Clap yanks<CR>

	let g:clap_insert_mode_only = 0
	" Providers run at project root if supports enable_rooter field and its value
	" is v:true. Seems to include git*, files, and grep providers. Roots are
	" identifed by g:clap_project_root_markers, which includes .git by default
	let g:clap_disable_run_rooter = 0
endif

" vimwiki: Note taking
" |vimwiki-options| recommends setting options prior to sourcing
" !!!plugin/vimwiki.vim. Does vim-plug auto-source this file? See |autoload|
" and whether it answers this.!!!
"autocmd FileType vimwiki set ft=markdown
if has_key(g:plugs, 'vimwiki')
	let w1 = {}
	let w1.path = '~/vimwiki'
	let w1.auto_toc = 1
	let w1.automatic_nested_syntaxes = 1
	let g:vimwiki_list = [w1]

	" The following could be useful for navigating to project (README)s
	" g:vimwiki_dir_link
	let g:vimwiki_autowriteall = 1
endif

" Neovim GUIs and packages:
" https://github.com/neovim/neovim/wiki/Related-projects
