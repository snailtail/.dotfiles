" Map leader key
let mapleader = " "

" ==========================
" Grundläggande kompabilitet
" ==========================

" Stänger av gammalt Vi-kompabilitetsläge
" Gör att Vim beter sig som modern Vim, inte 1970-tals vi.
set nocompatible

" ==========================
" Syntax & filtyper
" ==========================

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Slår på syntaxhighlighting
syntax enable

" Snyggare whitespace om du använder :set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

" Delete comment character when joining commented lines.
set formatoptions+=j

" Replace the check for a tags file in the parent directory of the current
" file with a check in every ancestor directory.
setglobal tags-=./tags tags-=./tags; tags^=./tags;

" Läs in förändrad fil automatiskt
set autoread

" Saving options in session and view files causes more problems than it
" solves, so disable it.
set sessionoptions-=options
set viewoptions-=options

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^Eterm'
  set t_Co=16
endif

" Aktiverar filtypsdetektering:
" - laddar rätt inställningar per filtyp
" - korrekt indentering för t.ex .css, .sh, .json
filetype plugin indent on

" ===========================
" Visuellt & beteende
" ===========================

" Färgschema
set termguicolors
colorscheme evening
set background=dark


" Visar radnummer till vänster (1, 2, 3, ...)
set number

" Visar relativa radnummer:
" aktuell rad = 0, ovanför/under = avstånd i rader
" Gör kommandon som '5j' och '3k' extremt kraftfulla
set relativenumber

" Gör backspace lite mer resonabel.
set backspace=indent,eol,start

" Always show the status line at the bottom, even if you only have one window
" open
set laststatus=2
" Förhindrar automatiskt radbrytning vid långa rader
" Bra för kod, JSON, loggar mm.
set nowrap

" Tillåt "hidden buffer"
set hidden

" =========================
" Sökbeteende
" =========================

" Visar matchningar medan du skriver söksträngen
" Ex: /foo → markerar direkt
set incsearch

" Markerar alla träffar efter en sökning
set hlsearch

" mappa dubbla leader till att rensa highlights från sökningar
nnoremap <leader><leader> :noh<CR>

" Koppla bort irriterande Q binding till "Ex mode".
nmap Q <Nop>

" Stäng av irriterande hörbar "bell"
set noerrorbells visualbell t_vb=

" Tillåt musanvändning, försök låta bli dock. Men ibland kan det vara det
" bästa för stunden.
set mouse+=a

" Gör sökning case-insensitive (a = A)
set ignorecase

" Men: om sökningen innehåller versal,
" då blir sökningen case-sensitive
" Ex: /Foo matchar bara Foo, inte foo
set smartcase


" =========================
" Indentering & tabbar
" =========================

" En tab räknas som 4 mellanslag visuellt
set tabstop=4

" När du indentera med >> eller << flyttas 4 mellanslag
set shiftwidth=4

" Använder mellanslag istället för riktiga tab-tecken
" (viktigt i de flesta kodbaser)
set expandtab

" Smart indentering baserat på kodstruktur
" (klamrar, block, etc)
set smartindent


" =========================
" Key mappings (små livsförbättringar)
" =========================
" auto centre on vertical motions like Control up, down, find next and so on
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")

" Remap next buffer to <leader>n
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprevious<CR>
" I insert mode:
" om du snabbt skriver 'jk' så går Vim till normal mode
" (bekvämare än att sträcka sig till Esc hela tiden)
inoremap jk <Esc>

" FILE BROWSING:

" Tweaks for file browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view

" Spell checking, and completion for that as well, is on!
set complete+=kspell
set spell

" SNIPPETS:
" read an empty html template and move cursor to title
" <CR> = Carriage Return to end the Command mode.
" 3jwf>a means 3j, then w to go to the first "word" which is the <title>, then
" f> to find the next > character and go there, and lastly a to enter "append
" mode" which positions the cursor right after the > which is inbetween the
" <title><title> tags
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>
" slask
