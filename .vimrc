" My .vimrc configuration
" setcain - https://github.com/setcain/dotfiles/.vimrc

" ===============================================
"            Add basics configuration
" ===============================================
set nocompatible       " Disable vi compatibility mode
set colorcolumn=80     " Column limit
syntax on              " Color in syntax
set number             " Show a line number
set relativenumber     " Relative numbers in line numbers
set noswapfile         " No swap files
set nobackup           " If you need backup something use Git
set nowrap             " No wrap in long lines
set cursorline         " Highlight in line
set cursorcolumn       " Highlight in column 
set showmatch          " Highlight parentheses and brackets

" Status bar
set showmode           " Always show mode
set laststatus=2       " Always show status bar
set wildmenu           " Enable menu options whit tab
set ruler              " Enable ruler percent

" For other OS
set encoding=utf-8              " Always use unicode
set backspace=indent,eol,start  " Backspace always work on insert mode

" Spaces and indentation
set shiftwidth=4       " Space in identation
set softtabstop=4      " Same identation when run back
set expandtab          " Space no tabs
set autoindent         " Autoident always on

" 2 space indenting in html, css, javascript and json files
autocmd FileType html setlocal shiftwidth=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 softtabstop=2
autocmd FileType js setlocal shiftwidth=2 softtabstop=2
autocmd FileType php setlocal shiftwidth=2 softtabstop=2
autocmd FileType json setlocal shiftwidth=2 softtabstop=2



" ===============================================
"               Vundle start
" ===============================================
" If Vundle is not installed
if empty(glob("~/.vim/bundle"))
    silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    autocmd vimEnter * PluginInstall
end

" Vundle begin
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Basic plugins
Plugin 'scrooloose/nerdtree'             " File manager
Plugin 'ap/vim-buftabline'               " Transform buffers in tabs
Plugin 'ctrlpvim/ctrlp.vim'              " Helps to find files in a proyect

" Basic programming plugins
Plugin 'tpope/vim-surround'              " Change brackets, parent, etc
Plugin 'jiangmiao/auto-pairs'            " Auto close brackets, parent, etc
Plugin 'majutsushi/tagbar'               " Navbar with functions, vars, etc
Plugin 'ervandew/supertab'               " Complete name functions and vars
Plugin 'tpope/vim-commentary'            " Simple commentary
Plugin 'vim-syntastic/syntastic'         " Syntax for many languages
Plugin 'Valloric/YouCompleteMe'          " Code completion

" Git
Plugin 'airblade/vim-gitgutter'          " Git helps in files
Plugin 'tpope/vim-fugitive'              " Git comands in vim

" web languages
Plugin 'mattn/emmet-vim'                 " Emmet for vim

" Python
" Plugin 'davidhalter/jedi-vim'            " Autocomplete 
" Plugin 'python-mode/python-mode'         " Toolbox
" Plugin 'jmcantrell/vim-virtualenv'       " Virtualenv in vim 

" Colors
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'altercation/vim-colors-solarized'
Plugin 'sickill/vim-monokai'

call vundle#end()            " required
filetype plugin indent on    " required



"================================================
"                    Maps
" ===============================================
let mapleader=","

" Change Esc key 
inoremap ii <Esc>

" Some easy moves
nmap <Leader>x :bd<cr>
nmap <Leader>q :q<cr>
nmap <Leader>w :w<cr>
nmap <Leader>e :wq<cr>

" Sorry but don't have arrow keys in normal mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l



"================================================
"               Maps plugins
"================================================

" NERDTree
nmap <Leader>nt :NERDTreeToggle<cr>
let NERDTreeWinSize=20

" Buftabline
set hidden
nnoremap <Leader>n :bprev<cr> 
nnoremap <Leader>m :bnext<cr> 

" Tagbar
nmap <F8> :TagbarToggle<cr>
let tagbar_width=20

" ctrlp
let g:ctrlp_map = '<Leader>p'



"================================================
"               Plugin Options 
"================================================

" jedi
let g:jedi#rename_command = 0
let g:jedi#documentation_command = 0

" pymode
let g:pymode_folding = 1
let g:pymode_rope = 0

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" YCM Options
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_list_select_completion = ['<Tab>']



" ===============================================
"                  Functions
" ===============================================

" Color default
if &t_Co >= 256 || has("gui-running")
    color Tomorrow-Night
endif

" Relative number on/off
function! ToggleRelativeNumber()
    if &relativenumber == 1
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunction

nmap <F5> :call ToggleRelativeNumber()<cr>
imap <F5> <Esc>: call ToggleRelativeNumber()<cr>a
