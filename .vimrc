set nocompatible      " We're running Vim, not Vi!

syntax on             " Enable syntax highlighting
syntax enable
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

runtime macros/matchit.vim

" dark color
" colorschem xoria256

" light color
" colorschem summerfruit256 

set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar

" trigger scss from css
au BufNewFile,BufRead *.scss set ft=scss.css

hi Visual ctermfg=black ctermbg=yellow
" hi TabLine ctermfg=white ctermbg=black
" hi TabLineSel ctermfg=Red ctermbg=Yellow

let mapleader = ","

" Nerdtree
nmap <leader>n :NERDTree<cr>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']
let g:NERDTreeWinSize=20

" Split Window Resize
nmap <C-v> :vertical resize +5<cr>
nmap <C-m> :vertical resize -5<cr>

" Vim Split
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-H>

" Note that remapping C-s requires flow control to be disabled
" (e.g. in .bashrc or .zshrc)
map <C-h> :nohl<cr>
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map <C-t> <esc>:tabnew<CR>
map <C-x> <C-w>c
map <C-n> :cn<CR>
map <C-p> :cp<CR>

" My preference with using buffers. See `:h hidden` for more details
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bv :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" folding
nnoremap <Space> za
vnoremap <Space> za

" Simple CSS bracket close
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>0
inoremap {{     {
inoremap {}     {}

set autoindent                  " always set autoindenting on
set autowrite                   " Save on buffer switch
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set copyindent                  " copy the previous indentation on autoindenting
set expandtab                   " expand tabs by default (overloadable per file type later)
set foldlevelstart=0
set go-=L                       " Removes left hand scroll bar
set incsearch                   " highlight while searching
set hlsearch
set ignorecase                  " ignore case when searching
set linespace=15

" Display whitespace
set list listchars=tab:»·,trail:·,nbsp:·

set mouse=a
set number                      " always show line numbers
set noerrorbells                " don't beep
set pastetoggle=<leader>p       " paste mode
set relativenumber
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set shiftwidth=2                " number of spaces to use for autoindenting
set showmode                    " always show what mode we're currently editing in
set smartcase                   " ignore case if search pattern is all lowercase,
set smartindent
set smarttab
set softtabstop=2               " when hitting <BS>, pretend like a tab is removed, even if spaces
set tabstop=2                   " a tab is four spaces
set tags=tags
set timeout timeoutlen=200 ttimeoutlen=100
set visualbell                  " don't beep
set wrap

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'L9'
Plugin 'file:///home/gmarik/path/to/plugin'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'user/L9', {'name': 'newL9'}
Plugin 'git@github.com:kien/ctrlp.vim.git'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree.git'
Plugin 'git@github.com:jeetsukumaran/vim-buffergator.git'
Plugin 'git@github.com:terryma/vim-multiple-cursors.git'
Plugin 'git@github.com:ddollar/nerdcommenter.git'
Plugin 'git@github.com:tpope/vim-unimpaired.git'
Plugin 'git@github.com:scrooloose/syntastic.git'
Plugin 'git@github.com:chrisbra/NrrwRgn.git'
Plugin 'git@github.com:Lokaltog/vim-easymotion.git'
Plugin 'git@github.com:ervandew/supertab.git'
Plugin 'git@github.com:Raimondi/delimitMate.git'
Plugin 'burnettk/vim-angular'
Plugin 'vim-ruby/vim-ruby'

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'mileszs/ack.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Easy escaping to normal model
imap jj <esc>
imap jk <esc>

" Quit with Q
command -nargs=0 Quit :qa!

" Find hidden files with controlP
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 2
let g:ctrlp_by_filename = 1
let g:ctrlp_max_files = 600
let g:ctrlp_max_depth = 7

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Powerline and Airline? (Fancy thingy at bottom stuff)
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
" let g:Powerline_symbols = 'fancy'
" let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the
" statusline)
