" Core Options {{{1
scriptencoding utf-8          " Set encoding to utf-8, fixes macvim bug for
                              " using unicode characters in listchars

set autoread
set nobackup
set noswapfile

set confirm
set ignorecase
set infercase
set smartcase
set hlsearch
set splitbelow
set splitright

set suffixesadd+=.js,.rb

" Vim supports dictionary autocomplete Ctrl_X+Ctrl_K
set dictionary+=/usr/share/dict/words
" Vim supports thesaurus autocomplete Ctrl_X+Ctrl_T
set thesaurus+=~/.vim/spell/mthesaur.txt

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --column
  command! -bar -nargs=+ -complete=file Ag silent! grep! <args>|redraw!
else
  set grepprg=grep\ -rnH\ --exclude=tags\ --exclude-dir=.git\ --exclude-dir=node_modules
endif

set clipboard=unnamedplus

" Undo Options {{{2
set undofile                  " Use undofile to persist undo history
set undolevels=1000           " Increase undo level to 1000
set undodir=~/.vim/undo       " Specifies where to keep undo files
if !isdirectory(expand('~/.vim/undo'))
  silent !mkdir -p ~/.vim/undo
endif

" Spell Settings {{{2
set spelllang=en_us
set spellsuggest=best,5

" Formatting Options {{{1
set nowrap
set linebreak
set expandtab
set tabstop=2
set nojoinspaces
set shiftwidth=2              " Tabs under smart indent
set softtabstop=2
set number
set numberwidth=3
set nostartofline
set fileformat=unix
set virtualedit=block
set formatoptions+=tcroqnj

" Visual Options {{{1
syntax on
filetype plugin indent on

set title
set hidden
set cmdheight=1
set matchtime=5
set novisualbell
set noerrorbells
set ttymouse=xterm2
set lazyredraw
set cursorline
set updatetime=1000

set list
if (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8') && version >= 700
  set listchars=tab:\ \ 
  set listchars+=eol:¬
  set listchars+=trail:⋅
  set listchars+=extends:→
  set listchars+=precedes:←
  set listchars+=nbsp:+

  set fillchars=stl:\ 
  set fillchars+=stlnc:\ 
  set fillchars+=vert:\|
  set fillchars+=fold:\⋅
  set fillchars+=diff:-
else
  set listchars=tab:\ \ 
  set listchars+=eol:$
  set listchars+=trail:~
  set listchars+=extends:>
  set listchars+=precedes:<
  set listchars+=nbsp:+
endif
set showbreak=↪
set mousehide
set mouse=a                   " Enables mouse within terminals

set foldenable
set foldmethod=indent
set foldlevel=0

if has('balloon_eval') && has('unix')
  set ballooneval
endif

" Provides nice wild menu completion, makes command completion in ambiguous
" case very easy
set wildmenu wildmode=full
set wildignorecase
set wildignore+=*.swp,*.bak,*.pyc,*.class,*.o,*.obj,.git,tags

" let g:solarized_termcolors=256
" color solarized
color railscasts
