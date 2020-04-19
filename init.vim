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


"YCM--Do not update YCM when :PlugInstall
Plug 'ycm-core/YouCompleteMe',{'frozen': 1}
"snippet
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets',{'frozen': 1}
"nerdtree
Plug 'scrooloose/nerdtree'
"color scheme
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
"airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"leaderF--fuzzy find
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
"gina.vim--git
Plug 'lambdalisue/gina.vim'
"gitgutter--dispaly git diff in gutter
Plug 'airblade/vim-gitgutter'
"nerdcommenter--comment
Plug 'scrooloose/nerdcommenter'
"Yggdroot/indentLine--display indent line
Plug 'Yggdroot/indentLine'
"ludovicchabant/vim-gutentags--generate ctags
Plug 'ludovicchabant/vim-gutentags'
"liuchengxu/vista.vim--display ctags
Plug 'liuchengxu/vista.vim'
"jiangmiao/auto-pairs
Plug 'jiangmiao/auto-pairs'
"mhinz/vim-startify
Plug 'mhinz/vim-startify'
"easymotion
Plug 'easymotion/vim-easymotion'
"rainbow
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

" Initialize plugin system
call plug#end()




"about YCM
"function of triggering YCM location list
let g:Ycm_location_list_open_flag = 0
function! Ycm_location_list_trigger() abort
    if g:Ycm_location_list_open_flag == 0
        execute 'YcmForceCompileAndDiagnostics'
        execute 'lopen'
        let g:Ycm_location_list_open_flag = 1
        echo g:Ycm_location_list_open_flag
    else
        execute 'lclose'
        let g:Ycm_location_list_open_flag = 0
        echo g:Ycm_location_list_open_flag
    endif
endfunction


let g:ycm_global_ycm_extra_conf='./.ycm_extra_conf.py'
let g:ycm_server_python_interptreter='/usr/lib/python3.7'
"no diagnostics ui
let g:ycm_show_diagnostics_ui = 1
"dont show diagnostic signs in vim gutter
let g:ycm_enable_diagnostic_signs = 0
"dont highlight diagnostic
let g:ycm_enable_diagnostic_highlighting = 0
"You can also see the full diagnostic message for all the diagnostics in the current file in Vim's locationlist, must enable location_list
let g:ycm_always_populate_location_list = 1
"trigger auto complete after entering two chars,but need <Ctrl-space> trigger.
let g:ycm_min_num_identifier_candidate_chars = 2
"use a regular expression as a trigger,not must . or -> or enter<Ctrl-space>
let g:ycm_semantic_triggers =  {
            \	'c,cpp,python,java,go,erlang,perl':['re!\w{2}'],
            \	'cs,lua,javascript':['re!\w{2}'],
            \	'v':['re!\w{2}']
            \}
"set F12 to GoTo
nnoremap <F12> :YcmCompleter GoTo<CR>
"force YCM to immediately recompile your file and open location_list window
nnoremap <F5> :call Ycm_location_list_trigger()<CR><CR>
"enable seed identifiers from syntax
let g:ycm_seed_identifiers_with_syntax = 1
"enable seed identifiers from tags
let g:ycm_collect_identifiers_from_tags_files = 1
"no preview wimdow
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0


"use ultisnips
"let YCM use ultisnips completer
let g:ycm_use_ultisnips_completer = 1
"expand snippet and junp next trigger
let g:UltiSnipsExpandTrigger="<c-j>"


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


"about airline
"Always display status bar
set laststatus=2
"Automatically displays all buffers when there's only one tab open;If set,A string of strange characters will appear every time you start vim.
"let g:airline#extensions#tabline#enabled = 1
"This affects how file paths are displayed
let g:airline#extensions#tabline#formatter = 'unique_tail'
"set tabline separators
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
"enable powerline fonts
let g:airline_powerline_fonts = 1 
"When this variable is defined, only the extensions listed will be loaded; an empty array would effectively disable all extensions
let g:airline_extensions = ['branch', 'tabline']
"set status line Separators
let g:airline_left_sep=' '
let g:airline_right_sep=' '


"about LeaderF
"fuzzy find file
let g:Lf_ShortcutF = "<leader>ff"
"set separator
let g:Lf_StlSeparator = { 'left': '', 'right': '' }
"fuzzy find grep using rg
noremap <leader>sf :<C-U><C-R>=printf("Leaderf rg -S %s", "")<CR><CR>
"fuzzy find line in buffer
noremap <leader>sb :<C-U><C-R>=printf("Leaderf line")<CR><CR>
" search word under cursor, the pattern is treated as regex
noremap <leader>sd :<C-U><C-R>=printf("Leaderf rg -e %s ", expand("<cword>"))<CR><CR>
"Recall last rg search result
noremap <leader>sr :<C-U><C-R>=printf("Leaderf rg --recall")<CR><CR>


"about Vista.vim
nmap <F2> :Vista!!<CR>
"set show on the left
let g:vista_sidebar_position = "vertical topleft"
"Set this option to `1` to close the vista window automatically
let g:vista_close_on_jump = 1


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



"about indentLine
"This variable specify a list of file types.
let g:indentLine_fileType = ['c', 'cpp']
"When opening these types of files, the plugin is disabled by default.
let g:indentLine_fileTypeExclude = ['txt', 'sh']


"about startify
"dont allow startify change to dir when open a file
let g:startify_change_to_dir = 0


"about rainbow
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle


"about vim-markdown
"highlight mathematical formula
let g:vim_markdown_math = 1


"about markdown-preview.nvim
let g:mkdp_browser = 'firefox'


"about vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'



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

