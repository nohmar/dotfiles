set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set encoding=utf-8

call vundle#rc()

Plugin 'gmarik/Vundle.vim'

" Tim Pope
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-projectionist'

" FZF
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" Visuals
Plugin 'nanotech/jellybeans.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Javascript
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'leafgarland/typescript-vim'

" Rust
Plugin 'rust-lang/rust.vim'

" Elixir
Plugin 'elixir-editors/vim-elixir'
Plugin 'mhinz/vim-mix-format'

" GQL
Plugin 'jparise/vim-graphql'

" LSP
Plugin 'dense-analysis/ale'

" CamelCase motion support
Plugin 'bkad/CamelCaseMotion'

filetype plugin indent on
syntax on
colo jellybeans

set tabstop=2
set shiftwidth=2
set expandtab
set wildmode=longest,list,full
set nu
set hlsearch
set ls=2
set splitright
set splitbelow
set fillchars+=vert:│
set listchars=tab:▸\ ,trail:·,nbsp:¬,eol:¶,extends:»,precedes:«
set backupcopy=yes

" Lead me
let mapleader = "\<space>"

" Airline
let g:airline_theme = 'bubblegum'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''

" Disable clunky commands
map q \<noop>
map q: \<noop>
nnoremap Q \<noop>
nnoremap K \<noop>
nnoremap <C-z> \<noop>

" Search
nnoremap <silent><leader>e :FZF<cr>

" Move lines in normal, insert, visual modes
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Shortcuts
map <Leader>B :Git blame<CR>
nmap <Leader>c :vs $MYVIMRC<CR>
nmap <Leader>o :so $MYVIMRC<CR>
nmap <Leader>q :qa<CR>
nnoremap <leader>mk :!mkdir -p %:p:h<cr>
noremap <C-s> :update<CR>
map <Leader>f :let @+=expand('%:p')<CR>
map <Leader>T :Dispatch<CR>
map <Leader>d :ALEDetail<CR>
nnoremap <C-z> :pclose<CR>
nnoremap <C-]> :ALEGoToDefinition<CR>
nnoremap <Leader>k :ALEHover<CR>

" Highlight line length zone
hi ColorColumn ctermbg=235 guibg=#2c2d27
set colorcolumn=80

" Copy and paste via tmux
set clipboard=unnamed,unnamedplus

" Open fzf in split window
let g:fzf_layout = { 'down': '40%' }

" Format files on save
let g:mix_format_on_save = 1
let g:rustfmt_autosave = 1

" Rust
let g:ale_rust_cargo_use_clippy = 1

" JS
let g:ale_linters = {
\   'javascript': ['standard'],
\   'typescriptreact': ['tsserver'],
\   'css': ['stylelint'],
\}

let g:ale_fixers = {
\  'javascript': ['prettier'],
\  'javascriptreact': ['prettier'],
\  'typescriptreact': ['prettier'],
\  'css': ['prettier'],
\}

let g:ale_linters_ignore = {
\   'javascript': ['eslint'],
\   'typescriptreact': ['eslint'],
\   'ruby': ['rubocop'],
\}

" Ale globals
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
