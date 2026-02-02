" ==========================
" Grundläggande kompabilitet
" ==========================

" Stänger av gammalt Vi-kompabilitetsläge
" Gör att Vim beter sig som modern Vim, inte 1970-tals vi.
set nocompatible

" ==========================
" Syntax & filtyper
" ==========================

" Slår på syntaxhighlighting
syntax on

" Aktiverar filtypsdetektering:
" - laddar rätt inställningar per filtyp
" - korrekt indentering för t.ex .css, .sh, .json
filetype plugin indent on

" ===========================
" Visuellt & beteende
" ===========================

" Färgschema
set termguicolors
colorscheme gruvbox
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

" I insert mode:
" om du snabbt skriver 'jk' så går Vim till normal mode
" (bekvämare än att sträcka sig till Esc hela tiden)
inoremap jk <Esc>


" Try to prevent bad habits like using the arrow keys for movement. This is                                                             │󰣛 darthmaol  ~   v3.14.2   13:02 
" not the only possible bad habit. For example, holding down the h/j/k/l keys                                                           │
" for movement, rather than using more efficient movement commands, is also a                                                           │
" bad habit. The former is enforceable through a .vimrc, while we don't know                                                            │
" how to prevent the latter.                                                                                                            │
" Do this in normal mode...                                                                                                             │
nnoremap <Left>  :echoe "Use h"<CR>                                                                                                     │
nnoremap <Right> :echoe "Use l"<CR>                                                                                                     │
nnoremap <Up>    :echoe "Use k"<CR>                                                                                                     │
nnoremap <Down>  :echoe "Use j"<CR>                                                                                                     │
" ...and in insert mode                                                                                                                 │
inoremap <Left>  <ESC>:echoe "Use h"<CR>                                                                                                │
inoremap <Right> <ESC>:echoe "Use l"<CR>                                                                                                │
inoremap <Up>    <ESC>:echoe "Use k"<CR>                                                                                                │
inoremap <Down>  <ESC>:echoe "Use j"<CR>    
