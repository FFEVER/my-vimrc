call plug#begin()
Plug 'pangloss/vim-javascript'
Plug 'vim-ruby/vim-ruby'
Plug 'mxw/vim-jsx'
Plug 'isruslan/vim-es6'
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'jelera/vim-javascript-syntax'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'mkitt/browser-refresh.vim'
Plug 'Yggdroot/indentLine'
Plug 'ap/vim-css-color'
Plug 'matze/vim-move'
Plug 'nightsense/simplifysimplify'
Plug 'tpope/vim-fugitive'
Plug 'Badacadabra/vim-archery'
Plug 'fneu/breezy'
Plug 'junegunn/vim-emoji'
Plug 'tonsky/FiraCode'
Plug 'janko-m/vim-test'
Plug 'junegunn/vim-easy-align'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'aradunovic/perun.vim'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
call plug#end()
" ------------- key map setting -------------------
nnoremap <leader>sr :source ~/.vimrc<CR>
nnoremap <leader>w :w<CR>
map      <leader>q :q<CR>
map      <leader>a :Ag<CR>
noremap  <leader>find :FZF<CR>
noremap  <S-w> <C-w>
vmap <leader>c :.w !pbcopy<CR><CR> " copy to sys clipboard
nnoremap <CR> i<CR><Esc>
nnoremap <Space> i<Space><Esc>
nnoremap Q <Nop>
nnoremap L <s-$>
vnoremap L <s-$>
nnoremap H <s-^>
vnoremap H <s-^>
noremap  <leader>/ :Commentary<CR>
inoremap jj <Esc>
" buffer handling
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
nnoremap <leader>b :ls<CR>:b

" ale
nnoremap <leader>fix :ALEFix<CR>

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" ---------- setup vim startup defautl ---------------
autocmd StdinReadPre * let s:std_in=1 " auto startup nerdtree on open
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif " auto startup nerdtree on open
autocmd BufWritePre *.rb :%s/\s\+$//e
set encoding=utf-8 " file encode
set laststatus=2
set tabstop=2 " change tab width
set shiftwidth=2 " affects what happens when you press >>, << or =
set softtabstop=2 " tell backspace gose back step or tab width
set expandtab " convert tab to space
set backspace=indent,eol,start " fix backspace notworking
set ruler " display status line/colmun number at buttom
set number " display line number
set hls
set mouse=a
set wildmenu
" set tags=tags
" set guifont=Fira\ Code:h12
set noswapfile
set background=dark
set termguicolors
let g:airline_theme='quantum'
colorscheme quantum
syntax on

" plugin setting
" ---------------- NERDTree ---------------------
let NERDTreeMinimalUI        = 1
let NERDTreeDirArrows        = 1
let NERDTreeAutoDeleteBuffer = 1
nnoremap <leader>d :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
" :let g:NERDTreeWinSize=50

" -------- ag function setting for fzf -------------
let g:ackprg = 'ag --vimgrep'
" install --> https://github.com/ggreer/the_silver_searcher
" --------------------------------------------------

" -------------- airline setting -------------------
let g:airline_theme                           = 'quantum'
let g:airline#extensions#tabline#enabled      = 1
let g:airline#extensions#tabline#left_sep     = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts                 = 1
if !exists('g:airline_symbols')
  let g:airline_symbols                       = {}
endif
let g:airline_symbols.space                   = "\ua0"
" --------------------------------------------------
" ----------- ale syntax setting -------------------
let g:ale_fixers = {
      \  'javascript': ['prettier', 'eslint'],
      \  'python': ['autopep8', 'pylint'],
      \  'scss': ['prettier'],
      \  'sass': ['prettier'],
      \  'ruby': ['rubocop'],
      \}
let g:ale_fix_on_save        = 0
let g:ale_set_highlights     = 1
let g:ale_completion_enabled = 1
" -------------------------------------------------
" ----------- indent plugin setting ---------------
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel  = 2
let g:indentLine_enabled       = 1
let g:indentLine_char          = '┆'
" -------------------------------------------------
" ---------------- git gutter ---------------------
let g:gitgutter_highlight_lines = 0
" -------------------------------------------------
" ---------------- you complete me ---------------------
let g:UltiSnipsExpandTrigger = "<tab>"
" ----------------- vim move ----------------------
let g:move_key_modifier = 'C'
