"==============================================================================
" Version: 2.0
" Author: shadow
" Last Update: 28/4/2022
" Neo Vim:
"==============================================================================
"
"    .o oOOOOOOOo                                       .....0OOOo
"    Ob.OOOOOOOo  OOOo.      oOOo.              ....oooooOOOOOOOOO
"    OOoO000000000000.OOo. .oOOOOOo.    OOOo.oOOOOO0000000000000OO
"    OOO.oOOOOOOOOOOO 0POOOOOOOOOOOo.   `0OOOOOOOOOP,OOOOOOOOOOOB'
"    `O'OOOO'     `OOOOo"OOOOOOOOOOO` .adOOOOOOOOO"oOOO'    `OOOOo
"    .OOOO'            `OOOOOOOOOOOOOOOOOOOOOOOOOO'            `OO
"    OOOOO                 '"OOOOOOOOOOOOOOOO"`                oOO
"   oOOOOOOo.                .adOOOOOOOOOOba               .adOOOOo.
"  oOOOOOOOOOOOOOba.    .adOOOOOOOOOO@^OOOOOOOba.     .adOOOOOOOOOOOO
"  OOOOOOOOOOOOOOOOO.OOOOOOOOOOOOOO"`  '"OOOOOOOOOOOOO.OOOOOOOOOOOOOO
"    :           'OOOOOOOOOOOOOO: .oOOo. :OOOOOOOOOOO?'         :`
"    .            .oO%OOOOOOOOOOo.OOOOOO.oOOOOOOOOOOOO?         .
"                 OOOO"%OOOOOOOOoOOOOOOO?oOOOOO?OOOO"OOO
"                 '%o  OOOO"%OOOO%"%OOOOO"OOOOOO"OOO':
"                      `$"  `OOOO' `O"! ' `OOOO'  o             .
"    .                  .      O"          : o     .


"==============================================================================
" plugins {{{1

" Load Plugins via plug
runtime ./plug.vim

" }}
" setup {{{1
" make sure user defined tabs and indent are respected
filetype indent off
filetype plugin on
syntax enable

" Colorscheme {{{2

syntax enable
set background=dark
colorscheme NeoSolarized

if has('gui_running')
    set background=dark
endif

" }}}
" Leader {{{2
"------------------------------------------------------------------------------
" leader
let g:mapleader = "\<Space>"

" }}}
" splash screen {{{2
" splash screen at the start
set shortmess+=I
" }}}
" backspace {{{2
" make delete work sanely
set backspace=indent,eol,start
" }}}
" number {{{2
set number
set relativenumber
" }}}
" cursor line {{{2
set cursorline
" }}}
" text and column width {{{2

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim 0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

set updatetime=100

" Text width 79 if colorcolumn is set to 1 and there is no colorcolumn join.
" Text width 80 if there is no colorcolumn set to 1
set textwidth=79

" Set the column at the 80 +1 after textwidth
set colorcolumn=+1

"}}}
" command line {{{2

" Height of the command bar.
set cmdheight=1
" Number of screen lines to use for the command-line window. Default is 7
set cmdwinheight=7
" Show (partial) command in the last line of the screen.
set showcmd
" If in Insert, Replace or Visual mode do not put a message on the last line.
set noshowmode
" Show output from last command (default 5)
set modelines=5

" Show the line and column number of the cursor position.
set ruler

"}}}
" }}} end setup
" navigation {{{1
" change CWD {{{2
"
" When on, Vim will change the current working directory whenever you open a
" file, switch buffers, delete a buffer or open/close a window. It will change
" to the directory containing the file which was opened or selected.
set autochdir
" }}}
" buffer {{{2

" Allows you to hide buffers with unsaved changes without being prompted.
set hidden

" When a file has been detected to have been changed outside of Vim and
" it has not been changed inside of Vim, automatically read it again.
set autoread

" Execute {command}, and use a dialog when an operation has to be confirmed.
" set confirm

" }}}
" scroll {{{2

" Set to 999 the cursor will stay in the middle.
" Set <number> for <number> lines from the top of bottom
set scrolloff=999
set sidescroll=1
set sidescrolloff=100

"}}}
" search {{{2

" If the 'ignorecase' option is on, the case of normal letters is ignored.
" 'smartcase' can be set to ignore case when the pattern contains lowercase
" letters only
set ignorecase
" Override the 'ignorecase' option if the search pattern contains upper case
" characters.
set smartcase

" While typing a search command, show where the pattern is matched.
set incsearch

" last search pattern highlighting
set hlsearch

" When on, the :substitute flag 'g' is default on.
set gdefault

" For regular expression
set magic
"}}}
" }}} end navigation
" formatting {{{1
" format {{{2

" Remove comment leader when joining comments.
set formatoptions+=j

" Smart auto indenting inside numbed lists
set formatoptions+=n

" J join two lines at .
set nojoinspaces

" }}}
" Indent {{{2

" When changing the indent of the current line, preserve as much of the
" indent structure as possible.
set preserveindent

" Vim will wrap long lines at a character in 'breakat' rather than at the last
" character that fits on the screen.
set linebreak

" Every wrapped line will continue visually indented (same amount of space as
" the beginning of that line), thus preserving horizontal blocks of text.
set breakindent

" Copy indent from current line when starting a new line.
set autoindent

" Tab {{{2

" **FTPLUGIN** - can set the tablevel for programing launguages itself. Paste
" will preserve the user defined levels set and the choice of tabs or spaces.

" Converts tab to space. If your using listchars its better to explicitly set
" to noexpand. So the tabs show up.
set expandtab

" Number of spaces that a <Tab> in the file counts for
set tabstop=4

" Number of spaces to use for each step of (auto)indent.
set shiftwidth=4
" Number of spaces to reduce each step of (auto)indent.
set softtabstop=4

" Always indent by multiples of shiftwidth
set shiftround

" at the beginning of the line, insert spaces according to shiftwidth
set smarttab

" List chars {{{2
set list
set listchars=tab:│\ ,trail:•,extends:❯,precedes:❮

" When the terminal is more compact this indicates breaks
set showbreak=↪

" diff and VertSplit devide
set fillchars=diff:⣿
set fillchars=vert:\▏

" }}}
" Folding {{{2

set foldlevelstart=0
set foldenable
set foldmethod=marker
set foldnestmax=5

" Folding character used when folded.
set fillchars=fold:━

" 80 is subtracted by line length to create a fold.
function! MyFoldText()
	let line = getline(v:foldstart)
	let foldedlinecount = v:foldend - v:foldstart
	let separator = 80 - len(line)

	let line_end = foldedlinecount . ' ━ lines │ depth '
	let line_separator = repeat('─', separator - len(line_end)+4)
	let line = substitute(line," \{\{\{",' ' . line_separator . ' ' . line_end,'g')

	" Create the space for after the 80 text width
	let space = 350 - len(line)
	return toupper(line).'…'.repeat(" ",space)

endfunction

set foldtext=MyFoldText()


"}}}
" spelling {{{2
" The active spell checking dictionary, when spell checking is enabled.
set complete+=kspell
set dictionary+=/usr/share/dict/words

" }}}
" }}} end formatting
" History, ignore and tags {{{1
" undo {{{2
set history=1000
set undofile
set undoreload=10000
if !isdirectory(&undodir) | call mkdir(&undodir, "p") | endif
let &undodir = expand('~/.config/nvim/undo//')
" }}}
" swap {{{2
set noswapfile                    " it's 2013, Vim.
let &directory = expand('~/.config/nvim/swap//')
if !isdirectory(&directory) | call mkdir(&directory, "p") | endif
" }}}
" backup {{{2
set backup
let &backupdir = expand('~/.config/nvim/backup//')
if !isdirectory(&backupdir) | call mkdir(&backupdir, "p") | endif
" }}}
" Ignore {{{2

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip         " MacOSX/Linux
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.db

set wildignore+=*/node_modules/*,_site,*/__pycache__/,*/venv/*,*/target/*
set wildignore+=*/.vim$,\~$,*/.log,*/.aux,*/.cls,*/.aux,*/.bbl,*/.blg,*/.fls
set wildignore+=*/.fdb*/,*/.toc,*/.out,*/.glo,*/.log,*/.ist,*/.fdb_latexmk



"}}}
" tags {{{2
" This will check the current folder for tags file and keep going one directory
" up all the way to the root folder. So you can be in any sub-folder in your
" project and it'll be able to find the tags files.
set tags=tags;/
" }}}
"}}} end history
" Remaps {{{1
" navigation {{{2
" keep hands on the homerow
inoremap jj <Esc>

" Make j and k work well on wrapped lines
noremap j gj
noremap k gk

" Shift-h/l to the beginning and end of the line
nnoremap H ^
nnoremap L g_

" Control-h/l To the beginning and end of the line in command mode
cnoremap <C-h> <home>
cnoremap <C-l> <end>

" Control-j/k jump through the change list, to last inserts point.
nnoremap <UP> g;
nnoremap <DOWN> g,

" cotrol jkhl to navigate split
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" }}}
" resize {{{2
nnoremap <S-Up> :resize +2<CR>
nnoremap <S-Down> :resize -2<CR>
nnoremap <S-Left> :vertical resize +2<CR>
nnoremap <S-Right> :vertical resize -2<CR>

" }}}
" search {{{2
" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" When using star to search for a word. Do not jump on match
nnoremap * *<c-o>

" When jumping center the line.
nnoremap <c-o> <c-o>zz
nnoremap <c-i> <c-i>zz

" Reopen the last search in a QuickFix window
nnoremap <silent><leader>/ : execute 'vimgrep / '.@/.'/g %'<CR>:copen<CR>

"nnoremap g; g;zz
"nnoremap g, g,zz

" Greps through project for the word under the cursor.
nnoremap ? :vimgrep /\<<c-r>=expand('<cword>')<cr>\>/ % \| :copen<CR>

" clear highlights
nnoremap <leader><space> :noh<CR>

" }}}
" copy paste {{{2
" Copy to system clipboard with ''
vmap '' :w !pbcopy<CR><CR>

" set paste unsets some of vims indent and format options.
set pastetoggle=<F1>

" }}}
" spaces to tabs {{{2
nnoremap <leader><TAB> :set et! list!<CR>

" }}}
" nerdtree {{{2
" nnoremap <leader>x :NERDTreeToggle<CR>
" }}}

" }}} end remaps
" commands and functions {{{1
" commands {{{2

command! -nargs=1 Fold :set foldlevel=<args>

" Correct misspellings.
command! -bang Q q<bang>
command! -bang W w<bang>
command! -bang Wq wq<bang>

command! Gqf GitGutterQuickFix | copen

" }}}
" Aug Commands {{{2
if has("autocmd")
" equal on resize {{{3
" If the terminal frame is reduce or expanded keep the windows equal.
au VimResized * :wincmd =
" }}}
" set paste exit {{{3
" exit paste when past has been set.
autocmd InsertLeave * set nopaste
" }}}
" return to line {{{3
" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
	au!
	au BufReadPost *
		\ if line("'\"") > 0 && line("'\"") <= line("$") |
		\     execute 'normal! g`"zvzz' |
		\ endif
augroup END
" }}}
" clear white space {{{3
autocmd BufWritePre * :%s/\s\+$//e
" }}}
endif " has("autocmd")
" }}}
" }}}
" functions {{{2
" Number Toggle {{{3
" when setting paste this would be good to remove.
function! NumberToggle()
	if(&relativenumber == 1)
		set norelativenumber
		set nonumber
		set nolist
	else
		set relativenumber
		set number
		set list
	endif

endfunction

nnoremap <f2> :call NumberToggle()<CR>
" }}}
" open help on word {{{3
" show docs on things with K
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nnoremap <silent> K :call <SID>show_documentation()<CR>

" }}}
" note grep {{{3
" Get the line and column. This is so the cursor can be returend to the line.
" Search notes with vims built in grep. Use a word boundary to stop grep looking
" for words inside words like todo - autodone. If the string is not empty and
" the results of the search are not zero, open the quickfix and jump to first
" match,
function! NoteGreper()
	let l = line(".")
	let c = col(".")
	call inputsave()
	let name = input("Grep Notes:>")
	call inputrestore()
	if name != ''
		silent! execute 'vimgrep /\<' .name. '\>' . '/' expand("$HOME")."/.notes/**/*"
		if len(getqflist()) != 0
			copen
		else
			echom "\n"
			echom "Search returned" . " " . len(getqflist()) . " " . "results"
			call cursor(l, c)
		endif
	else
		call cursor(l, c)
	endif
endfunction

nnoremap <leader>n :call NoteGreper()<cr>
" }}}
" }}}
" vender plugins {{{1

" Custom Highlights {{{2
runtime ./colors/custom-highlight-colors.vim
" }}}
" indentLine {{{2
" set this so we wont break indentation plugin
set conceallevel=2
" indentLine
let g:indentLine_enabled = 1
let g:indentLine_char_list = ['▏', '¦', '┆', '┊']
let g:indentLine_setColors = 0
let g:indentLine_setConceal = 0

" When opening these types of files, the plugin is enabled by default.
let g:indentLine_fileType = ['json', 'html', 'ruby', 'rb', 'eruby', 'erb', 'css', 'scss', 'py']

" Exclue filetypes
let g:indentLine_fileTypeExclude = ['text', 'txt', 'md', 'markdown', 'sh']

" }}}
" }}}
"==============================================================================
let g:colorizer_auto_filetype='css'
let g:colorizer_skip_comments = 1
