" Vim configuration file based largely on John Anderson's
" 'Turning Vim into a modern Python IDE'
" http://sontek.net/turning-vim-into-a-modern-python-ide 

" Other helpful vim resources
" 'Vim After 11 Years'
" http://statico.github.io/vim.html
"
set nocompatible
filetype off

" Install Vundle
let run_bundle_install = 0
if !isdirectory(expand("~/.vim/bundle/vundle/"))
        silent !echo "Installing Vundle..."
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
        let run_bundle_install = 1
endif

" Initialize Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Bundles:
"
" On GitHub
Bundle 'tpope/vim-fugitive'
Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-git'
Bundle 'ervandew/supertab'
Bundle 'sontek/minibufexpl.vim'
Bundle 'wincent/Command-T'
Bundle 'mitechie/pyflakes-pathogen'
Bundle 'sjl/gundo.vim'
Bundle 'fs111/pydoc.vim'
Bundle 'alfredodeza/pytest.vim'
Bundle 'reinh/vim-makegreen'
Bundle 'sontek/rope-vim'
Bundle 'mitechie/pyflakes-pathogen'
Bundle 'groenewege/vim-less'
Bundle 'scrooloose/nerdcommenter'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'lukaszb/vim-web-indent'

" GitHub repos of the user 'vim-scripts'
Bundle 'vim-scripts/pep8'
Bundle 'vim-scripts/TaskList.vim'
Bundle 'vim-scripts/The-NERD-tree'
Bundle 'vim-scripts/grep.vim'
Bundle 'vim-scripts/vim-coffee-script'
Bundle 'vim-scripts/closetag.vim'
Bundle 'vim-scripts/taglist.vim'

" Non-GitHub repos
Bundle 'http://git.drupal.org/project/vimrc.git'

if run_bundle_install == 1
        :BundleInstall

        silent !echo ""
        silent !echo "Vim is now ready."
        :cq
endif


" Code Folding
set foldmethod=indent
set foldlevel=99

" Task lists
map <leader>td <Plug>TaskList

" Revision History
map <leader>g :GundoToggle<CR>

" Syntax Highlighting and Validation
syntax on                    " syntax highlighing
filetype on                  " try to detect filetypes
"filetype plugin on
filetype plugin indent on    " enable loading indent file for filetype

" Disable pyflakes quickfix window
let g:pyflakes_use_quickfix = 0

" Key mapping to let you jump to PEP8 violation in quickfix window
let g:pep8_map='<leader>8'

" Tab Completion with SuperTab
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"

" Enable menu and pydoc preview
set completeopt=menuone,longest,preview

" Shortcut key to open NERD Tree
map <leader>n :NERDTreeToggle<CR>

" Shortkut key to go to class definition using Ropevim
map <leader>j :RopeGotoDefinition<CR>

" Shortcut key to rename things using Ropevim
map <leader>r :RopeRename<CR> 

" Shortcut key for Ack searching
nmap <leader>a <Esc>:Ack!

" Statuslines
" http://got-ravings.blogspot.com/2008/08/vim-pr0n-making-statuslines-that-own.html is useful documentation on statuslines 
" Make status line show for all windows, not just split ones
set laststatus=2

set statusline=%-.100f     " tail of the filename
set statusline+=%10l " cusor line
set statusline+=,%c   " cursor column
set statusline+=%40{fugitive#statusline()}    " Show which Git branch we're currently working on

" Enable code completion for libraries in your virtualenv
" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" NOTE: To get code completion for Django modules as well
" you need to: 
" export DJANGO_SETTINGS_MODULE=project.settings

" Create a mapping for makegreen so it doesn't complain
" about one already existing for \t
map <unique> <silent> <Leader>mg :call MakeGreen()<cr>

" Convert tabs to spaces
set expandtab

" Show grep results in their own hotlinked buffer
" From http://vim.wikia.com/wiki/Find_in_files_within_Vim
command! -nargs=+ MyGrep execute 'silent grep! <args>' | copen 33

" Always use the mouse, even in a terminal
set mouse=a

" Map Ctrl-P initialization to use <C-\> because Smarttab uses <C-P>
" See http://stackoverflow.com/questions/11326120/how-to-map-c-leader-in-vim
nnoremap <c-\> :CtrlP<CR>

nmap ; :CtrlPBuffer<CR>
