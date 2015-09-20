filetype off
filetype plugin indent off
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=$GOROOT/misc/vim
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'
Bundle 'mileszs/ack.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'mattboehm/vim-accordion'
Bundle 'mattboehm/vim-unstack'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'jstemmer/gotags'
Bundle 'majutsushi/tagbar'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'fatih/vim-go'
Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-airline'
Bundle 'wakatime/vim-wakatime'
filetype plugin indent on
syntax on

set t_Co=256
set hlsearch
set updatetime=100
set ttimeoutlen=10
set title
" set expandtab " ruby
"set tabstop=2 shiftwidth=2 " ruby
set tabstop=4 shiftwidth=4 " rest
set backspace=2
set colorcolumn=80
"set clipboard=unnamedplus
set number
set wildignore+=*.o,*.obj,.git,*.dll,*.so,*.a,*/tmp/*,*/temp/*,*/out/*,*.swp,*.tar.*,*.zip
set listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×,eol:¶
set mouse=a
"set statusline+=%o
"set guifont=Source\ Code\ Pro\ for\ Powerline
"set guifont=Liberation_Mono_for_Powerline:h10
set laststatus=2

"colorscheme herald

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  " unicode symbols
  let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'
  let g:airline_symbols.linenr = '␊'
  let g:airline_symbols.linenr = '␤'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.whitespace = 'Ξ'

let g:airline_powerline_fonts = 1
let g:gofmt_command = 'goimports'
let g:EasyMotion_leader_key = '\'
let g:go_fmt_command = "goimports"
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:unstack_mapkey='<F6>'
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

hi colorcolumn ctermbg=233
hi RedundantWhitespace ctermbg=red guibg=red
match RedundantWhitespace /\s\+$\| \+\ze\t/

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

nnoremap <C-o> :Ack!<space>
noremap <F2> :set list!<CR>
noremap <F3> :CommandTFlush<CR>
nmap <F7> <plug>NERDTreeTabsToggle<CR>
nmap <F8> :TagbarToggle<CR>



nmap <C-n> :tabnext<CR>
map <C-n> :tabnext<CR>
imap <C-n> <Esc>:tabnext<CR>i

nmap <C-p> :CommandT<CR>
map <C-p> :CommandT<CR>
imap <C-p> <Esc>:CommandT<CR>i

nmap <C-g> :GitGutterToggle<CR>
map <C-g> :GitGutterToggle<CR>
imap <C-g> <Esc>:GitGutterToggle<CR>i

" autocmd BufWritePre *.go Fmt
" autocmd FileType go autocmd BufWritePre <buffer> Fmt

"function! EnhanceCppSyntax()
" syn match cCustomParen    /?=(/ contains=cParen,cCppParen
" syn match cCustomFunc     /\w\+\s*(\@=/ contains=cCustomParen
" syn match cCustomScope    /::/
" syn match cCustomClass    /\w\+\s*::/ contains=cCustomScope
" syn match cCustomOperator /\(::\|->\|\.\|\.\*\|->\*\|(\|)\)/
" hi def link cCustomFunc     Function
" hi def link cCustomClass    Structure
" hi def link cCustomOperator Operator
"endfunction
"au Syntax cpp call EnhanceCppSyntax()

function! EnhanceGoSyntax()
" syn match goParen           /(/
" syn match goCustomParen     /?=(/ contains=goParen
" syn match goCustomFunc      /\.\w\+\s*(\@=/ contains=goCustomParen
  syn match goCustomExtraType /\<io\.ReadCloser\>/
" syn match goCustomStatement /\(\.\|:=\|=\|<-\)/
  syn match goCustomStatement /\(:=\)/
" hi def link goCustomFunc      Function
  hi def link goCustomStatement Statement
  hi def link goCustomExtraType Type
endfunction
au Syntax go call EnhanceGoSyntax()

