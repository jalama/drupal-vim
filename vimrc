set nocompatible               " be iMproved
filetype off                   " required!
syntax enable

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'VundleVim/Vundle.vim'

" My Plugins here:
"
" original repos on github
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'corntrace/bufexplorer'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'spf13/PIV'

" Solarized
Plugin 'altercation/vim-colors-solarized'

call vundle#end()

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

let g:syntastic_php_phpcs_args="--standard=Drupal --extensions=php,module,inc,install,test,profile,theme"
if has('statusline')
  set laststatus=2
  " Broken down into easily includeable segments
  set statusline=%<%f\ " Filename
  set statusline+=%w%h%m%r " Options
  set statusline+=%{fugitive#statusline()} " Git Hotness
  set statusline+=\ [%{&ff}/%Y] " filetype
  set  statusline+=\ [%{getcwd()}] " current dir
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  let g:syntastic_enable_signs=1
  set statusline+=%=%-14.(%l,%c%V%)\ %p%% "Right aligned file nav info
endif

" Usee local vimrc if available {
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
" }
