set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')
    call dein#add('~/cache/dein/repos/github.com/Shougo/dein.vim')

    " Note taking
    " call dein#add('vimwiki/vimwiki')

    " Display key bindings
    call dein#add('liuchengxu/vim-which-key')

    " R (w/ ncm-2 completion)
    "call dein#add('roxma/nvim-yarp')
    "call dein#add('ncm2/ncm2')
    "call dein#add('gaalcaras/ncm-R')
    "call dein#add('ncm2/ncm2-ultisnips')
    "call dein#add('SirVer/ultisnips') " See https://github.com/honza/vim-snippets
    "call dein#add('ncm2/ncm2-path')
    "call dein#add('ncm2/ncm2-github')
    "call dein#add('ncm2/ncm2-bufword')
    "call dein#add('ncm2/ncm2-path')

    " Comments
    "call dein#add('preservim/nerdcommenter')

    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif


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

" Enable 
autocmd BufEnter * call ncm2#enable_for_buffer()

" Prevent automatic selection and text injection into current line, and show
" popup even for only one match 
set completeopt=noinsert,menuone,noselect 


"Tab and indentation rules
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

"nvim-r

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


":h ft-r-indent/syntax/plugin
