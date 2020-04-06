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
    Plug 'ryanoasis/vim-devicons' " README recommends loading this last
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
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'
Plug 'jkroes/tinykeymap'
Plug 'vim-ctrlspace/vim-ctrlspace'
"Plug 'vim-airline/vim-airline'
" The source for UpdateRemotePlugins isn't loaded yet:
"Plug 'numirias/semshi', { 'do': 'nvim +UpdateRemotePlugins +qall' }
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
" Consider configuring this for R and vimscript. It's very simple:
" You specify legal variable characters and blacklist keywords
Plug 'jaxbot/semantic-highlight.vim'
" Compare to semantic-highlight.vim
Plug 'numirias/semshi'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
        Plug 'Shougo/neco-vim' " Vim coc
        Plug 'neoclide/coc-neco'
Plug 'airblade/vim-gitgutter'
"Plug 'pechorin/any-jump.vim'
Plug 'vimwiki/vimwiki'
call plug#end()

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
filetype plugin indent on
syntax enable
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
set incsearch
augroup vimrc-incsearch-highlight
    autocmd!
    autocmd CmdlineEnter /,\? :set hlsearch
    autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

" Color configuration
if $COLORTERM == 'truecolor' " iTerm2 supports 256-bit color and sets this env var
        set termguicolors " Enable in 256-bit terminals (ignored by nvim GUIs)
endif " :h term.txt
set background=dark " Must be compatible with colorscheme
if has_key(g:plugs, 'dracula')
    colorscheme dracula " If using iTerm2, set Profiles>Colors>Colors Presets><colortheme>
endif

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
    command -nargs=0 ClearHistory call ClearHistory()

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
        if g:colors_name == 'dracula'
            hi link WhichKeyFloating DraculaFg
        endif
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

" TODO: see scoc-snippets and coc-sources and https://github.com/neoclide/coc.nvim/wiki/Using-snippets
" See list of coc-extensions @ https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
" As far as  ican tell, extensions are alternatives to languageserver
" configuration in the jsonc config file
" (https://github.com/neoclide/coc.nvim/wiki/Language-servers)
" https://github.com/neoclide/coc.nvim/wiki/Multiple-cursors-support
" https://github.com/neoclide/coc.nvim/wiki/Using-coc-list
" Compare to ctrlspace: https://github.com/neoclide/coc.nvim/wiki/Using-workspaceFolders
" https://github.com/neoclide/coc.nvim/wiki/F.A.Q
" https://github.com/neoclide/coc-pairs
" https://github.com/neoclide/coc-highlight
if has_key(g:plugs, 'coc.nvim')
    "From README.md
    "TODO> Compare to https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources
    set hidden "Allows modified bufs to be hidden when switching bufs
    set nobackup
    set nowritebackup
    set cmdheight=2 "cmdline height
    set signcolumn=yes "Persistent left-hand column for, e.g., debugging indicators
    set updatetime=300 "Recommended value by coc.nvim.
    set shortmess +=c "Avoid messages related to popup completions. E.g., hit C-x while in insert mdoe to see the difference.

    " Check for a space one column before cursor
    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    "iunmap <TAB>

    " If the preceding character isn't \s, trigger completion or navigate down
    " the completion list if the completion popup is visible
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()

    " Use shift-tab to navigate up the completion menu or backspace
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
    " position. Coc only does snippet and additional edit on confirm. See
    " |ins-special-special|
    if has('patch8.1.1068')
      " Use `complete_info` if your (Neo)Vim version supports it.
      inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    else
      imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    endif

    " Use `[g` and `]g` to navigate diagnostics
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    " TODO: Does this interefere with normal K mapping or extend it?
    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)

    " Formatting selected code.
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    augroup mygroup
      autocmd!
      " Setup formatexpr specified filetype(s).
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder.
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Applying codeAction to the selected region.
    " Example: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap keys for applying codeAction to the current line.
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Apply AutoFix to problem on the current line.
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Introduce function text object
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap if <Plug>(coc-funcobj-i)
    omap af <Plug>(coc-funcobj-a)

    " Use <TAB> for selections ranges.
    " NOTE: Requires 'textDocument/selectionRange' support from the language server.
    " coc-tsserver, coc-python are the examples of servers that support it.
    nmap <silent> <TAB> <Plug>(coc-range-select)
    xmap <silent> <TAB> <Plug>(coc-range-select)

    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')

    " Add `:Fold` command to fold current buffer.
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

    " Standard statusline
    set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
    " Prepend to avoid trimming (left of %<)
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

    " Mappings using CoCList:
    " Show all diagnostics.
    nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions.
    nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
    " Show commands.
    nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document.
    nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols.
    nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list.
    nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

    " Add comment syntax highlighting for jsonc config files
    autocmd FileType json syntax match Comment +\/\/.\+$+
endif
" My own autopairs
" https://stackoverflow.com/questions/13404602/how-to-prevent-esc-from-waiting-for-more-input-in-insert-mode
" https://vim.fandom.com/wiki/Automatically_append_closing_characters (see the
" plugins at the end of the webpage)
"NOTE: Unless both ( and (<CR> are bound, FastEscape won't affect them. In
"other words, if only the character itself is bound rather than a key sequence
"starting with the character, FastEscape is ignored! That's awesome.
" augroup FastEscape
      " autocmd!
      " au InsertEnter * set timeoutlen=500
      " au InsertLeave * set timeoutlen=1000
" augroup END
" Autopair mappings:
" https://vim.fandom.com/wiki/Automatically_append_closing_characters

" Example for Vim. Vim indents on a line following :fu. <C-d> deletes the
" indentation, then <C-o> inserts a line above that is auto-indented
"inoremap (<CR> (<CR><C-d>)<C-o>O


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

" TODO: Parse lines to get keys bound to each submode, invert, write vim commands,
" save to file, then source in vim
" By default, any unbound key exits the mode. Therefore, to prevent any key
" but the desired exit key from leaving the submode, bind all unused keys
" to <Nop>. See submode#unmap
" function! s:getmap()
    " silent !rm -f ~/.config/nvim/map.txt
    " redir > ~/.config/nvim/map.txt
    " silent map
    " redir END
" endfunction
" autocmd VimEnter * call s:getmap()

" function! s:csk()
    " silent !rm -f temp
    " redir > temp
    " silent echo ctrlspace#keys#KeyMap()
    " redir END
" endfunction
" autocmd VimEnter * call s:csk()

"Tags (in R)
"https://docs.ctags.io/en/latest/index.htmf
" https://ricostacruz.com/til/navigate-code-with-ctags (see shortcuts)
" https://www.fusionbox.com/blog/detail/navigating-your-django-project-with-vim-and-ctags/590/
" https://vim.fandom.com/wiki/Browsing_programs_with_tags" https://github.com/lyuts/vim-rtags

" You can generate tags for R in ctags, or use rtags and etags2ctags
" https://tinyheero.github.io/2017/05/13/r-vim-ctags.html
" https://stackoverflow.com/questions/4794859/exuberant-ctags-with-r
" etags2ctags is provided by nvim-r
