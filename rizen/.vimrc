set nocompatible 
filetype off

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

"dynamic colorscheme 
Plug 'dylanaraps/wal.vim'

"git wrapper
Plug 'tpope/vim-fugitive'

"folder browser
Plug 'scrooloose/nerdtree'

"surround
Plug 'tpope/vim-surround'

"file finder
Plug 'kien/ctrlp.vim'

"status line
Plug 'bling/vim-airline'


" Initialize plugin system
call plug#end()

"generic
syntax enable
set showcmd
set visualbell
set wildmenu
set wildmode=list:longest,full
set splitright
set mouse=a
set t_Co=256
set background=dark

"tab spaces
set smartindent
set shiftwidth=4
set softtabstop=4
set backspace=indent,eol,start

"search
set incsearch
set hlsearch
set ignorecase
set gdefault
set showmatch

"line numbers
set number
set numberwidth=5
set ruler
"set cursorline

set rnu
function! ToggleNumbersOn()
    set nu!
    set rnu
endfunction

function! ToggleRelativeOn()
    set rnu!
    set nu
endfunction

autocmd FocusLost * call ToggleRelativeOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleRelativeOn()
autocmd InsertLeave * call ToggleRelativeOn()

"scrolling
set scrolloff=8
set sidescrolloff=15
set sidescroll=1


"airline
let g:airline_powerline_fonts = 1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='solarized'


"CtrlP
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_user_command = 'ag %s --vimgrep -g ""'
    let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_use_caching = 0
    let g:ctrlp_extensions = ['line']
endif

"keybindings
nmap <silent> <leader>t :NERDTreeToggle<CR>
"nmap <silent> <leader>b :TagbarToggle<CR>
nnoremap <silent> <leader>, :noh<cr>

nnoremap <tab> %
vnoremap <tab> %


"colorscheme
colorscheme wal
