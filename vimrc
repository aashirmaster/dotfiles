syntax on
filetype on
filetype indent on
filetype plugin on

set backspace=indent,eol,start

set wrap

set number
nmap j gj
nmap k gk

set ignorecase
set smartcase
set incsearch
set hlsearch

set tabstop=4
set expandtab
set shiftwidth=4 
set smarttab

set pastetoggle=<F2>

colorscheme monokai 

if has("autocmd")
    autocmd bufwritepost .vimrc source %
endif

set display+=lastline

" clears and redraws screen after search
nnoremap <silent> <C-l> :nohl<CR><C-l>

" maps jk to esc
inoremap jk <Esc>

function! My_Tab_Completion()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-P>"
    else
        return "\<Tab>"
endfunction
inoremap <Tab> <C-R>=My_Tab_Completion()<CR>


function! TEXSET()
    set makeprg=if\ \[\ -f\ \"Makefile\"\ \];then\ make\ $*;else\ if\ \[\ -f\ \"makefile\"\ \];then\ make\ $*;else\ pdflatex\ -file-line-error-style\ %\ &&\ evince\ %:r.pdf;fi;fi
    set errorformat=%f:%l:\ %m
endfunction

function! PYSET()
    set makeprg=if\ \[\ -f\ \"Makefile\"\ \];then\ make\ $*;else\ if\ \[\ -f\ \"makefile\"\ \];then\ make\ $*;else\ python\ %;fi;fi
    set smartindent
    set tw=0
endfunction

function! CSET()
    set makeprg=if\ \[\ -f\ \"Makefile\"\ \];then\ make\ $*;else\ if\ \[\ -f\ \"makefile\"\ \];then\ make\ $*;else\ gcc\ -O2\ -Wall\ -o%.bin\ %\ &&\ ./%.bin;fi;fi
    set errorformat=%f:%l:\ %m
    set cindent
    set tw=0
endfunction

autocmd FileType c call CSET()
autocmd FileType tex call TEXSET()
autocmd FileType python call PYSET()
autocmd FileTYpe html setlocal shiftwidth=2 tabstop=2
autocmd FileType json setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
