" Vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'w0rp/ale'
Plugin 'Raimondi/delimitMate'
Plugin 'tmhedberg/matchit'
Plugin 'scrooloose/nerdtree'
Plugin 'leafgarland/typescript-vim'
Plugin 'vim-scripts/scratch.vim'
Plugin 'majutsushi/tagbar'
Plugin 'pangloss/vim-javascript'
Plugin 'MaxMEllon/vim-jsx-pretty'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'wlangstroth/vim-racket'
Plugin 'tpope/vim-sleuth'
Plugin 'vim-scripts/xterm16.vim'
Plugin 'rdnetto/YCM-Generator'

call vundle#end()
filetype plugin indent on 

" Features
set t_Co=16
set nocompatible
filetype indent plugin on
syntax on
set omnifunc=syntaxcomplete#Complete
set wildmenu
set shell=/bin/mksh
set iskeyword-=_
set showcmd
set nocompatible
set exrc
set secure
set hidden
set pastetoggle=<f11>
set backupdir=~/.vim/backup//
set directory=~/.vim/backup/swp//
set undodir=~/.vim/backup/un//
set shortmess=AItfilmnrw
set linebreak
set bg=dark
set modelines=0
set nomodeline
set cc=73,81,101
set numberwidth=6
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set hlsearch
set ignorecase
set smartcase
set autoindent
set nostartofline
set ruler
set laststatus=2
set visualbell
set t_vb=
set mouse=a
set cmdheight=1
set number
set notimeout ttimeout ttimeoutlen=200
set pastetoggle=<F11>

" Indentation
set tabstop=8
set shiftwidth=8
set noexpandtab
set softtabstop=8
set autoindent
set smartindent
" set nowrap
set clipboard=unnamed
filetype indent on

" Keybinds
" Toggle Wrapping
inoremap <F9> :set wrap!<CR>i
nnoremap <F9> :set wrap!<CR>
nnoremap <C-k> :Scratch<CR>
" Break line at cursor
nnoremap <silent> <C-c> i<CR><Esc>
" Nerdtree
nnoremap <silent> <C-t> :NERDTreeToggle<CR>
nnoremap <silent> <C-b> :TagbarToggle<CR>
" Other
nnoremap <C-z> <NOP> 
nnoremap <F1> <NOP>
nnoremap j gj
nnoremap k gk
nnoremap <S-T> :bn<CR>
nnoremap <S-Y> :bp<CR>
nnoremap [[ :ALENextWrap<CR>
nnoremap ]] :ALEPreviousWrap<CR>
inoremap <C-BS> <C-W>
nnoremap r R
nnoremap R ^R
nnoremap <C-i> hi
map <silent> <M-t> :tabn<CR>
map <silent> <M-y> :tabp<CR>
nnoremap <C-L> :nohl<CR><C-L>
noremap  <F5> :let &l:imi = !&l:imi<CR>
inoremap <F5> <C-O>:let &l:imi = !&l:imi<CR>
cnoremap <F5> <C-^>

" Syntastic
set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_c_checkers=['gcc']
" let g:syntastic_cpp_checkers=['gcc']
" let g:syntastic_python_checkers=['pyflakes']
" let g:syntastic_typescript_tsc_fname = ''
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_python_python_exec = 'python3'
" let g:syntastic_python_checkers = ['python']

" ALE
let g:ale_sign_error = 'xx'
let g:ale_sign_warning = '..'
let g:ale_javascript_eslint_use_global = 1
 
" Highlighting
highlight ColorColumn ctermbg=8
highlight LineNr ctermfg=8
highlight StatusLine ctermfg=0 ctermbg=7
highlight StatusLineNC ctermfg=0 ctermbg=7
highlight NonText ctermfg=8

" Tagbar
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1

" Misc
let NERDTreeShowHidden=1
let g:syntastic_java_javac_config_file_enabled=1
let g:syntastic_java_javac_classpath = ".lib/*.jar\n./src/\n.bin/"
filetype on
filetype plugin on
syntax on

" Neovim Shit
set ttimeout
set ttimeoutlen=0

" Execute 'lnoremap x X' and 'lnoremap X x' for each letter a-z.
for c in range(char2nr('A'), char2nr('Z'))
        execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
        execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfor
" Kill the capslock when leaving insert mode.
autocmd InsertLeave * set iminsert=0
set clipboard+=unnamedplus

"Undo Persistence
set undofile
