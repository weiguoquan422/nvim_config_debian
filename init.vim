"Enable file type detection
filetype on
"Load the corresponding plug-in according to the different types detected
filetype plugin on

set nocompatible

"about encoding
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
"make Vim default to Unix line endings while still supporting DOS line endings
set fileformats=unix,dos
set fileformat=unix

"about search and display
"ingnore case when searching with /
set ic
"Enable real-time search
set incsearch
"highlight search
set hlsearch
"set word wrap
set wrap
"Turn on row count display, relative row count display
set number
set relativenumber
"enable guicolor
set termguicolors
"highlight line
set cursorline
"List auto complete Ex menu
set wildmenu
"allow switch buffer without saving current buffer
set hidden
"allow use mouse
set mouse=a
"dont change directory when open a file
set noautochdir

"about fold
set viewoptions=cursor,folds,slash,unix
set foldmethod=manual
set foldlevel=99
set foldenable

"about mapping and Leader
"<Leader> is ';'
let mapleader=";"
"map: copy to clipboard
nmap <Leader>y "+y :let @*=@+<CR>h
vmap <Leader>y "+y :let @*=@+<CR>h
"map: paste from clipboard
nmap <Leader>p "+p
vmap <Leader>p "+p
"alt+right/left to move between buffers
nmap <A-right> <Esc>:bn<CR>
nmap <A-left> <Esc>:bp<CR>

"close current buffer
function! Close_current_buf()
    let buffer_num=len(getbufinfo({'buflisted':1}))
    if buffer_num>1
        :bp|bd #
    else
        :bd
    endif
    return buffer_num
endfunction

nmap <Leader>bd :call Close_current_buf()<CR>

"vertical partition window
nmap <Leader>wv <Esc>:vs<CR>
"close current window
nmap <Leader>wd <Esc>:q<CR>


"about indent
"Adaptive intelligent indent for filetype
filetype indent on
"Expand tabs to Spaces
set expandtab
"set tabstop
set tabstop=4
"The number of Spaces that tabs occupy when formatting source code
set shiftwidth=4
"Treat a contiguous number of Spaces as a TAB
set softtabstop=4



"about windows and buffers
"Jump to the right window
nnoremap <Leader>wl <C-W>l
"Jump to the left window
nnoremap <Leader>wh <C-W>h
"Jump to the up window
nnoremap <Leader>wk <C-W>k
"Jump to the down window
nnoremap <Leader>wj <C-W>j



" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

"coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"nerdtree
Plug 'scrooloose/nerdtree'
"color scheme
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
"lightline
Plug 'itchyny/lightline.vim'
"bufferline
Plug 'bling/vim-bufferline'
"CtrlP
"Plug 'ctrlpvim/ctrlp.vim'
"git
Plug 'lambdalisue/gina.vim'
"gitgutter--dispaly git diff in gutter
Plug 'airblade/vim-gitgutter'
"nerdcommenter--comment
Plug 'scrooloose/nerdcommenter'
"Yggdroot/indentLine--display indent line
Plug 'Yggdroot/indentLine'
"ludovicchabant/vim-gutentags--generate ctags
Plug 'ludovicchabant/vim-gutentags'
"tagbar show ctags
Plug 'majutsushi/tagbar'
"jiangmiao/auto-pairs
Plug 'jiangmiao/auto-pairs'
"mhinz/vim-startify
Plug 'mhinz/vim-startify'
"easymotion
Plug 'easymotion/vim-easymotion'
"rainbow:show different levels of brackets in different colors
Plug 'luochen1990/rainbow'
"vim markdown
Plug 'godlygeek/tabular' "this plugin is necessary, it should be before the vim-markdown
Plug 'plasticboy/vim-markdown'
"vim-markdown-toc
Plug 'mzlogin/vim-markdown-toc'
"vimtex
Plug 'lervag/vimtex'
"This is a simple plugin for Vim that will allow you to have a set of templates for certain file types.
Plug 'aperezdc/vim-template',{'frozen': 1}
"align text by some character
Plug 'junegunn/vim-easy-align'
"auto testbench
Plug 'kdurant/verilog-testbench'
"vim-SystemVerilog
Plug 'WeiChungWu/vim-SystemVerilog'
"machakann/vim-sandwich
Plug 'machakann/vim-sandwich'
"weiguoquan422/vim-startsearch:search for word under the cursor but not jump next match, and add the word to search history
Plug 'weiguoquan422/vim-starsearch'
"fzf fuzzy find
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
"markdown-preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Initialize plugin system
call plug#end()


"about coc
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" coc-bookmark configuration
nmap <Leader>bt <Plug>(coc-bookmark-toggle)
nmap <Leader>bl :CocList bookmark<CR>

" coc-snippets
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

"tagbar
let g:tagbar_ctags_bin = '/usr/bin/ctags'
let g:tagbar_position = 'topleft vertical'

"if filetype is markdown, F2 trigger Toc, other filetype trigger Tagbar
function Trigger_tagbar_or_toc()
    if &filetype ==# 'markdown'
        :let bnr=bufwinnr("[Location List]")
        if bnr>1
            :Toc
            :q
        else
            :Toc
        endif
    elseif &filetype ==# 'verilog' || &filetype ==# 'c' || &filetype ==# 'cpp' || &filetype ==# 'vim'
        :TagbarToggle
    else
        :q
    endif
endfunction
nmap <F2> :call Trigger_tagbar_or_toc()<CR>


"about nerdtree
"toggle Nerdtree
nmap <F3> :NERDTreeToggle<CR>
"set Neartree width
let NERDTreeWinSize=32
"Set NERDTree window location
let NERDTreeWinPos="right"
"Show hidden file
let NERDTreeShowHidden=1
"dont display Redundant help information
let NERDTreeMinimalUI=1
"Automatically deletes the file corresponding to buffer when deleting the file
let NERDTreeAutoDeleteBuffer=1
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"about nerdcommenter
"disable default Mapping of nerdcommenter
let NERDCreateDefaultMappings = 0
"set c default delimiter // not /**  */
let g:NERDAltDelims_c = 1
"toggle line comment
nmap <leader>cl <plug>NERDCommenterToggle
vmap <leader>cl <plug>NERDCommenterToggle
"switch comment style
nmap <leader>ca <plug>NERDCommenterAltDelims



"about gitgutter
"disable default key
let g:gitgutter_map_keys = 0
"exceeded maximum number of signs,default = 500
let g:gitgutter_max_signs = 3000
"jump between hunks
nmap ]n <Plug>(GitGutterNextHunk)
nmap [n <Plug>(GitGutterPrevHunk)


"about Gina
"Gina diff
nmap <leader>gd :Gina diff<CR>
"Gina status
nmap <leader>gs :Gina status<CR>
"Gina commit
nmap <leader>gc :Gina commit<CR>
"Gina log
nmap <leader>gl :Gina log<CR>


"about startify
"dont allow startify change to dir when open a file
let g:startify_change_to_dir = 0


"about rainbow
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle


"about vim-markdown
"disable syntax concealing
let g:vim_markdown_conceal = 0
"To disable math conceal with LaTeX math
let g:tex_conceal = ""
let g:vim_markdown_math = 1
"Disabling conceal for code fences
let g:vim_markdown_conceal_code_blocks = 0
"Allow for the TOC window to auto-fit when it's possible for it to shrink.It never increases its default size (half screen), it only shrinks.
let g:vim_markdown_toc_autofit = 1


"about vimtex
let g:tex_flavor='latex'
let g:vimtex_syntax_conceal_default=0


"about templates
let g:templates_use_licensee=0


"vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


"CtrlP
"ctrlpline
"nmap <leader>sf :CtrlPLine<CR>
"Ignore files in .gitignore
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
"chang mapping to invoke CtrlP
"let g:ctrlp_map = '<leader>ff'
"ctrlp dont change dir when open a file
"let g:ctrlp_working_path_mode = 'w'
"Use this to customize the mappings inside CtrlP's prompt to your liking. You only need to keep the lines that you've changed the values (inside []) 
"let g:ctrlp_prompt_mappings = {
  "\ 'PrtBS()':              ['<bs>', '<c-]>'],
  "\ 'PrtDelete()':          ['<del>'],
  "\ 'PrtDeleteWord()':      ['<c-w>'],
  "\ 'PrtClear()':           ['<c-u>'],
  "\ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
  "\ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
  "\ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
  "\ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
  "\ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
  "\ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
  "\ 'PrtHistory(-1)':       ['<c-n>'],
  "\ 'PrtHistory(1)':        ['<c-p>'],
  "\ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
  "\ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
  "\ 'AcceptSelection("t")': ['<c-t>'],
  "\ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
  "\ 'ToggleFocus()':        ['<s-tab>'],
  "\ 'ToggleRegex()':        ['<c-r>'],
  "\ 'ToggleByFname()':      ['<c-d>'],
  "\ 'ToggleType(1)':        ['<c-f>', '<c-up>'],
  "\ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
  "\ 'PrtExpandDir()':       ['<tab>'],
  "\ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
  "\ 'PrtInsert()':          ['<c-\>'],
  "\ 'PrtCurStart()':        ['<c-a>'],
  "\ 'PrtCurEnd()':          ['<c-e>'],
  "\ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],
  "\ 'PrtCurRight()':        ['<c-l>', '<right>'],
  "\ 'PrtClearCache()':      ['<F5>'],
  "\ 'PrtDeleteEnt()':       ['<F7>'],
  "\ 'CreateNewFile()':      ['<c-y>'],
  "\ 'MarkToOpen()':         ['<c-z>'],
  "\ 'OpenMulti()':          ['<c-o>'],
  "\ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
  "\ }


"sandwich
let g:sandwich_no_default_key_mappings = 1
silent! nmap <unique><silent> gd <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
silent! nmap <unique><silent> gr <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
silent! nmap <unique><silent> gdb <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
silent! nmap <unique><silent> grb <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)

let g:operator_sandwich_no_default_key_mappings = 1
" add
silent! map <unique> <Leader>sa <Plug>(operator-sandwich-add)
" delete
silent! xmap <unique> <Leader>sd <Plug>(operator-sandwich-delete)
" replace
silent! xmap <unique> <Leader>sr <Plug>(operator-sandwich-replace)


"bufferline
let g:bufferline_show_bufnr = 0
let g:bufferline_rotate = 2


"markdown-preview
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0
" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1
" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0
" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0
" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0
" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''
" specify browser to open preview page
" default: ''
let g:mkdp_browser = 'firefox'
" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0
" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''
" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }
" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''
" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''
" use a custom port to start server or random for empty
let g:mkdp_port = ''
" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'
" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']
" mappings
nmap <Leader>mt <Plug>MarkdownPreviewToggle


"fzf
" Empty value to disable preview window altogether
let g:fzf_preview_window = []
nmap <Leader>ff :Files<CR>
nmap <Leader>sf :Ag<CR>
nmap <Leader>bf :Buffers<CR>


"color scheme
colorscheme gruvbox
set background=dark

"enable syntax
syntax enable
