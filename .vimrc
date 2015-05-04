" w
" Jaysons Custom Vim Mappings
map <F9> :bd<CR>
map <F10> :w<CR>:bd<CR>
nnoremap <F5> :GundoToggle<CR>
map <F6> :NERDTreeToggle<CR>
map <F4> <Esc>ki*<Esc>jji*<Esc>kl
map <S-F6> :set indentexpr=GetPhpIdent()<CR>
map <S-F5> :set indentexpr=XmlIndentGet(v:lnum,1)<CR>
imap <F5> <Esc><F5>
imap <F6> <Esc><F6>
imap <S-F9> <Esc>:bd!<CR>
imap <F9> <Esc><F9>
imap <F10> <Esc><F10>
imap <F11> <Esc><F11>
imap <F12> <Esc><F12>
imap <F2> <Esc><F2>
imap <F7> <Esc><F7>
imap <F3> <Esc><F3>
imap <F4> <Esc><F4>
set nowrap 
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
set pastetoggle=<S-F1>
map <C-\> <F1>:bd<CR>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>

" lhs comments
map ,# :s/^[ \t]*/\0#/<CR>:nohl<CR>
map ,/ :s/^[ \t]*/\0\/\//<CR>:nohl<CR>
map ,> :s/^[ \t]*/\0> /<CR>:nohl<CR>
map ," :s/^[ \t]*/\0\"/<CR>:nohl<CR>
map ,% :s/^[ \t]*/\0%/<CR>:nohl<CR>
map ,! :s/^[ \t]*/\0!/<CR>:nohl<CR>
map ,; :s/^[ \t]*/\0;/<CR>:nohl<CR>
map ,- :s/^[ \t]*/\0--/<CR>:nohl<CR>
map ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>:nohl<CR>

" wrapping comments
map ,* :s/^\(.*\)$/\/\* \1 \*\//<CR>:nohl<CR>
map ,( :s/^\(.*\)$/\(\* \1 \*\)/<CR>:nohl<CR>
map ,< :s/^\(.*\)$/<!-- \1 -->/<CR>:nohl<CR>
map ,d :s/^\([ \t]*\)\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\1\3/<CR>:nohl<CR>
map ,r :s/^\([ \t]*\)\/\//\1/<CR>:nohl<CR>

"if v:progname =~? "evim"
"  finish
"endif
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set ai
set cin
set noet et
set ts=4
set sw=4
set fo+=or
set softtabstop=4

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
if !exists("autocommands_loaded")
	let autocommands_loaded = 1
	

	au BufNewFile,BufEnter *.rb		set ai
	au BufNewFile,BufEnter *.rb		set cin
	au BufNewFile,BufEnter *.rb		set noet et
	au BufNewFile,BufEnter *.rb		set ts=2
	au BufNewFile,BufEnter *.rb		set sw=2
	au BufNewFile,BufEnter *.rb		set softtabstop=2
	au BufNewFile,BufEnter *.rb		set fo+=or

	au BufNewFile,BufEnter *.php		set ai
	au BufNewFile,BufEnter *.php		set cin
	au BufNewFile,BufEnter *.php		set noet et
	au BufNewFile,BufEnter *.php		set ts=4
	au BufNewFile,BufEnter *.php		set sw=4
	au BufNewFile,BufEnter *.php		set fo+=or
	au BufNewFile,BufEnter *.php		set softtabstop=4
	au BufNewFile,BufEnter *.php		match OverLength /\%120v.*/

	au BufNewFile,BufEnter *.inc		set ai
	au BufNewFile,BufEnter *.inc		set cin
	au BufNewFile,BufEnter *.inc		set noet et
	au BufNewFile,BufEnter *.inc		set ts=4
	au BufNewFile,BufEnter *.inc		set sw=4
	au BufNewFile,BufEnter *.inc		set fo+=or

	au BufNewFile,BufEnter *.php3		set ai
	au BufNewFile,BufEnter *.php3		set cin
	au BufNewFile,BufEnter *.php3		set noet et
	au BufNewFile,BufEnter *.php3		set ts=4
	au BufNewFile,BufEnter *.php3		set sw=4
	au BufNewFile,BufEnter *.php3		set fo+=or

	au BufNewFile,BufEnter *.tpl		set ai
	au BufNewFile,BufEnter *.tpl		set cin
	au BufNewFile,BufEnter *.tpl		set noet et
	au BufNewFile,BufEnter *.tpl		set ts=4
	au BufNewFile,BufEnter *.tpl		set sw=4
	au BufNewFile,BufEnter *.tpl		set fo+=or

	au BufNewFile,BufEnter *.html		set ai
	au BufNewFile,BufEnter *.html		set cin
	au BufNewFile,BufEnter *.html		set noet et
	au BufNewFile,BufEnter *.html		set ts=4
	au BufNewFile,BufEnter *.html		set sw=4
	au BufNewFile,BufEnter *.html		set fo+=or

	au BufNewFile,BufEnter *.sql		set ai
	au BufNewFile,BufEnter *.sql		set cin
	au BufNewFile,BufEnter *.sql		set noet et
	au BufNewFile,BufEnter *.sql		set ts=4
	au BufNewFile,BufEnter *.sql		set sw=4
	au BufNewFile,BufEnter *.sql		set fo+=or

    au BufEnter,BufRead,BufNewFile *.md setlocal textwidth=80

endif


" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"if has("vms")
"  set nobackup		" do not keep a backup file, use versions instead
"else
"  set backup		" keep a backup file
"endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  " autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END
else

  set autoindent		" always set autoindenting on

endif " has("autocmd")
filetype plugin on

set vb t_vb=

nnoremap <silent> <F8> :TlistToggle<CR>

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplMapTabSwitchBufs = 1
let g:miniBufExplMapCTabSwitchWindows = 0
let g:miniBufExplModSelTarget = 1 
set hidden
set background=dark
"colorscheme solarized
colorscheme torte
set foldmethod=marker

set nobackup
set ic
set smartcase
set et
set number
autocmd Filetype gitcommit setlocal spell textwidth=72
"autocmd BufWritePre *.php :%s/\s\+$//e
"autocmd BufWritePre *.php :%s/if(/if (/e
"autocmd BufWritePre *.php :%s/foreach(/foreach (/e
autocmd BufWritePost /usr/etsy/deployinator/* :silent !touch /usr/etsy/deployinator/tmp/restart.txt
autocmd BufWritePost /usr/etsy/deployinator2/* :silent !touch /usr/etsy/deployinator2/tmp/restart.txt
autocmd BufWritePost /usr/etsy/deployinator-gem/* :silent !touch /usr/etsy/deployinator2/tmp/restart.txt
set undodir=./.vim-undo//
set undodir+=~/.vim/undo//
set undofile
" Plugin settings:

" NERDTree settings
let NERDTreeHijackNetrw=0
let NERDTreeWinSize=40

" TagList settings
"let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
let Tlist_WinWidth = 50
"let g:tlist_php_settings='php;f:function'
let Tlist_Show_One_File = 1
let Tlist_Close_On_Select = 1
let Tlist_GainFocus_On_ToggleOpen = 1

" command-t settings
let g:CommandTMatchWindowAtTop=1
let g:CommandTMaxFiles=20000

" For BufferList (F2)
let g:BufferListMaxWidth = 60

" For Command-T
let g:CommandTMaxHeight = 20

let g:ctrlp_map = '<Leader>t'
let g:ctrlp_working_path_mode = 2
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

let g:ctrlp_match_window_bottom = 0
 let g:ctrlp_max_height = 20


map <Leader>b :CtrlPBuffer<CR>
map <Leader>l :CtrlPBuffer<CR>
map <leader>r :CtrlPMRU<CR>

let g:ctrlp_mruf_max = 500
let g:ctrlp_mruf_relative = 1

map <Leader>y :call YankLineInfo(0)<CR>
map <Leader>Y :call YankLineInfo(1)<CR>

function! YankLineInfo(get_contents)
    let curr_buff = bufname('%')
    let curr_line = line('.')
    let register = curr_buff . ":" . curr_line
    if a:get_contents
        let curr_contents = getline(line('.'))
        let register .= ": " . curr_contents
    endif
    call setreg('*', register)
endfunction

if &term =~ "xterm" || &term =~ "screen"
    let g:CommandTCancelMap     = ['<ESC>', '<C-c>']
    let g:CommandTSelectNextMap = ['<C-n>', '<C-j>', '<ESC>OB']
    let g:CommandTSelectPrevMap = ['<C-p>', '<C-k>', '<ESC>OA']
endif
if has('mouse')
  set mouse=a
  if &term =~ "xterm" || &term =~ "screen"
    " for some reason, doing this directly with 'set ttymouse=xterm2'
    " doesn't work -- 'set ttymouse?' returns xterm2 but the mouse
    " makes tmux enter copy mode instead of selecting or scrolling
    " inside Vim -- but luckily, setting it up from within autocmds
    " works                   
    autocmd VimEnter * set ttymouse=xterm2
    autocmd FocusGained * set ttymouse=xterm2
    autocmd BufEnter * set ttymouse=xterm2
  endif
endif

if &term =~ '^screen'
    " tmux will send xterm-style keys when xterm-keys is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif
"call pathogen#infect()


set statusline+=%#warningmsg#
set statusline+=%*

"manual shell expansion
com -range Cz :silent :<line1>,<line2>w !xsel -i -b
com -range Cx :silent :<line1>,<line2>w !xsel -i -p
com -range Cv :silent :<line1>,<line2>w !xsel -i -s
ca cv Cv
ca cz Cz
ca cx Cx

com -range Pz :silent :r !xsel -o -b
com -range Px :silent :r !xsel -o -p
com -range Pv :silent :r !xsel -o -s

ca pz Pz
ca px Px
ca pv Pv

set clipboard=unnamed
au BufReadPost * if getfsize(bufname("%")) > 202400 | set syntax= | endif

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
cmap <up> <nop>
cmap <down> <nop>
cmap <left> <nop>
cmap <right> <nop>
imap ctrl+[ <ESC>

let g:ctrlp_extensions = ['funky'] 

nnoremap <Leader>fu :CtrlPFunky<Cr> 
" narrow the list down with a word under cursor 
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr> 
"set relativenumber
function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

let g:fugitive_github_domains = ['github.com','github.etsycorp.com']
