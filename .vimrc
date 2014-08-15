" misc
"set autochdir
set nocompatible  " vim, not vi
set modeline

" functions
source ~/.vimrc_functions

" make vim execute things in bash interactive prompt, to get aliases
":set shellcmdflag=-ic

" backup settings
set backup
set backupcopy=yes   " backup is a copy of orig; orig gets edited
set backupext=~      " suffix for backup files
set backupskip=      " patterns matching files to not backup
set backupdir=$TMPDIR,~/tmp,/tmp,.

" line numbers
set nu

" autowrite
set autowrite

" listchars
set listchars=trail:◃,nbsp:•,tab:»-,extends:…,precedes:…
set list

" color ?
if &term =~ "xterm" || &term =~ "screen"
 set t_Co=256
 if has("terminfo")
   let &t_Sf=nr2char(27).'[3%p1%dm'
   let &t_Sb=nr2char(27).'[4%p1%dm'
 else
   let &t_Sf=nr2char(27).'[3%dm'
   let &t_Sb=nr2char(27).'[4%dm'
 endif
endif
colo desert
hi Search ctermfg=black

" tabulation
set sw=3
set ts=3
set et
set smarttab

" search
set hls
set incsearch
set visualbell

" save history when switching buffers
set hidden

" display
set ls=2

" Highlight lines longer than 79 chars
highlight LongLines ctermbg=darkgrey guibg=darkgrey
autocmd BufRead,BufNewFile * call matchadd("LongLines", '\%80v.\+', -1)

" syntax
filetype plugin indent on
syntax on

" special settings for different filetypes
autocmd FileType python source ~/.vim/py.vim
autocmd FileType c,cpp source ~/.vim/cpp.vim

" tags
set tags=./tags
map <leader>t :tag 
map <leader>t<space> :tag 

" diff
if &diff
   set diffopt=filler,context:10000000 " effectively disable auto-fold
endif
"com! DiffSaved call s:DiffWithSaved()
"map <leader>df :DiffSaved<CR>
"com! DiffSVN call s:DiffWithSVNCheckedOut()
"map <leader>ds :DiffSVN<CR>
map <leader>dx :diffoff<CR>:q<CR>

" tab completion
set wildmode=longest,list,full

" movement
map <C-j> <C-E>
map <C-k> <C-Y>
map <leader>a :call ArrowRemapToggle()<CR>
call ArrowRemapOn() " comment out this line to turn off arrow remap by default

"""""""""""""
"  MAPPINGS "
"""""""""""""

" misc
noremap <space> <PageDown>
noremap <C-?> <PageUp>
map <PageDown> :cn<CR>
map <PageUp> :cp<CR>
map <leader>\ :let @/ = ""<CR>
map <leader>w :w<CR>
map <leader>. :source ~/.vimrc<CR>
map <leader>< :set matchpairs +=<:><CR>
map <leader>cc :cc<CR>
map <leader>cd :cd %:p:h/<CR>

" buffers
map <leader>bb :b 
map <leader>bs :buffers<CR>
map <leader>bd :bp\|bd #<CR>
map <leader>1 :b1<CR>
map <leader>2 :b2<CR>
map <leader>3 :b3<CR>
map <leader>4 :b4<CR>
map <leader>5 :b5<CR>
map <leader>6 :b6<CR>
map <leader>7 :b7<CR>
map <leader>8 :b8<CR>
map <leader>9 :b9<CR>

" toggle things
map <leader>gi :set ic!<CR>:set ic?<CR>
map <leader>gn :set number!<CR>:set number?<CR>
map <leader>gp :set paste!<CR>:set paste?<CR>
map <leader>gx :%!xxd<CR>
map <leader>gX :%!xxd -r<CR>

" tabulation
map <leader>tt :set ts? sw?<CR>
map <leader>t1 :set ts=1<CR>:set sw=1<CR>
map <leader>t2 :set ts=2<CR>:set sw=2<CR>
map <leader>t3 :set ts=3<CR>:set sw=3<CR>
map <leader>t4 :set ts=4<CR>:set sw=4<CR>
map <leader>t5 :set ts=5<CR>:set sw=5<CR>
map <leader>t6 :set ts=6<CR>:set sw=6<CR>
map <leader>t7 :set ts=7<CR>:set sw=7<CR>
map <leader>t8 :set ts=8<CR>:set sw=8<CR>
map <leader>t9 :set ts=9<CR>:set sw=9<CR>

" insert info into current doc
map <leader>id O<ESC>:.! pwd<CR>
map <leader>il O<ESC>:.! ls<CR>

" display info
map <leader>pd :pwd<CR>
map <leader>pl :! ls<CR>

" for executing bash scripts
" shell must be set back to '-c'
" so they don't force vim into background while executing
"   command to execute bash script
map <leader>xb :exe "!git blame -M -L" . line('.') . ",+5 %"<CR>
map <leader>xc :! colortest<CR>
map <leader>xm :! make<CR>
map <leader>xx :! ./%<CR>
map <leader>xX :! chmod -v +x ./%<CR>
map <leader>xt :! nosetests3<CR>

" edit specific filies
map <leader>ev :e ~/.vimrc<CR>
map <leader>esb :e ~/.screenrc_base<CR>
map <leader>ess :e ~/.screenrc_screens<CR>
map <leader>eb :e ~/.bashrc<CR>
map <leader>ea :e ~/.bashrc_aliases<CR>
map <leader>ed :e %:p:h/
map <leader>eh :e %:r.h<CR>
map <leader>ec :e %:r.cpp<CR>
map <leader>em :e %:p:h/CMakeLists.txt<CR>
