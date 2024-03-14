filetype off                  " required
set encoding=utf-8
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:pymode_python = 'python3'

call plug#begin('~/.vim/plugged')

Plug 'github/copilot.vim'

Plug 'rust-lang/rust.vim'

Plug 'sillybun/vim-repl'

" snippets
Plug 'honza/vim-snippets'

Plug 'davidhalter/jedi-vim'

Plug 'beautify-web/js-beautify'

Plug 'habamax/vim-asciidoctor'


" language packs
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'

Plug 'yegappan/mru'

Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'dhruvasagar/vim-table-mode'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'lifepillar/vim-mucomplete'
Plug 'majutsushi/tagbar'


Plug 'fatih/vim-go'
Plug 'fatih/molokai'

" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'drewtempelmeyer/palenight.vim'

" Git Flog (browsing) & Fugitive
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
" Git diff
Plug 'airblade/vim-gitgutter'

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug 'preservim/nerdtree'


Plug 'sebdah/vim-delve'

Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/vimshell.vim'

call plug#end()

"""""""""""""""""  Defs
:let g:airline#extensions#tabline#enabled = 1
:let mapleader = ","
:set showcmd
:set number
:let g:vim_markdown_folding_disabled = 1

:let g:go_addtags_transform = "camelcase"
:let g:go_highlight_functions = 1
"Plcall deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
:let g:mucomplete#enable_auto_at_startup = 1
:set completeopt+=menuone,noselect
:set noeb vb t_vb=

:let g:go_rename_command = "gopls"
:colorscheme molokai


" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

command SS :execute 'vimgrep '.expand('<cword>').' '.expand('%') | :copen | :cc
command RS execute 'silent !ag --numbers --nobreak --nocolor --smart-case ' . shellescape(expand('<cword>')) . ' ' . expand('%:p:h') | copen | redraw!

"" polyglot
"let g:polyglot_disabled = ['go']
" Enable ESLint only for JavaScript.
":let g:ale_linters = ['eslint']
:let g:ale_fixers = {'javascript': ['eslint'], 'python': ['autopep8', 'yapf']}

:let g:ale_sign_error = '✘'
:let g:ale_sign_warning = '⚠'
" Set this variable to 1 to fix files when you save them.
:let g:ale_fix_on_save = 1
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

" highlight search results
:set hlsearch

" search for highlighted text with //
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" show hidden chars with :set no/list
:set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" remap for mucomplete
imap <c-j> <plug>(MUcompleteFwd)