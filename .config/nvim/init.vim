if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

set nocompatible

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))

Plug 'lervag/vimtex'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'

call plug#end()

set clipboard+=unnamedplus
set number relativenumber
syntax on
colorscheme dogrun

map <leader>c :w! \| !compiler "<c-r>%"<CR>

let g:vimtex_view_general_viewer = 'setsid -f zathura'

" Manage splits and tabs easily
map <Tab> <C-w>s
map <C-j> <C-w><Down>
map <C-k> <C-w><Up>
map <C-n> :tabnew<CR>:Explore<CR>
map <C-h> :tabp<CR>
map <C-l> :tabn<CR>
map <C-o> <C-w>o
