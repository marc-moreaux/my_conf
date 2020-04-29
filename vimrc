"""""""""""""""""""""""""""""""""
" Plugin management

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
" Python syntax folding
Plugin 'tmhedberg/SimpylFold'
" Build util for asyncronus build
Plugin 'skywind3000/asyncrun.vim'
" python and other test env
Plugin 'janko/vim-test'

" Visual
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'junegunn/goyo.vim'
" Status bar (powerline)
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Awesome start screen for Vim
Plugin 'mhinz/vim-startify'
" Search bar
Plugin 'kien/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'sjl/gundo.vim'

" csv
Plugin 'chrisbra/csv.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" Plungin preferences
let g:gundo_prefer_python3 = 1
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_import = 0
let $PYTHONUNBUFFERED=1

" Toggle NerdTree and Tagbar
nnoremap <F2> :NERDTreeToggle<CR>
inoremap <F2> <ESC>:NERDTreeToggle<CR>i
nnoremap <F3> :TagbarToggle<CR>
inoremap <F3> <ESC>:TagbarToggle<CR>i

"""""""""""""""""""""""""""""""""
" VISUAL EFFECTS OR RENDER

" Change syntax highlighting
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
syntax enable
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
colorscheme colorsbox-stblue
let g:airline_theme='angr'
" To get the white background
" colorscheme solarized
" set background=light

" show 80's column boundary
highlight ColorColumn ctermbg=magenta

" line spacing
set number
set relativenumber
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
let g:tex_flavor = "latex"

if has("autocmd")
    " Enable file type detection
    filetype on

    " Syntax of these languages is fussy over tabs Vs spaces
    autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType yaml setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType html setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType css setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

    " Python
    autocmd FileType python call matchadd('ColorColumn', '\%81v', 100) " 80th char coloration in python
    autocmd FileType python nnoremap <F8> :w<CR>:AsyncRun -raw python3.7 "%"<CR>

    " LaTeX
    autocmd FileType tex vnoremap <leader>bf I\textbf{<esc>gvllllllllA}<esc>
    autocmd FileType tex vnoremap <leader>it I\textit{<esc>gvllllllllA}<esc>
    autocmd FileType tex vnoremap <leader>ud I\underline{<esc>gvlllllllllllA}<esc>

    autocmd FileType tex inoremap <leader>bf \textbf{
    autocmd FileType tex inoremap <leader>it \textit{
    autocmd FileType tex inoremap <leader>ud \underline{

    autocmd FileType tex nnoremap <super. :w<CR>:AsyncRun pdflatex main.tex<CR>
    autocmd FileType tex nnoremap <F8> :w<CR>:AsyncRun pdflatex main.tex<CR>
    autocmd FileType tex nnoremap <F9> :call system("evince main.pdf&")<CR>
    autocmd FileType tex :set spell spelllang=en
    autocmd FileType tex :highlight Spellbad cterm=underline
    
endif

" show invisible character on :set list
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·


""""""""""""""""""""""""""""""""
" BUFFER AND WINDOWS

" buffer management
nnoremap ]b :bnext<CR>
nnoremap [b :bprevious<CR>

" window management
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-l> <C-w>l
map <C-k> <C-w>k
set splitbelow
set splitright


"""""""""""""""""""""""""""""""""
" UNDO DIRECTORY

" Let's save undo info!
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
call system('find $HOME/.vim/undo-dir -type f -mtime +90 -delete')
set undodir=~/.vim/undo-dir
set undofile


"""""""""""""""""""""""""""""""""
" NORMAL MODE

" Yank line from current position
nnoremap Y y$

" Remap arrows to window reshape
nnoremap <up> <C-W>+
nnoremap <down> <C-W>-
nnoremap <right> <C-W>>
nnoremap <left> <C-W><


"""""""""""""""""""""""""""""""""
" VISUAL MODE

" keep visual when shifting
vnoremap < <gv
vnoremap > >gv


"""""""""""""""""""""""""""""""""
" INSERT MODE

" ESC shortcut
inoremap jj <esc>

" Clipbpard is shared with yank
set clipboard=unnamedplus


"""""""""""""""""""""""""""""""""
" PYTHON
nnoremap <leader>pe iimport IPython; IPython.embed()<esc>
inoremap <leader>pe import IPython; IPython.embed()
nnoremap <leader>pd iimport IPython; IPython.embed()<esc>
inoremap <leader>pd import IPython; IPython.embed()
nnoremap <leader>pm iimport matplotlib.pyplot as plt<esc>
inoremap <leader>pm import matplotlib.pyplot as plt
nnoremap <leader>pp iprint(
inoremap <leader>pp print(

" Virtual env management
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

" More usefull silent cmd
command! -nargs=+ Silent
\   execute 'silent <args>'
\ | redraw!

" TTS of buffer
nnoremap <Silent> <leader>tts :execute "!(pico2wave -w /tmp/audio.wav \"".getreg('"')."\" && cvlc --play-and-exit /tmp/audio.wav &) &> /dev/null"<CR>
