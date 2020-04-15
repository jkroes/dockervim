"let $NVIM_COC_LOG_LEVEL = 'debug'

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
" Plug 'dracula/vim', {'as':'dracula'}
Plug 'drewtempelmeyer/palenight.vim'
" Plug 'rakr/vim-one'
"Plug 'liuchengxu/vim-which-key'
Plug 'sunaku/vim-shortcut'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
Plug 'vimwiki/vimwiki'
Plug 'jkroes/vim-clap', { 'do': ':Clap install-binary!' }
    Plug 'ryanoasis/vim-devicons' " README recommends loading this last
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'
Plug 'jkroes/tinykeymap'
Plug 'vim-ctrlspace/vim-ctrlspace'
" Consider configuring this for R and vimscript. It's very simple:
" You specify legal variable characters and blacklist keywords
" Plug 'jaxbot/semantic-highlight.vim'
" Compare to semantic-highlight.vim
" The source for UpdateRemotePlugins isn't loaded yet:
"Plug 'numirias/semshi', { 'do': 'nvim +UpdateRemotePlugins +qall' }
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
" Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
"Plug 'pechorin/any-jump.vim'
Plug 'vimwiki/vimwiki'
Plug 'jkroes/neoterm'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
        Plug 'Shougo/neco-vim' " Vim coc
        Plug 'neoclide/coc-neco'
"Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'jalvesaq/Nvim-R'
Plug 'gaalcaras/ncm-R'
    Plug 'roxma/nvim-yarp'
    Plug 'ncm2/ncm2'
        " " Plug 'ncm2/ncm2-ultisnips'
            " Plug 'SirVer/ultisnips' " See https://github.com/honza/vim-snippets
        Plug 'ncm2/ncm2-path'
        Plug 'ncm2/ncm2-github'
        Plug 'ncm2/ncm2-bufword'
        Plug 'ncm2/ncm2-path'
call plug#end()
" TODO: Research coc.nvim, nvim-R, python-mode, and coc-r-lsp. E.g., use the
" latter to enable signatures, which are missing from nvim-R but keep
" completion disabled. Also see vim-pythonsense, vim-python-pop3-indent, and
" vim-indent-object.

"Install missing plugins
if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    " PlugInstall --sync | q
    PlugInstall --sync " Temporary until testing is finished
endif

" Mappings
let g:mapleader = "\<Space>"
let g:maplocalleader = ";"
inoremap kj <ESC>
" Expand :h<SPC> to :tab help
"cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == 'h' ? 'tab help' : 'h'
nnoremap <Leader>; :<c-u>set hls!<CR>

" General configuration
let $PATH = expand('~/.local/bin').':' . $PATH
filetype plugin indent on
syntax enable
set hidden "Allows modified bufs to be hidden when switching bufs
set number
set shiftwidth=4
set softtabstop=4
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
set ignorecase " Match all cases with lowercase queries, and with smartcase...
set smartcase " Use exact case match only for mixed case queries
set switchbuf=useopen,usetab " Jump to first window in first tab where buffer is open for certain commands
autocmd BufWritePre * %s/\s\+$//e " Remove trailing whitespace
" Navigate highlighted searches with C-g/C-t
" Unhighlight on escape or enter
set incsearch
augroup vimrc-incsearch-highlight
    autocmd!
    autocmd CmdlineEnter /,\? :set hlsearch
    autocmd CmdlineLeave /,\? :set nohlsearch
augroup END
" Change what Vim considers to be a word and thus commands like *
" TODO: Make this filetype-speficic (e.g., include <> for html?)
set iskeyword+=-
set splitbelow " Place new window on bottom

" Color configuration
if $COLORTERM == 'truecolor' " iTerm2 supports 256-bit color and sets this env var
            \ && has('termguicolors')
        set termguicolors " Enable in 256-bit terminals (ignored by nvim GUIs)
endif " :h term.txt
set background=dark " Must be compatible with colorscheme
" if has_key(g:plugs, 'dracula')
    " colorscheme dracula " If using iTerm2, set Profiles>Colors>Colors Presets><colortheme>
" endif
colorscheme palenight

" Anything inserted between entering and exiting insert mode counts as a
" single change by default. Insertion can be broken into smaller units by remapping
" insert-mode keys to, e.g., the same keys prefixed by c-g u. E.g., remapping
" <c-r> results in per-line changes.
" Base undo relies on u and c-r to navigate the current undo branch. It
" ignores other branches. Each node in the tree has a temporal order that can
" be navigated by g+/g- (equivalent to 'move to next/pervious state'). If
" g+/g- lands you on another branch, then u/c-r will now operate from that
" branch to the start of the undo history. This is best visualized with undo-tree.
" In fact, undotree can be navigated from the file it is visualizing simply
" through these shortcuts. The only new functionality it introduces is the
" ability to move between saved states--an extension of g-/g+. I don't
" necessarily save at logical points, and the diff is almost always overkill,
" so I am using treeundo for its visual, disabling diff, and ignoring the new
" keybindings. I can hold down u and c-r for rapid movememnt, then use g-/g+
" if I need branch switching (i.e., if I realize a previous undo was a
" mistake).
" The documentation doesn't show it, but a call to UndotreeShow if it's active
" focuses the window. Then <tab> can be hit to return to the target window.
if has_key(g:plugs, 'undotree')
    let g:undotree_WindowLayout = 4
    let g:undotree_DiffAutoOpen = 0
    "let g:undotree_SetFocusWhenToggle = 1 " Focus buffer so keybindings work
    let g:undotree_RelativeTimestamp = 1 " Useful for :earlier and :later
    let g:undotree_ShortIndicators = 1 " Abbreviated relative time units
    " Useful in combination with signcolumn, though not documented.
    " let g:undotree_HighlightChangedText = 1 " Only active if diff window is open
    let g:undotree_SplitWidth = 30

    " Stolen from |clear-undo|
    " Couldn't get <plug>ClearHistory working, so I replaced it...
    function! ClearHistory()
        let old_undolevels = &undolevels
        set undolevels=-1
        exe "normal a \<BS>\<Esc>"
        let &undolevels = old_undolevels
        unlet old_undolevels
        " TODO: If a window in current tab has filetype undotree, run UntoreeShow after UndotreeHide
        UndotreeHide " Need to close buffer for it to show cleared history
    endfunction
    command! -nargs=0 ClearHistory call ClearHistory()

    nmap <leader>uc :<c-u>ClearHistory<CR>
    nmap <leader>us :<c-u>UndotreeShow<CR>
    nmap <leader>uh :<c-u>UndotreeHide<CR>
endif

if has_key(g:plugs, 'vim-ctrlspace')
    set showtabline=0
    let g:CtrlSpaceUseTabline = 1
    let g:CtrlSpaceDefaultMappingKey = "<leader><leader>"
    " NOTE: airline slows this plugin down a ton
    " TODO: Customize airline? See the README
    " if has_key(g:plugs, 'vim-airline')
        "AirlineToggleWhitespace
        " let g:airline_exclude_preview = 1
        " let g:airline#extensions#ctrlspace#enabled = 1
        " let g:CtrlSpaceStatuslineFunction = 'airline#extensions#ctrlspace#statusline()'
    " endif
    let g:CtrlSpaceCacheDir = expand("$HOME/.config/nvim")
    if executable("ag")
        let g:CtrlSpaceGlobCommand = 'ag -lU --nocolor --hidden -g ""'
    endif
    " Add common filename punctuation characters to acceptable search chars
    " See the issue I field on GitHub
    let g:CtrlSpaceKeys = {}
    let g:CtrlSpaceKeys.Search = {}
    let g:CtrlSpaceKeys.Search['.'] = 'ctrlspace#keys#search#AddLetter'
    let g:CtrlSpaceKeys.Search['_'] = 'ctrlspace#keys#search#AddLetter'
    let g:CtrlSpaceKeys.Search['-'] = 'ctrlspace#keys#search#AddLetter'

    nnoremap <leader>bn :<c-u>CtrlSpaceGoDown<cr>
    nnoremap <leader>bp :<c-u>CtrlSpaceGoUp<cr>
endif

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
    autocmd FileType r set tags+=~/.cache/Nvim-R/Rtags,~/.cache/Nvim-R/RsrcTags
endif

" vim-which-key: Display key bindings mapped to (local) leader
if has_key(g:plugs, 'vim-which-key')
    nnoremap <silent> <leader>      :<c-u>WhichKey g:mapleader<CR>
    nnoremap <silent> <localleader> :<c-u>WhichKey g:maplocalleader<CR>
    let g:which_key_fallback_to_native_key = 1
    "nnoremap <silent> g :<c-u>WhichKey 'g'<CR>

    "let g:WhichKeyFormatFunc = function('my_wk_format')
    let g:which_key_use_floating_win = 1
    if g:which_key_use_floating_win
        let g:which_key_floating_opts = {'col': -2, 'width': +3}
        " if g:colors_name == 'dracula'
            " hi link WhichKeyFloating DraculaFg
        " endif
    endif
endif

" vim-shortcut: Fuzzy key finder
if has_key(g:plugs, 'vim-shortcut')
    runtime plugin/shortcut.vim
    source ~/.config/nvim/base_shortcuts.vim
    "noremap <C-Space> :Shortcuts<CR>
endif

" vim-clap: experimental fuzzy finder and dispatcher
    " Selected features:
        " preview of files when selecting (in normal mode)
        " Tab completes dirs
        " c-g or c-c exits if normal mode is enabled
        " open files via c-x, c-t, or c-v
if has_key(g:plugs, 'vim-clap')
    let g:clap_disable_run_rooter = 0 " Run file/grep/git* providers at project root instead of cwd
    let g:clap_insert_mode_only = 0 " Enable normal mode in provider buffer/window

    Shortcut Fuzzy lines in the current buffer
                \ noremap <Leader>fl :<c-u>Clap blines<CR>
    Shortcut Fuzzy lines in open buffers
                \ noremap <Leader>fL :<c-u>Clap lines<CR>
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

" function! Test(f)
    " redir => output
    " silent execute a:cmd
    " silent scriptnames
    " redir END
    " let ol = split(output, '\n')
    " let [filer] = filter(ol, "v:val =~ 'vim-clap/autoload/clap/provider/filer.vim'")
    " let sid = split(filer, ':')[0]
    " echo function('<SNR>' . sid . '_' . a:f)
" endfunction
" call Test('tab_action')

if has_key(g:plugs, 'nerdcommenter')
    let NERDDefaultAlign = 'none' " 'none' requires <leader>cl to align delimiters
    " for a selection of lines at different indentation levels
    let NERDDefaultNesting = 1 " Disabled requires <leader>cn to nest comments,
    " as desired for regions of mixed comments and code. The only issue is
    " there seems to be no way to do nested aligned comments if
    " NERDDefaultAlign = 'none'. So either disable this or that. Otherwise,
    " autoformatters may wreak havoc with indentation when toggling comments.
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

if has_key(g:plugs, 'tinykeymap')
    if has_key(g:plugs, 'vimwiki')
        let g:vimwiki_map_prefix = '<leader>v'
    endif
    let g:tinykeymap#conflict=4
    let g:tinykeymap#timeout = 0
    let g:tinykeymap#map#windows#map = "<leader>w"
endif

if has_key(g:plugs, 'tagbar')
    nnoremap <leader>tt :<c-u>TagbarToggle<CR>
endif

" TODO: Investigate workspace folders, coc-search
" TODO: Investigate the example tab mapping from the docs for snippet
" expansion and placeholder jumping
" TODO: How does coc.nvim compare to the other LSP plugins listed here:
" https://www.reddit.com/r/vim/comments/7lnhrt/which_lsp_plugin_should_i_use/
" NOTE: Most functionality is broken for Python: extract, rename, refactor, etc.
" The one thing that works beautifully is completion and function signatures
if has_key(g:plugs, 'coc.nvim')
    " Global options
    set nobackup
    set nowritebackup
    set cmdheight=2 "cmdline height
    set updatetime=300 "Recommended value by coc.nvim.
    set shortmess +=c "Avoid messages related to completion popup

    " Check for a space one column before cursor
    function! Check_space_behind() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    function! Show_coc_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    function! Configure_coc_filetypes()
        setlocal signcolumn=yes "Persistent left-hand column for, e.g., debugging indicators
        " Standard statusline
        setlocal statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
        " Prepend b/c left of '%<' avoids being trimmed
        setlocal statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

        " If the preceding character isn't \s, <tab> triggers completion or else
        " navigates down the completion list if the completion popup is visible
        inoremap <buffer><expr> <TAB>
              \ pumvisible() ? "\<C-n>" :
              \ Check_space_behind() ? "\<TAB>" :
              \ coc#refresh()

        " Use shift-tab to navigate up the completion menu or backspace
        inoremap <buffer><expr><S-TAB>
              \ pumvisible() ? "\<C-p>" :
              \ "\<C-h>"

        " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
        " position. See |undo| and |ins-special-special|
        inoremap <buffer><expr> <cr>
              \ complete_info()["selected"] != "-1" ? "\<C-y>" :
              \ "\<C-g>u\<CR>"

        nmap     <buffer> <leader>dp <Plug>(coc-diagnostic-prev)
        nmap     <buffer> <leader>dn <Plug>(coc-diagnostic-next)

        nmap     <buffer> gd <Plug>(coc-definition)
        " NOTE: In the preview window for coc-references, you can determine how to go
        " (e.g., vsplit) by pressing tab on the selected reference
        nmap     <buffer> gr <Plug>(coc-references)
        nnoremap <buffer> K :call Show_coc_documentation()<CR>
    endfunction

    " Highlight the symbol and its references between key presses
    autocmd CursorHold * call CocActionAsync('highlight')

    " Extensions to install
    autocmd VimEnter * CocInstall coc-python
    "autocmd VimEnter * CocInstall coc-highlight " Enables autocmd highlighting
    " Disable COC by default
    autocmd FileType * call DisableCocFT ()
    function! DisableCocFT()
        if index(['vim', 'python'], &filetype) < 0
            let b:coc_suggest_disable = 1
        else
            call Configure_coc_filetypes()
        endif
    endfunction
endif

" Send single command with :T and reference active buffer with %
" E.g., :T cat %
if has_key(g:plugs, 'neoterm')
    let g:neoterm_term_per_tab = 1 " Tab-specific terminals
    let g:neoterm_default_mod = 'belowright'
    let g:neoterm_autoscroll = 1
    " Open shell and pass repl command automatically
    if get(g:, 'neoterm_direct_open_repl', 0) == 0
        let g:neoterm_auto_repl_cmd = 1
    endif
    " Language REPLs
    let g:neoterm_repl_python = 'ipython3 --no-autoindent'
    " Easy escape from the terminal
    tnoremap <Esc> <C-\><C-n>
    " Bindings that operate on tab-specific teriminal
    " (or last active terminal if not tab-specific)
    nnoremap <localleader>c :<c-u>exec v:count.'Tclear!'<CR>
    nnoremap <localleader>k :<c-u>exec v:count.'Tkill'<CR>
    nnoremap <localleader>t :<c-u>exec v:count.'Ttoggle'<CR>
    nnoremap <localleader>q :<c-u>exec v:count.'Tclose!'<CR>
    nnoremap <localleader>r :<c-u>TREPLSendFile<CR>
    " ...and work with motions, selections, and counts
    " E.g., 2gxx or gxip
    nmap gx <Plug>(neoterm-repl-send)
    xmap gx <Plug>(neoterm-repl-send)
    nmap gxx <Plug>(neoterm-repl-send-line)
endif
" nnoremap <localleader>i :<c-u>echo b:neoterm_id<CR>

" Open init.vim to start
e $MYVIMRC
