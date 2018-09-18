" Vundle pluggin management
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle Pluggin 
Plugin 'VundleVim/Vundle.vim'


" programing
Plugin 'tpope/vim-fugitive'
" Smart auto-indentation for Python
Plugin 'vim-scripts/indentpython.vim'
" Auto-completing engine
Plugin 'Valloric/YouCompleteMe'
" Syntax checker
Plugin 'vim-syntastic/syntastic'
" Python backend for 'syntastic'
Plugin 'nvie/vim-flake8'
" Powerful commenting utility
Plugin 'scrooloose/nerdcommenter'
" Rich python syntax highlighting
Plugin 'kh3phr3n/python-syntax'


" Visual
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
" Status bar (powerline)
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Awesome start screen for Vim
Plugin 'mhinz/vim-startify'
" Search bar
Plugin 'kien/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'

call vundle#end()            " required
filetype plugin indent on    " required


" Use Solarized
set  rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
syntax enable
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
let g:airline_theme='angr'


"""""""""""""""""""""""""""""""""
" VISUAL

" line spacing
set number
set relativenumber
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

if has("autocmd")
    " Enable file type detection
    filetype on

    " Syntax of these languages is fussy over tabs Vs spaces
    autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType yaml setlocal ts=4 sts=4 sw=4 expandtab

    " Customisations based on house-style (arbitrary)
    autocmd FileType html setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType css setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

endif

" show invisible character on :set list
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·

" keep visual when shifting
vnoremap < <gv
vnoremap > >gv

" show 80's column boundary
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

"""""""""""""""""""""""""""""""""
" BUFFER AND WINDOWS

" buffer management
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

" window management
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-l> <C-w>l
map <C-k> <C-w>k
set splitbelow
set splitright


"""""""""""""""""""""""""""""""""
" PYTHON

" python3 << EOL
" import vim
" # Do not say 'from vim import *' because that
" # will delete builtin function eval.
" 
" def EvaluateCurrentLine(*args):
"     cur_str = vim.current.line
"     action, symb = None, None
"     for i in args:
"         if i in ["r","p"]: action = i
"         else: symb = i
"     try: start = cur_str.rindex(symb)+len(symb)
"     except: start = 0
"     result = eval(cur_str[start:],globals())
"     if action == "r":
"         vim.current.line = cur_str[:start]+str(result)
"     else:
"         print(result)
" EOL
" map <leader>pp :python3 EvaluateCurrentLine()<CR>


" Point YCM to the Pipenv created virtualenv, if possible
" At first, get the output of 'pipenv --venv' command.
let pipenv_venv_path = system('pipenv --venv')
" The above system() call produces a non zero exit code whenever
" a proper virtual environment has not been found.
" So, second, we only point YCM to the virtual environment when
" the call to 'pipenv --venv' was successful.
" Remember, that 'pipenv --venv' only points to the root directory
" of the virtual environment, so we have to append a full path to
" the python executable.
if shell_error == 0
  let venv_path = substitute(pipenv_venv_path, '\n', '', '')
  let g:ycm_python_binary_path = venv_path . '/bin/python'
else
  let g:ycm_python_binary_path = 'python'
endif


"""""""""""""""""""""""""""""""""
" INSERT MODE

" ESC shortcut
inoremap kj <esc>



