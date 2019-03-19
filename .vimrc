syntax on

set number
set nowrap
set showmode
set tw=80
set smartcase
set smarttab
set smartindent
set autoindent
set softtabstop=2
set shiftwidth=2
set expandtab
set incsearch
set mouse=a
set history=1000
set hlsearch
hi Visual cterm=reverse ctermbg=NONE

set completeopt=menuone,menu,longest

set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,,.cabal-sandbox
set wildmode=longest,list,full
set wildmenu
set completeopt+=longest

set t_Co=256

set cmdheight=1

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

set wildmenu

set cursorline
set laststatus=2
let g:onedark_termcolors=256

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'zivyangll/git-blame.vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'godlygeek/tabular'
Plugin 'ervandew/supertab'
Plugin 'Shougo/deoplete.nvim' 
Plugin 'Shougo/vimproc.vim'
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-static'
Plugin 'clojure-vim/async-clj-omni'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'mhartington/nvim-typescript', {'do': './install.sh'}

" color schemes
Plugin 'joshdick/onedark.vim'
Plugin 'metakirby5/codi.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'Taverius/vim-colorscheme-manager'
Plugin 'ianks/vim-tsx'
Plugin 'luochen1990/rainbow'
Plugin 'sheerun/vim-polyglot'

" asynchronous linting
Plugin 'w0rp/ale'

" Typescript plugins
Plugin 'Quramy/tsuquyomi'
Plugin 'tpope/vim-fugitive'
Plugin 'guns/vim-clojure-highlight'

call vundle#end()            

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'
let g:deoplete#keyword_patterns.clojurescript = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'



" required for vundle
filetype plugin indent on

" LEADER MAPPING
" mapleader = "<Tab>"
"
" NERDTREE -- file and folder navigator
noremap <C-b> :NERDTreeToggle<CR>

nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

vnoremap // y/<C-R>"<CR>


let g:onedark_termcolors=256
let g:onedark_terminal_italics=1


set background=dark
colorscheme onedark

" Go to Definition
nmap <F12> :ALEGoToDefinition<CR>
nmap <C-F12> :ALEGoToDefinitionInTab<CR>

" TABULAR -- code formatting based on a regular expression.
let g:haskell_tabular = 1

vnoremap a= :Tabularize /=<CR>
vnoremap a; :Tabularize /::<CR>
vnoremap a- :Tabularize /-><CR>

" FUZZY FILE SEARCH
noremap <silent> <Leader>t :CtrlP()<CR>
noremap <leader>b<space> :CtrlPBuffer<cr>
let g:ctrlp_custom_ignore = '\v[\/]dist$'

" Copy and Paste in the system clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" diagnostics
let g:nvim_typescript#diagnostics_enable=0

" TYPESCRIPT CONFIGURATION
" Vim assumes *.ts files are xml files. This sets them to typescripts files
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
autocmd BufNewFile,BufRead *.tsx let b:tsx_ext_found = 1
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx

autocmd BufWrite *.ts,*.tsx TSGetDiagnostics

let g:typescript_compiler_options = ''
let g:typescript_compiler_binary = 'tsc'

" ALE
" Enable completion where available.
let g:ale_completion_enabled = 1

"CTRL-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_prompt_mappings = {
      \ 'AcceptSelection("e")': [],
      \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
      \ }


" Move up and down respectively
nmap <silent> <C-j> :move -2<CR>
nmap <silent> <C-k> :move +1<CR>

" remap yank to system clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" HASKELL SUPERTAB
let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif

let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" <Ctrl-h> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-h> :nohl<CR><C-h>

" activate rainbow parenthesis
let g:rainbow_active = 1 

let g:ale_linters = {
      \ 'haskell': ['hlint', 'hdevtools', 'hfmt'],
      \}

" Codi Aliases

" Evaluate Clojure buffers on load
 autocmd BufRead *.clj try | silent! Require | catch /^Fireplace/ | endtry

let g:codi#aliases = {
      \ 'clojurescript.cljs': 'clojure',
      \}

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX
"check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more
"information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 <
    "https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "        "For Neovim > 0.1.5 and Vim > patch 7.4.1799 <
  "        https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
  "        >
  "          "Based on Vim patch 7.4.1770 (`guicolors` option) <
  "          https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
  "          >
  "            " <
  "            https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
  "            >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" air line settings
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

let g:graphql_javascript_tags = []
