" Vundle
if isdirectory(expand('~/.vim/bundle/Vundle.vim'))
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	" Plugin 'MaxMEllon/vim-jsx-pretty'
	" Plugin 'OrangeT/vim-csharp'
	" Plugin 'leafgarland/typescript-vim'
	" Plugin 'pangloss/vim-javascript'
	" Plugin 'peitalin/vim-jsx-typescript'
	" Plugin 'w0rp/ale'
	Plugin 'cespare/vim-toml'
	Plugin 'dpc/vim-smarttabs'
	Plugin 'preservim/tagbar'
	Plugin 'neomake/neomake'
	Plugin 'scrooloose/nerdtree'
	Plugin 'sheerun/vim-polyglot'
	Plugin 'tmhedberg/matchit'
	Plugin 'tpope/vim-commentary'
	Plugin 'vim-scripts/taglist.vim'
	Plugin 'vivien/vim-linux-coding-style'
	Plugin 'wlangstroth/vim-racket'
	Plugin 'xolox/vim-misc'
	if has('nvim') || v:version >= 8.1.2669
		Plugin 'ycm-core/YouCompleteMe'
		Plugin 'rdnetto/YCM-Generator'
	endif
	call vundle#end()
endif

" handle vim vs. neovim backup formats
if has('nvim')
	set backupdir=$HOME/.vim/backup//
	set directory=$HOME/.vim/backup/swp//
	set undodir=~/.vim/backup/un//
else 
	set backupdir=$HOME/.vim/oldvim/backup//
	set directory=$HOME/.vim/oldvim/backup/swp//
	set undodir=~/.vim/oldvim/backup/un//
endif

" Core Stuff I guess
colorscheme disco
filetype indent on
filetype plugin indent on 
set nocp
set t_Co=16
syntax on

" Basic Config
set bg=dark
set cc=73,81,101
set cb+=unnamedplus
set ch=1
set exrc
set hid
set hls
set ic scs
set ls=2
set lbr
set mouse=a
set noml
set nosol
set nu nuw=6
set ofu=syntaxcomplete#Complete
set pt=<F11>
set ru
set secure
if isdirectory(expand('/bin/mksh'))
	set sh=/bin/mksh
else
	set sh=/bin/sh
endif
set shm=AIat
set sc
set undofile
set vb t_vb=
set wmnu

" C Stuff
let g:c_syntax_for_h=1

" Code Folding
set foldmethod=syntax
set foldlevel=99
augroup remember_folds
	autocmd!
	autocmd BufWinLeave * mkview
	autocmd BufWinEnter * silent! loadview
augroup END
function! MyFoldText()
	let nl = v:foldend - v:foldstart + 1
	let comment = substitute(getline(v:foldstart),"^ *","",1)
	let linetext = substitute(getline(v:foldstart+1),"^ *","",1)
	let txt = '+ ' . linetext . ' : length ' . nl
	return txt
endfunction
set foldtext=MyFoldText()

" Status Line
function! GitBranch()
	return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction
function! StatuslineGit()
	let l:branchname = GitBranch()
	return strlen(l:branchname) > 0 ? '[git:'.l:branchname.']':''
endfunction
" Left Side
set stl=%t%m
set stl+=%y
set stl+=[%{strlen(&fenc)?&fenc:'none'},%{&ff}]
set stl+=%{StatuslineGit()}
set stl+=%r%=
" Right Side
if exists("getbufinfo")
	function! BuffersOpen()
		let l:buffers = len(getbufinfo({'buflisted':1}))
		return l:buffers
	endfunction
	set stl+=%c,%l/%L(%P)[0x%02B][bufs:%{BuffersOpen()}]
else
	set stl+=%c,%l/%L(%P)[0x%02B]
endif

" Indentation
set ts=8 sw=8 noet sts=8 ai si
set nowrap

" Keybinds
" Toggle Wrapping
ino <F9> <Esc>:set wrap!<CR>i
nn <F9> :set wrap!<CR>
" Break line at cursor
nn <silent> <C-c> i<CR><Esc>
" Cycle buffers
nn <S-T> :bn<CR>
nn <S-Y> :bp<CR>
" Cycle tabs
map <silent> <M-t> :tabn<CR>
map <silent> <M-y> :tabp<CR>
" Clear search highlight
nn <C-L> :nohl<CR><C-L>
" Avoid help messages
nn <F1> <NOP>
" Make 'R' and 'r' behave like 'I' and 'i'
nn r R
nn R ^R
" Better movement
nn j gj
nn k gk
" Quicker fold toggle

" Neovim Shit
set ttimeout
set ttimeoutlen=0

" Plugin Config
function! PlugConf()
	" Neomake
	if exists(":Neomake")
		call neomake#configure#automake('nrwi', 500)
		let g:neomake_c_enabled_makers=['gcc']
		let g:neomake_gcc_args=[
					\ '-fsyntax-only',
					\ '-std=gnu11',
					\ '-Wall',
					\ '-Wpedantic',
					\ '-Wextra',
					\ '-fopenmp',
					\ '-I.'
					\ ]	
		" Bindings
		nn [[ :lprev<CR>
		nn ]] :lnext<CR>
	endif
	" YouCompleteMe
	if exists(":YcmCompleter")
		let g:ycm_autoclose_preview_window_after_insertion = 1
		let g:ycm_autoclose_preview_window_after_completion = 1
	endif
	" NERDTREE
	if exists(":NERDTree")
		let NERDTreeShowHidden=1
		" Bindings
		nn <silent> <C-b> :TagbarToggle<CR>
		nn <silent> <C-t> :NERDTreeToggle<CR>
	endif
	" ALE
	if exists(":ALEEnable")
		let g:ale_fix_on_save = 1
		let g:ale_sign_error = 'XX'
		let g:ale_sign_warning = '>>'
		let g:ale_linters = {
					\ 'c': ['gcc']
					\}
		" C
		let g:ale_c_gcc_options = '-Wall -Wextra -Wpedantic -std=c11'
		let g:ale_c_parse_compile_commands = 1
		let g:ale_c_parse_makefile = 1
		" Javascript
		let g:ale_javascript_eslint_use_global = 1
		" Bindings
		nn [[ :ALEPreviousWrap<CR>
		nn ]] :ALENextWrap<CR>
		nm <F10> :ALEFix<CR>
	endif
	" Tagbar
	if exists(":Tagbar")
		let g:tagbar_autoclose = 1
		let g:tagbar_autofocus = 1
		let g:tagbar_compact = 1
		let g:tagbar_height = 20
		let g:tagbar_indent = 2
		let g:tagbar_jump_lazy_scroll = 0
		let g:tagbar_position = 'botright'
		let g:tagbar_show_data_type = 1
		let g:tagbar_show_tag_linenumbers = 1
		let g:tagbar_sort = 0
		let g:tagbar_show_visibility = 1
		let g:tagbar_visibility_symbols = {
					\ 'public'    : '+',
					\ 'protected' : '#',
					\ 'private'   : '-'
					\ }
	endif

endfunction

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_sort_sequence='\.c$,\.h$,*'
let g:netrw_fastbrowse = 0
augroup ProjectDrawer
	autocmd!
augroup END

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
au VimEnter * call PlugConf()
if exists(":Neomake")
	au VimEnter * call neomake#configure#automake('nrwi', 500)
endif
