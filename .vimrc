"Vundle"

" vundle {{{1

" needed to run vundle (but i want this anyways)
set nocompatible

" vundle needs filtype plugins off
" i turn it on later
filetype plugin indent off
syntax off

" set the runtime path for vundle
set rtp+=~/.vim/bundle/Vundle.vim

" start vundle environment
call vundle#begin()

" list of plugins {{{2
" let Vundle manage Vundle (this is required)
Plugin 'gmarik/Vundle.vim'

" YOUR LIST OF PLUGINS GOES HERE LIKE THIS:
Plugin 'bling/vim-airline'
Plugin 'elzr/vim-json'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/goyo.vim'
Plugin 'flazz/vim-colorschemes'
"Sensible defaults
"Plugin 'tpope/vim-sensible'
":SudoWrite / :SudoEdit / :Chmod
"Plugin 'tpope/vim-eunuch'
Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'philippeback/vim-urbit'
"Plugin 'fatih/vim-go'

" Bundle 'joonty/vim-phpqa.git'
" vim +BundleInstall +qall
" add plugins before this
"
"
" https://github.com/joonty/vim-phpqa

call vundle#end()

" now (after vundle finished) it is save to turn filetype plugins on
filetype plugin on
syntax on

set t_Co=256

let mapleader = ";"

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


" Set the codesniffer args
let g:phpqa_codesniffer_args = "--standard=psr2"

" Don't run messdetector on save (default = 1)
let g:phpqa_messdetector_autorun = 0

" Don't run codesniffer on save (default = 1)
let g:phpqa_codesniffer_autorun = 0

" Show code coverage on load (default = 0)
let g:phpqa_codecoverage_autorun = 0



" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
    "
"/Vundle"

"
"Philippe Back's .vimrc habits...
"

set history=150		" keep 50 lines of command line history
set tabpagemax=100

set number
set incsearch
set wrapscan
set vb t_vb=
set ru
set ls=2
set showcmd
set backspace=start,indent,eol
"briefly show matching braces
set showmatch
let g:netrw_liststyle=3

let cscheme="louver"
let cscheme="shadesofamber"
let cscheme="molokai"
let cscheme="herald"
let cscheme="obsidian"

exe "colorscheme " . cscheme
"PLAIN THEMES
"blue
"DARK THEMES
"chance-of-storm
"fruity
"ir_black
"jellybeans
"molokai
"peaksea
"shadesofamber
"LIGHT THEMES
"mayansmoke
"louver
"pyte

function! ToggleGUICruft()
  if &go==''
    exec('se go=mTrL')
  else
    exec('se go=')
  endif
endfunction
map <F11> <Esc>:call ToggleGUICruft()<cr>

map <F6> :bn<CR>

"No damn sound
set noerrorbells
set visualbell
"No damn flash
set t_vb=

filetype plugin on

"-------------------------------------------------------------------------------
" Moving cursor to other windows:
" shift down   : change window focus to lower one (cyclic)
" shift up     : change window focus to upper one (cyclic)
" shift left   : change window focus to one on left
" shift right  : change window focus to one on right
"-------------------------------------------------------------------------------
nnoremap <s-down>   <c-w>w
nnoremap <s-up>     <c-w>W
nnoremap <s-left>   <c-w>h
nnoremap <s-right>  <c-w>l

"-------------------------------------------------------------------------------
" toggle insert mode <--> 'normal mode with the <RightMouse>-key
"-------------------------------------------------------------------------------
nnoremap  <RightMouse> <Insert>
inoremap  <RightMouse> <ESC>


"Windows
"
if has("win64") || has("win32")
  set guifont=Consolas_Bold:h10:b
  set guifont=Bitstream\ Vera\ Sans\ Mono:h10
  set guifont=Source\ Code\ Pro:h10:b
endif

" OSX
"
if has("macunix")
  set guifont=Monaco:h16
  set guifont=Source\ Code\ Pro_Bold:h16
endif

set guifont="Monospace:h14"

" Annoying little critter on belgian keyboard making it hard to type C-]
" No need to, as C-$ works map <C-l> <C-]>

"K and Man cmd
runtime! ftplugin/man.vim
runtime! plugin/taglist.vim
"set expandtab=1
"set expandtab=1
"set softtabstop=2

" >> << and == effect
set shiftwidth=4
set softtabstop=4
" width of tab character
set tabstop=8
" expand tabs: no way - tabs are 8 places on Unix. Live with it.
set noexpandtab
"Just in case of need of a modeline: 
"/* vim: tabstop=8:softtabstop=4:shiftwidth=4:noexpandtab */

"Print line numbers
set printoptions+=number:y

"identing mode
filetype indent on
filetype indent plugin on

"indent everything and return where it all started (uses z mark)
map <F7> mzgg=G`z<CR>
map <F8> :TlistToggle<CR>
imap <F8> <ESC>TlistOpen<CR>

"Buffer delete: bd (works with bd2 or bd1,3
"Also we can use bw (buffer wipeout!)
map <F4> <ESC>:bd<CR>

"great for reading
nmap <Space> <PageDown>
nmap <S-Space> <PageUp>

"Get rid of bad habits
let s:badhabits=0
if (s:badhabits>0)
	map <up> <nop>
	map <down> <nop>
	map <left> <nop>
	map <right> <nop>

	imap <up> <nop>
	imap <down> <nop>
	imap <left> <nop>
	imap <right> <nop>
endif

"Folding

"select block, then :fold
"    zo - open
"    zc - close

"If you want to know the number of lines and columns of the editor, look for
"the values of "columns" and "lines" (how strange...)
"To view the values, do :set columns? and :set lines?

"Automatically get out of insert mode... helps with the learning
"au CursorHoldI * stopinsert
" Exits after 4s wich is 'updatetime' default.

"<C-x> f jumps on file under cursor (great!)
 
"Little reminder on Autocompletion

" <C-x><C-n> autocomplete with something further
" <C-x><C-p> autocomplete with previously seen
"
" <C-x><C-f> autocomplete with filenames
" <C-x><C-L> autocomplete with full line
" <C-x><C-k> autocomplete with dictionary word
if has("macunix")
  set dictionary+=/usr/share/dict/words
endif
"<C-x><C-o> omnicompletion
"help ins-completion
let g:netrw_alto = 1
let netrw_altv = 1

"Some support for vsplit being a bit more civil

" function! SmartWidth( width )
"     let num_wins = 0
"     windo let num_wins+=1
"     sil exe "set columns=" . num_wins * a:width
"     sil exe "normal! \<c-w>="
" endfunction
" 
" 
"   
" autocmd VimEnter * call SmartWidth(80)
" autocmd WinEnter * call SmartWidth(80)

"Turn off autocommenting.
autocmd FileType * setlocal formatoptions-=ro

au BufNewFile,BufRead *.monkey setf monkey

if has("macunix")
"map <F9> :exe ":!C:/Monkey/bin/trans_winnt -target=html5 -run "c:/WorkspaceMonkey/TDM/tables.monkey"<cr>

map <leader>e <ESC>:!/Users/philippeback/Documents/Monkey/MonkeyPro/bin/trans_macos -target=html5 -run /Users/philippeback/Documents/Monkey/workspace2/TDM/tables.monkey<CR>
map <leader>g <ESC>:!/Users/philippeback/Documents/Monkey/MonkeyPro/bin/trans_macos -target=glfw -run /Users/philippeback/Documents/Monkey/workspace2/TDM/tables.monkey<CR>
map <leader>c <ESC>:!/Users/philippeback/Documents/Monkey/MonkeyPro/bin/trans_macos -target=glfw -check /Users/philippeback/Documents/Monkey/workspace2/TDM/tables.monkey<CR>
map <leader>b <ESC>:!/Users/philippeback/Documents/Monkey/MonkeyPro/bin/trans_macos -target=glfw -build /Users/philippeback/Documents/Monkey/workspace2/TDM/tables.monkey<CR>
map <leader>o <ESC>:!/Users/philippeback/Documents/Monkey/MonkeyPro/bin/trans_macos -target=ios -run /Users/philippeback/Documents/Monkey/workspace2/TDM/tables.monkey<CR>
map <leader>h <ESC>:!open /Users/philippeback/Documents/Monkey/MonkeyPro/docs/html/index.html<CR>
map <leader>g <ESC>:Ex ~/Documents/Monkey/workspace2/TDM<CR>
map <leader>v <ESC>:e ~/.vimrc<CR>
endif

if has("win64") || has("win32")
map <leader>v <ESC>:e C:\Program Files (x86)\Vim\_vimrc<CR>
endif

map <leader>x <ESC>:Ex<CR>
map <leader>v <ESC>:e ~/.vimrc<CR>

map <leader>n :NERDTreeToggle<CR>

let g:netrw_alto = 1
let g:netrw_altv = 1
let g:netrw_liststyle=3
let g:netrw_banner = 0
" sort is affecting only: directories on the top, files below
let g:netrw_sort_sequence = '[\/]$,*'
" use the previous window to open file
let g:netrw_browse_split = 4

set mouse=a

let mapleader=";"

map <leader>v	<ESC>:tabe ~/.vimrc<CR>
map <leader>x	<ESC>:Explore!<CR>
map <leader>q	<ESC>:q<CR>
map <leader><CR>    <ESC><c-w>l<ESC>:q!<CR><ESC>v<c-w>h
map <a-right>    <ESC><c-w>l<ESC>:q!<CR><ESC>v<c-w>h

command! -nargs=+ Se execute 'vimgrep /' . [<f-args>][0] . '/ **/*.' . [<f-args>][1]
" e.g.
" :Se SearchItem extension
" :Se function js
" :Se class pp
"
"
"Quickfix commands
" cfirst cf
" cnext cn
" cprev cp
" cl - list
" co - open list (big)
" help quickfix
" Make the window move around:
"
"<c-w>K HJKL
"
set history=150		" keep 50 lines of command line history
set tabpagemax=100

set number
set incsearch
set wrapscan
set vb t_vb=
set ru
set ls=2
set showcmd
set backspace=start,indent,eol

"briefly show matching braces
set showmatch

 "No damn sound
set noerrorbells
set visualbell
"No damn flash
set t_vb=

"-------------------------------------------------------------------------------
" Moving cursor to other windows:
" shift down   : change window focus to lower one (cyclic)
" shift up     : change window focus to upper one (cyclic)
" shift left   : change window focus to one on left
" shift right  : change window focus to one on right
"-------------------------------------------------------------------------------
nnoremap <s-down>   <c-w>w
nnoremap <s-up>     <c-w>W
nnoremap <s-left>   <c-w>h
nnoremap <s-right>  <c-w>l

" >> << and == effect
set shiftwidth=4
set softtabstop=4
" width of tab character
set tabstop=8
" expand tabs: no way - tabs are 8 places on Unix. Live with it.
set noexpandtab
"Just in case of need of a modeline: 
"/* vim: tabstop=8:softtabstop=4:shiftwidth=4:noexpandtab */

"Print line numbers
set printoptions+=number:y

"identing mode
filetype indent on
filetype indent plugin on
"
"indent everything and return where it all started (uses z mark)
"
"Buffer delete: bd (works with bd2 or bd1,3
"Also we can use bw (buffer wipeout!)
map <F4> <ESC>:bd<CR>

"great for reading
nmap <Space> <PageDown>
nmap <S-Space> <PageUp>
