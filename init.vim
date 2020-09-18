"Enable file type detection
filetype on
"Load the corresponding plug-in according to the different types detected
filetype plugin on

set nocompatible

"about encoding
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936


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
nmap <Leader>bd <Esc>:bd<CR>
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
"leaderF--fuzzy find
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
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
"markdown-preview.nvim
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
"vimtex
Plug 'lervag/vimtex'
"This is a simple plugin for Vim that will allow you to have a set of templates for certain file types.
Plug 'aperezdc/vim-template',{'frozen': 1}
"align text by some character
Plug 'tommcdo/vim-lion'

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
nmap <F2> :TagbarToggle<CR>
let g:tagbar_ctags_bin='/usr/bin/ctags'


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


"about LeaderF
"fuzzy find file
let g:Lf_ShortcutF = "<leader>ff"
"set separator
let g:Lf_StlSeparator = { 'left': '|', 'right': '|' }
"fuzzy find grep using rg
noremap <leader>sf :<C-U><C-R>=printf("Leaderf rg %s", "")<CR><CR>
"fuzzy find line in buffer
noremap <leader>sb :<C-U><C-R>=printf("Leaderf line")<CR><CR>
" search word under cursor, the pattern is treated as regex
noremap <leader>sd :<C-U><C-R>=printf("Leaderf rg -s -w %s ", expand("<cword>"))<CR><CR>
"Recall last rg search result
noremap <leader>sr :<C-U><C-R>=printf("Leaderf rg --recall")<CR><CR>


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
"highlight mathematical formula
let g:vim_markdown_math = 1
"disable syntax concealing
let g:vim_markdown_conceal = 0


"about markdown-preview.nvim
let g:mkdp_browser = 'firefox'


"about vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

"about templates
let g:templates_use_licensee=0



"color scheme
colorscheme gruvbox
set background=dark

"enable syntax
syntax enable


"Code folding based on indent
"set foldmethod=indent
set foldmethod=indent
"Close the folding code when you start vim
set nofoldenable

