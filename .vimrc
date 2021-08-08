" Vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Plugin 'MaxMEllon/vim-jsx-pretty'
" Plugin 'OrangeT/vim-csharp'
" Plugin 'Raimondi/delimitMate'
" Plugin 'leafgarland/typescript-vim'
" Plugin 'pangloss/vim-javascript'
" Plugin 'peitalin/vim-jsx-typescript'
" Plugin 'xolox/vim-easytags'
Plugin 'scrooloose/nerdtree'
" Plugin 'eiginn/netrw'
Plugin 'preservim/tagbar'
Plugin 'rdnetto/YCM-Generator'
Plugin 'tmhedberg/matchit'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-vinegar'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/xterm16.vim'
Plugin 'vivien/vim-linux-coding-style'
Plugin 'w0rp/ale'
Plugin 'wlangstroth/vim-racket'
Plugin 'xolox/vim-misc'
Plugin 'ycm-core/YouCompleteMe'

call vundle#end()
filetype plugin indent on 

" Features
set t_Co=16
set nocompatible
filetype indent plugin on
syntax on

set autoindent
set backupdir=$HOME/.vim/backup//
set bg=dark
set cc=73,81,101
set cmdheight=1
set directory=$HOME/.vim/backup/swp//
set exrc
set hidden
set hlsearch
set ignorecase
" set iskeyword-=_
set laststatus=2
set linebreak
set modelines=0
set mouse=a
set nocompatible
set nomodeline
set nostartofline
set notimeout ttimeout ttimeoutlen=200
set number
set numberwidth=6
set omnifunc=syntaxcomplete#Complete
set pastetoggle=<F11>
set pastetoggle=<f11>
set ruler
set secure
set shell=/bin/mksh
set shortmess=AItfilmnrw
set showcmd
set smartcase
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set t_vb=
set undodir=~/.vim/backup/un//
set visualbell
set wildmenu

" Indentation
set tabstop=8
set shiftwidth=8
set noexpandtab
set softtabstop=8
set autoindent
set smartindent
set nowrap
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
" nnoremap <silent> <C-b> :TlistToggle<CR>
" Other
nnoremap <C-z> <NOP> 
nnoremap <F1> <NOP>
nnoremap j gj
nnoremap k gk
nnoremap <S-T> :bn<CR>
nnoremap <S-Y> :bp<CR>
nnoremap ]] :ALENextWrap<CR>
nnoremap [[ :ALEPreviousWrap<CR>
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
" let g:ale_linters = {'c': ['gcc']}
let g:ale_linters = {'c': ['clang']}
let g:ale_c_gcc_options = '-Wall -Wextra -std=c99'
let g:ale_c_clang_options = '-Wall -Wextra -std=c99'
let g:ale_c_parse_compile_commands = 1
let g:ale_c_parse_makefile = 1
 
" Highlighting
highlight ColorColumn ctermbg=8
highlight LineNr ctermfg=8
highlight StatusLine ctermfg=0 ctermbg=7
highlight StatusLineNC ctermfg=0 ctermbg=7
highlight NonText ctermfg=8

" Tagbar
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_width = 50
let g:tagbar_sort = 0

" Taglist
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_WinWidth = 50
let Tlist_Use_Right_Window = 1

" Misc
set autochdir

" autocmd BufRead,BufNewFile /home/seiji/SFU/CMPT300/asn2/ let g:ale_c_gcc_options = '-Wall -lsocket -lnsl -Os -std=c99'

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_sort_sequence='\.c$,\.h$,*'
let g:netrw_fastbrowse = 0
" nnoremap <silent> <C-t> :Lexplore<CR>
augroup ProjectDrawer
  autocmd!
augroup END

let NERDTreeShowHidden=1
let g:syntastic_java_javac_config_file_enabled=1
let g:syntastic_java_javac_classpath = ".lib/*.jar\n./src/\n.bin/"
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
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
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set clipboard+=unnamedplus

"Undo Persistence
set undofile
