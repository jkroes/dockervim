" Example bug report: https://github.com/SpaceVim/SpaceVim/issues/1818

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
"Plug 'liuchengxu/vim-which-key'
Plug 'sunaku/vim-shortcut'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
Plug 'vimwiki/vimwiki'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
    Plug 'ryanoasis/vim-devicons' " README recommends loading this last
Plug 'jalvesaq/Nvim-R'
Plug 'gaalcaras/ncm-R'
    Plug 'roxma/nvim-yarp'
    Plug 'ncm2/ncm2'
	Plug 'ncm2/ncm2-ultisnips'
	    Plug 'SirVer/ultisnips' " See https://github.com/honza/vim-snippets
	Plug 'ncm2/ncm2-path'
	Plug 'ncm2/ncm2-github'
	Plug 'ncm2/ncm2-bufword'
	Plug 'ncm2/ncm2-path'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'
" The source for UpdateRemotePlugins isn't loaded yet:
Plug 'numirias/semshi', { 'do': 'nvim +UpdateRemotePlugins +qall' }
Plug 'kana/vim-submode'
Plug 'gcmt/taboo.vim'
call plug#end()

"Install missing plugins
if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    " PlugInstall --sync | q
    PlugInstall --sync " Temporary until testing is finished
endif

" General configuration
filetype plugin indent on
syntax enable
set number
set shiftwidth=4
set tabstop=8 " Number of spaces <TAB> displays as.
set nosmarttab "smarttab is an annoyance
set expandtab " new <TAB> characters are replaced by spaces
" To replace existing <TAB>s with spaces, use :retab
set autoindent "Copy indentation from previous line
"https://stackoverflow.com/questions/7053550/disable-all-auto-indentation-in-vim
"Apparently cindent and smartindent may interfere with filetype indentation,
"which can be one of autoindent, smartindent, cindent, or indentexpr (in order
"of precdence)
set nosmartindent "Copy indent from previous line; higher precedence than autoindent, lower than cindent or indentexpr
set nocindent "Apparently cindent and smartindent can interfere with filetype indentation (enabled by `filetype indent on`)
" Filetype indentation is one of autoindent, smartindent, cindent, or
" indentexpr, set in an indentation script. Apprently Python uses indentexpr
" and Lisp uses autoindent. I wonder what R uses?
set hidden " Allows modified buffers to be hidden
set switchbuf=useopen,usetab " Jump to first window in first tab where buffer is open for certain commands

" TODO: Replace with custom function (see |setting-tabline|), since you only
" need custom tabline and not functions
if has_key(g:plugs, 'taboo.vim')
    let g:taboo_tab_format = '%N %S'
endif

" Color configuration
if $COLORTERM == 'truecolor' " iTerm2 supports 256-bit color and sets this env var
	set termguicolors " Enable in 256-bit terminals (ignored by nvim GUIs)
endif " :h term.txt
set background=dark " Must be compatible with colorscheme
if has_key(g:plugs, 'dracula')
    colorscheme dracula " If using iTerm2, set Profiles>Colors>Colors Presets><colortheme>
end

" Mappings
let g:mapleader = "\<Space>"
let g:maplocalleader = ";"
inoremap kj <ESC> 
" Expand :h<SPC> to :tab help
"cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == 'h' ? 'tab help' : 'h'
nnoremap <Leader>; :<c-u>nohls<CR> 

if has_key(g:plugs, 'Nvim-R')
    if has_key(g:plugs, 'ncm2')
	autocmd BufEnter *.R call ncm2#enable_for_buffer()
	" Prevent automatic selection and text injection into current line, and show
	" " popup even for only one match 
	set completeopt=noinsert,menuone,noselect 
    endif
    "See |nvim-r|, |ft-r-indent|, and |R_indent_commented|
    let r_indent_ess_comments = 0 "No ess-style comment indentation (for #, ##, and ###)
    let r_indent_ess_compatible = 0 "Indent lines following line ending in '<-'
    "TODO: Space b/w # and text is proportional to function depth with
    "R_indent_commented. Investigate source code. May depend on external
    "indentation or formatting rules.
    let R_indent_commented = 1 "Reindent after toggling comment
    "let r_indent_comment_column = 40 "<LocalLeader>;
    "let R_rcomment_string = '# ' "<LocalLeader>x[x|c|u]
    let r_indent_align_args = 1 "Align function arguments

    let R_close_term = 1
    let R_assign = 2
    let R_objbr_place = 'console,right' "Object browser location
    let R_objbr_opendf = 1 "Show data frame elements
    let R_objbr_openlist = 1 "Show list elements
    let R_objbr_allnames = 0 "Show .GlobalEnv hidden objects
    let R_objbr_labelerr = 1 "Warn if label attribute is not class character
    let R_nvimpager = 'tab' "Open help document in new tab or use existing
    let R_startlibs = 'base,stats,graphics,grDevices,utils,methods,tidyverse' "Omnicompletion and syntax highlighting for unloaded packages listed here
    "R_objbr/editor/help_w/h
    "R_path,R_app,R_args
endif

" vim-which-key: Display key bindings mapped to (local) leader
if has_key(g:plugs, 'vim-which-key')  
    nnoremap <silent> <leader>      :<c-u>WhichKey g:mapleader<CR>
    nnoremap <silent> <localleader> :<c-u>WhichKey g:maplocalleader<CR>
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
    runtime plugin/shortcut.vim
    source ~/.config/nvim/base_shortcuts.vim
    noremap <leader><leader> :Shortcuts<CR>
endif

" vim-clap: experimental fuzzy finder and dispatcher
    " Selected features: 
        " preview of files when selecting (in normal mode)
        " Tab completes dirs 
        " c-g or c-c exits if normal mode is enabled
        " open files via c-x, c-t, or c-v
if has_key(g:plugs, 'vim-clap')
    " Providers run at project root if supports enable_rooter field and its value
    " is v:true. Seems to include git*, files, and grep providers. Roots are
    " identifed by g:clap_project_root_markers, which includes .git by default
    let g:clap_disable_run_rooter = 0
    let g:clap_insert_mode_only = 0 " Enable normal mode 

    Shortcut Fuzzy lines in the current buffer
		\ noremap <Leader>fl :<c-u>Clap blines<CR>
    Shortcut Fuzzy lines in open buffers
		\ noremap <Leader>fL :<c-u>Clap lines<CR>
    Shortcut Fuzzy open buffers
		\ noremap <Leader>fb :<c-u>Clap buffers<CR>
    Shortcut Fuzzy commands
		\ noremap <Leader>fc :<c-u>Clap command<CR>
    Shortcut Fuzzy commmand history
		\ noremap <Leader>f: :<c-u>Clap hist:<CR>
    Shortcut Fuzzy search history
		\ noremap <Leader>f/ :<c-u>Clap hist/<CR>
    autocmd VimEnter * call filter(v:oldfiles, 'v:val !~ ".*/doc/.*\.txt"')
    Shortcut Fuzzy open buffers and v:oldfiles
		\ noremap <Leader>fm :<c-u>Clap history<CR> 
    Shortcut Fuzzy file finder
		\ noremap <Leader>ff :<c-u>Clap files ++finder=fd --type f --hidden .<CR>
    Shortcut Fuzzy file explorer
		\ noremap <Leader>fF :<c-u>Clap filer<CR>
    Shortcut Fuzzy grep
		\ noremap <Leader>fg :<c-u>Clap grep<CR>
    Shortcut Fuzzy helptags
		\ noremap <Leader>fh :<c-u>Clap help_tags<CR>
    " https://medium.com/breathe-publication/understanding-vims-jump-list-7e1bfc72cdf0
    Shortcut Fuzzy jump history 
		\ noremap <Leader>fj :<c-u>Clap jumps<CR>
    Shortcut Fuzzy registers
		\ noremap <Leader>fr :<c-u>Clap registers<CR>
    Shortcut Fuzzy yank stack
		\ noremap <Leader>fy :<c-u>Clap yanks<CR>

    " TODO: Modify other file-based providers to use similar functions
    function! s:mybuffers_sink(selected) abort
      let oldsb = &switchbuf
      set switchbuf=useopen,usetab " Jump to first window in first tab where buffer is open
      call g:clap.start.goto_win()
      let b = matchstr(a:selected, '^\[\zs\d\+\ze\]')
      if has_key(g:clap, 'open_action')
        execute g:clap.open_action
        execute 'buffer' b
        return
      endif
      execute 'sb' b
      execute 'set switchbuf=' . oldsb
    endfunction
    " This script exposes the sink. Were this not the case, see:
    " https://vi.stackexchange.com/questions/17866/are-script-local-functions-sfuncname-unit-testable
    runtime autoload/clap/provider/buffers.vim
    let clap#provider#buffers#['sink'] = function('s:mybuffers_sink')
endif

if has_key(g:plugs, 'nerdcommenter')
    let NERDDefaultAlign = 'none' " 'none' requires <leader>cl to align delimiters
    " for a selection of lines at different indentation levels
    let NERDDefaultNesting = 0 " Disabled requires <leader>cn to nest comments,
    " as desired for regions of mixed comments and code
    " let NERDToggleCheckAllLines = 1
    let NERDCommentWholeLinesInVMode = 0 " Comment selection, not entire line
    " Allows different results for line versus char or block visual modes
    let NERDBlockComIgnoreEmpty = 1 " In visual-block mode, don't comment
    " lines that are indented beyond selection. Can be used to comment out
    " a function def but not its body. Does not reindent, unlike example.
    let NERDSpaceDelims = 1 " Commenting adds a space after delimiter
    let NERDRemoveExtraSpaces = 1 " Uncommenting removes a space after delimiter
    let NERDTrimTrailingWhitespace = 1

    " Behavior of commands depends on variable settings above.
    Shortcut! <Leader>cc       Comment line or selection
    Shortcut! <Leader>cn       Comment line or selection with nesting
    Shortcut! <Leader>c<space> Toggle comment (based on topmost line)
    Shortcut! <leader>cm       Comment selected lines using multipart delimiters
    Shortcut! <leader>ci       Invert the commented state of each selected line
    Shortcut! <leader>cs       Comment sexily
    Shortcut! <leader>c$       Comment from cursor to EOL
    Shortcut! <leader>cA       Append comment delimiter to EOL and enter insert mode
    Shortcut! <leader>ca       Switch to alternate comment delimiter if available
    Shortcut! <leader>cl       Comment line or selection and align delimiters
    Shortcut! <leader>cu       Uncomment line or selection 
    Shortcut                   (insert) Add comment delimiter at cursor
                \ imap <C-c> <plug>NERDCommenterInsert
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

"Submodes
let g:submode_timeout = 0
let g:submode_keep_keyseqs_to_leave = ['<Leader>']

" Windows (:h ctrl-w, :h wincmd)
call submode#enter_with('WindowsMode', 'n', '', '<Leader>w', ':echo "windows mode"<CR>')
" call submode#leave_with('WindowsMode', 'n', '', 'o')
for key in [  '=', '+', '-', '<', '>',
	    \ 'H', 'J', 'K', 'L', 'T',
	    \ 'h', 'j', 'k', 'l', 'P', 'gt', 'gT',
	    \ 'c', 'q', 'o',
	    \ 's', 'v', ']', '}', 'd', 'i' ] 
    call submode#map('WindowsMode', 'n', '', key, '<C-w>' . key)
endfor

nnoremap <Leader>bn :<c-u>bn<CR> 
nnoremap <Leader>bp :<c-u>bp<CR> 
" call submode#enter_with('BuffersMode', 'n', '', '<Leader>b', ':echo "buffers mode"<CR>')
" for key in ['n', 'p']
"     call submode#map('BuffersMode', 'n', '', key, '<leader>b' . key)
" endfor

" TODO: Parse lines to get keys bound to each submode, invert, write vim commands,
" save to file, then source in vim
" Submodes:
" By default, any unbound key exits the mode. Therefore, to prevent any key
" but the desired exit key from leaving the submode, bind all unused keys
" to <Nop>. See submode#unmap
function! s:getmap()
    silent !rm -f ~/.config/nvim/map.txt
    redir > ~/.config/nvim/map.txt
    silent map
    redir END
endfunction
autocmd VimEnter * call s:getmap()

" Ideas for configuration
" :mksession (https://vim.fandom.com/wiki/Quick_tips_for_using_tab_pages)
" :(tab)find w/ path

" Open init.vim to start
e $MYVIMRC

" Note that submodes can not accommodate counts. You could investigate
" tinykeymap, but I couldn't get window movement to work:
" https://github.com/vim-scripts/tinykeymap/blob/master/autoload/tinykeymap/map/windows.vim
" Doing so would enable proper use of c-w x, for swapping w/ the n-th window
" Submodes also don't seem to support commands in {RHS}

" Using tmux and vim:
" https://statico.github.io/vim3.html
" The example here is a vim binding to execute the previous command in a
" terminal's command histroy. It relies on tmux to send keys between
" terminals. This is useful if you're editing a script and want to test it. Of
" course, this can probably be done in vim directly. 

" For LSP with R, see either LanguageClient-neovim or coc-r-lsp and coc.nvim:
"https://cran.r-project.org/web/packages/languageserver/readme/README.html
"Note that only LC-neovim, not coc.nvim, is designed to integrate with ncm2
"and thus ncm-r. ALthough code is provided to integrate somewhat:
" https://github.com/ncm2/ncm2/issues/51
" Is this true? What about b:coc_suggest_disable? Or is this issue using coc
" for completion?
"https://cran.r-project.org/web/packages/languageserver/readme/README.html
"General tutorial:
"https://jacky.wtf/weblog/language-client-and-neovim/
" Consider coc.nvim for other languages:
" https://www.narga.net/how-to-set-up-code-completion-for-vim/#why_is_cocvim 
"syntastics vs ale vs coc.nvim

" Windoes management sucks. See:
" https://github.com/spolu/dwm.vim
" https://www.reddit.com/r/vim/comments/3htkd7/rotate_windows_clockwise_anticlockwise/

" Neovim GUIs and packages:
" https://github.com/neovim/neovim/wiki/Related-projects

" Example of calling function from command (see f-args)
    " function! MyEdit(x)
        " " Disable partial matching for :sb and avoid errors for non-matches
        " if bufexists(a:x)
            " execute 'sb' a:x
        " else
            " execute 'buffer' a:x
        " endif
    " endfunction
    " command! -bang -nargs=1 Test call MyEdit(<f-args>)
