set nocompatible               " be iMproved
filetype off                   " required!
syntax enable

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'kien/ctrlp.vim'
Bundle 'ervandew/supertab'
Bundle 'benjifisher/Vim-Plugin-for-Drupal'
Bundle 'corntrace/bufexplorer'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'spf13/PIV'

" Solarized
Bundle 'altercation/vim-colors-solarized'
set background=light
let g:solarized_termcolors=256
colorscheme solarized

filetype plugin indent on     " required!

function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
nmap <leader>w :call <SID>StripTrailingWhitespaces()<CR>
autocmd BufWritePre *.module,*.info,*.inc,*.install,*.py,*.php,*.js :call <SID>StripTrailingWhitespaces()

nmap <F7> :call ToggleAllFolds()<CR>
nmap <F8> :NERDTreeToggle<CR>
nmap <F9> :TagbarToggle<CR>

" toggle line numbering
nmap <F10> :set invnumber<CR>

" change ctrlp map to ctrl-f
let g:ctrlp_map = '<c-f>'
