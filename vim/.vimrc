" ##################################
" colorscheme
" using ~/.vim/plugin/ScrollColors ...
nnoremap <F3> :NEXTCOLOR<cr>
nnoremap <F2> :PREVCOLOR<cr>
"colorscheme koehler
"colorscheme Tomorrow-Night-Eighties
colorscheme molokai

set nu
set relativenumber
set foldmethod=manual
"set foldmethod=indent
"set foldlevelstart=20
autocmd Filetype cpp setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype html setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype vue setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 noexpandtab
inoremap ii <Esc>
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

set nocompatible	"REQUIRED FOR VUNDLE
syntax enable
"filetype plugin on
filetype off		"REQUIRED FOR VUNDLE

" ###############################################
" FILE SEARCH
" Search down into subfolders using tab completion
set path+=**
" set path=$PWD/**

" Display all matching files when we tab complete
set wildmenu

" Hit tab to :find by partial match
" Use * to make it fuzzy

" :b lets you autocomplete any open buffers


" ###############################################
" NAVIGATING WITH CTAGS
command! MakeTags !ctags -R .
set tags=tags
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack
" '^' means the <Ctrl> key


" ###############################################
" AUTOCOMPLETE
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
" PLUGINS
if filereadable(expand("~/.vim/plugins.vim"))
  source ~/.vim/plugins.vim
endif

" ###############################################
" SNIPPETS:
if filereadable(expand("~/.vim/snippets.vim"))
  source ~/.vim/snippets.vim
endif

