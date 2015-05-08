" Fichier de configuration de Vim
" Daneel Oliwan 2015


" correction rapide pour php
":!php -l %


set nocompatible                             " desactive Vi compatibility
set encoding=utf-8                           " encoding in utf8
let mapleader = ","                          " map leader key only use for nerd commenter I think 
"set mouse=a                                 "  mouse use (unused)
set nostartofline                            " stay on the current column when changing the line
set ruler                                    " show the cursor position all the time
set showmode                                 " the current mode is displayed in the left bottom of the screen
set textwidth=2000                           " text width : I preferred to change line manually
set number                                   " show line numbers on the left
set showcmd                                  "affiche les commandes utilisées

" to open a file where I left it last time
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \| exe "normal! g'\"" | endif
endif

set t_Co=256                                  " activate 256 colors
"set guifont=CosmicSansNeueMono\ 12            " select the font
set background=dark                           " use dark theme

set scrolloff=5                               " the page scrolls when the cursor is 5 lines before the limit 
set cursorline                                " a line show where is the cursor 
"hi CursorLine guibg=#2d2d2d ctermbg=236

set backup                                    " activate backup
set backupdir=$HOME/.vim-backup               " define the backup directory



"======================================= Indentation ==============================
if !(expand("%") =~ "Makefile")
    set expandtab                       " use space in Makefile
endif

set autoindent                          " automatic indentation
set smartindent                         " smart code indentation
"set smarttab                           " smart tabs
"set cindent

set shiftwidth=4                        " indentation length
set tabstop=4                           " spaces counts for a tab
set softtabstop=4

"======================================= Research ==============================
set smartcase                           " research not considering case
set incsearch                           " begin searching while typing
set hlsearch                            " highlight search results


"======================================= Dictionnaire  ==============================

"set spelllang =en,fr                    "spell correction : be careful error at the first use, need to download dictionnary
"set spell
"set spellsuggest = 5
"z= - pour proposer un liste de mots 
"]s - pour aller au prochain mot mal orthographié
"[s - pour aller au précédent mot mal orthographié


"======================================= Programmation ===========================
syntax on                               
filetype plugin indent on               " activate the detection of the filetype
call pathogen#infect()                  " call pathogen : a plugin manager
imap ² \ 

set selection=inclusive
set omnifunc=syntaxcomplete#Complete
set foldmethod=syntax "cache les fonctions dépendant de la syntaxe

set backspace=indent,eol,start


" on surligne les lignes trop longues (80 caractères)
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929            
"match OverLength /\%81v.*/ "ce n'est pas activé par défaut, il faut utiliser

"match OverLength / \+$/
"match OverLength /\t/

inoremap {<cr> {<cr>}<esc>O
inoremap (<space> ()<left>
inoremap (<cr> (<cr>)<esc>O
inoremap [<space> []<left>
inoremap /*<space> /*  */<left><left><left>
"set ttyfast

autocmd BufRead,BufNewFile *.jade setlocal ft=jade
autocmd FileType html,xml,php,jade setlocal expandtab shiftwidth=2 tabstop=2
autocmd BufNewFile,BufReadPost *.md set filetype=md
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery


