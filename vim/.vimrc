" ##################################
" COLORSCHEME:
" using ~/.vim/plugin/ScrollColors ...
nnoremap <F3> :NEXTCOLOR<cr>
nnoremap <F2> :PREVCOLOR<cr>
"colorscheme koehler
"colorscheme Tomorrow-Night-Eighties
colorscheme molokai


" ##################################
" GENERAL STUFF:
set nu
set relativenumber
set foldmethod=manual
"set foldmethod=indent
"set foldlevelstart=20
autocmd Filetype cpp setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype html setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype vue setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 noexpandtab
inoremap jf <Esc>
let mapleader=","
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" buffer movements
nnoremap <leader>j :bn<Enter>
nnoremap <leader>h :bp<Enter>
" window movements
nnoremap <leader>wj <C-W><C-J>
nnoremap <leader>wh <C-W><C-H>
nnoremap <leader>wk <C-W><C-K>
nnoremap <leader>wl <C-W><C-L>
nnoremap <leader>wm <C-W><C-W>
" window resize
nnoremap < <C-W>3<
nnoremap > <C-W>3>
nnoremap <leader>wu <C-W>3+
nnoremap <leader>wd <C-W>3-

"set nocompatible	"REQUIRED FOR VUNDLE
"syntax enable
"filetype plugin on
"filetype off		"REQUIRED FOR VUNDLE


" ###############################################
" FILE SEARCH
nnoremap <leader>ee :NERDTreeToggle<Enter>
"function! NERDTreeHighlightCurBuf()
"    let l:curBuf = bufname("%")
"    autocmd WinEnter * call nerdtree#highlightCurrent(l:curBuf)
"endfunction
"autocmd VimEnter * call NERDTreeHighlightCurBuf()

" FZF file search
"nnoremap <leader>f :FZF<Enter>
function! FzyCommand(choice_command, vim_command)
  try
    let output = system(a:choice_command . " | fzy ")
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction
nnoremap <leader>f :call FzyCommand("find . -type f", ":e")<cr>
"nnoremap <leader>v :call FzyCommand("find . -type f", ":vs")<cr>
"nnoremap <leader>s :call FzyCommand("find . -type f", ":sp")<cr>
" Search down into subfolders using tab completion
set path+=**
" set path=$PWD/**

" Display all matching files when we tab complete
set wildmenu

" Hit tab to :find by partial match
" Use * to make it fuzzy

" :b lets you autocomplete any open buffers


" ###############################################
" NAVIGATING WITH CTAGS:
command! MakeTags !ctags -R .
set tags=tags
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack
" '^' means the <Ctrl> key


" ###############################################
" AUTOCOMPLETE:
" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option
" - ^p for previous
"
" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list


" ###############################################
" AUTO UPDATE VIEW OF FILES:
"
" HOW IT WORKS:
" This updates the view of files in a vim instance
" by calling `checktime` every time increment
" (default may be every 4 seconds if updatetime
" is not set, but in this case, it is set to
" update 2 seconds after it is triggered).
"
" MOTIVATION:
" This configuration is intended to allow with
" greater ease an up-to-date view of files for
" reference while developing to separate the
" concerns of editing files while
" viewing/referencing relevant files.
"
" It allows the developer a better way to have
" multiple views of the codebase to retain a
" greater context for the code being changed.
set autoread
set updatetime=2000

augroup AutoRead
  autocmd!
  autocmd CursorHold,CursorHoldI * checktime
  autocmd FocusGained * checktime
augroup END


" ###############################################
" FILE BROWSING:

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
"let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings


" ###############################################
" PLUGINS:
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'davidhalter/jedi-vim'
Plug 'preservim/nerdtree'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'szw/vim-maximizer'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim' " Git commit browser
Plug 'preservim/vim-markdown' " Formatting and viewing markdown files
"Plug 'godlygeek/tabular' " Displaying markdown tables in a more readable way
Plug 'dhruvasagar/vim-table-mode'

" ##########################################
" Jedi default mappings (python intellisense)
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>ga"
let g:jedi#goto_stubs_command = "<leader>gs"
let g:jedi#goto_definitions_command = "gd"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>gu"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#rename_command_keep_name = "<leader>R"
"if filereadable(expand("~/.vim/plugins.vim"))
"  source ~/.vim/plugins.vim
"endif

" ###############################################
" Initialize plugin system
call plug#end()


" ###############################################
" SNIPPETS:
if filereadable(expand("~/.vim/snippets.vim"))
  source ~/.vim/snippets.vim
endif

" or...
" SNIPPETS THE MANUAL WAY:
" nnoremap ,div i<div></div><ESC>5hi

