set tabstop=4
set softtabstop=4
set nu
syntax on
set expandtab
set showtabline=2
inoremap <Tab> <Space><Space><Space><Space>
set softtabstop=4 expandtab
hi Comment ctermfg=3
hi String ctermfg=Green
hi Search cterm=None ctermfg=None ctermbg=red

set cursorline
hi CursorLine   cterm=NONE ctermbg=darkblue ctermfg=white guibg=darkred guifg=white

" remap pane navigation shortcuts
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
          silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
            autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
  Plug 'preservim/nerdtree'
  call plug#end()

  map <Space> <Leader>
  nnoremap <leader>n :NERDTreeFocus<CR>
  nnoremap <C-n> :NERDTree<CR>
  nnoremap <C-t> :NERDTreeToggle<CR>
  nnoremap <C-f> :NERDTreeFind<CR>

