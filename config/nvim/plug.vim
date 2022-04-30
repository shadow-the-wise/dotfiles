"==============================================================================
" Plugins
"==============================================================================

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged/')

" nerdtree
" Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'

"------------------------------------------------------------------------------
" Git
"------------------------------------------------------------------------------
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"------------------------------------------------------------------------------
" Indenting
"------------------------------------------------------------------------------
Plug 'Yggdroot/indentLine'

"------------------------------------------------------------------------------
" Snippets
"------------------------------------------------------------------------------
Plug 'honza/vim-snippets'

if has("nvim")

"------------------------------------------------------------------------------
"   Status Line
"------------------------------------------------------------------------------
    Plug 'hoob3rt/lualine.nvim'
"------------------------------------------------------------------------------
"   Color and icons
"------------------------------------------------------------------------------
    " Solarized
    Plug 'overcache/NeoSolarized'
"------------------------------------------------------------------------------
"   Navigation
"------------------------------------------------------------------------------
    Plug 'rhysd/clever-f.vim'
    Plug 'phaazon/hop.nvim'

"------------------------------------------------------------------------------
"  Complation
"------------------------------------------------------------------------------
    " Use release branch (recommend)
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif


call plug#end()

"coc.nvim will install extensions that are not installed in this list.
