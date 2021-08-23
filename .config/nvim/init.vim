"
"
"
"
"
"



if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

"Plugins with vim-plug
call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
 Plug 'lervag/vimtex'
 Plug 'sheerun/vim-polyglot'
 Plug 'jiangmiao/auto-pairs'
 Plug 'jaredgorski/spacecamp'
 Plug 'dracula/vim' 
 Plug 'mhinz/vim-startify'  
 Plug 'preservim/nerdtree'
call plug#end()

set clipboard+=unnamedplus "Set system clipboard, needs xclip installed
set number relativenumber "Line numbers relative to location for easier navigation
syntax on "Syntax highlighting on
colorscheme dracula "Set colorscheme

let g:vimtex_view_general_viewer = 'setsid -f zathura'
let g:startify_bookmarks = [ {'n': '~/.config/nvim/init.vim'} ] "Vim-startify bookmarks
let g:startify_lists = [ { 'type': 'files',       'header': ['Recently edited'] }, { 'type': 'bookmarks',   'header': ['Bookmarks'] }, ] "Vim-startify lists

nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
