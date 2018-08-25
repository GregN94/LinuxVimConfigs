set t_Co=256
"--------- Vundle Begin ---------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tenfyzhong/CompleteParameter.vim'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'miyakogi/conoline.vim'
Plugin 'ddollar/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'rainux/vim-desert-warm-256'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'junegunn/seoul256.vim'
Plugin 'HenryNewcomer/vim-theme-papaya'
Plugin 'kiddos/malokai.vim'
Plugin 'dikiaap/minimalist'
Plugin 'danilo-augusto/vim-afterglow'
Plugin 'mhartington/oceanic-next'
Plugin 'joshdick/onedark.vim'
Plugin 'sts10/vim-pink-moon'
Plugin 'vim-scripts/wombat256.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ------- Vundle End --------
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 0

let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:AutoPairs = {'[':']', '{':'}',"'":"'",'"':'"', '`':'`', '<':'>'}
inoremap <buffer><silent> ) <C-R>=AutoPairsInsert(')')<CR>
inoremap <silent><expr> ( complete_parameter#pre_complete("()")
smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)

execute pathogen#infect()
syntax on           "Kolorowanie skladni
" for vim 8
 if (has("termguicolors"))
  set termguicolors
 endif
 colorscheme onedark






set ic
set history=50        " keep 50 lines of command line history
set hlsearch          " zaznaczanie szukanego tekstu
set incsearch         " do incremental searching
set laststatus=2      " zawsze pokazuj linie statusu
set mouse=a           " pomijaj nr linii przy zaznaczaniu w trybie nieGUI
set ruler             " show the cursor position all the time
set shiftwidth=4
set showcmd           " display incomplete commands
set showmatch         " pokaz otwieraj±cy nawias gdy wpisze zamykaj±
set cindent
set so=5              " przewijaj juz na 5 linii przed koñce
set wildmenu          " wy¶wietlaj linie z menu podczas dope³nian
set wrap              " zawijanie linii
" use spaces instead of tabs
set tabstop=4
set shiftwidth=4
set expandtab

let g:fzf_tags_command = 'ctags --extra=+f -R'

" CONOLINE settings"
let g:conoline_color_normal_light = "ctermbg=24"
let g:conoline_color_normal_nr_light = "ctermbg=240 ctermfg=white"
let g:conoline_color_insert_light = "ctermbg=23"
let g:conoline_color_insert_nr_light = "ctermbg=red"
" CONOLINE END "

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set number
augroup END

" highlight ExtraWhitespace at end of line, remove them at save buffer ######################

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

autocmd BufWritePre     *.cpp :call TrimWhiteSpace()
autocmd BufWritePre     *.hpp :call TrimWhiteSpace()
autocmd BufWritePre     *.ttcn3 :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()

function! Switch_HPP_CPP()
    if match(expand("%"),'\.cpp') > 0
        let s:flipname = substitute(expand("%"),'\.cpp\(.*\)','\.hpp\1',"")
        let s:flipname = substitute(s:flipname, 'Source','Include',"")
    else
        let s:flipname = substitute(expand("%"),'\.hpp\(.*\)','\.cpp\1',"")
        let s:flipname = substitute(s:flipname, 'Include', 'Source', "")
    endif
    exe ":e " s:flipname
endfun


"------------------- SHORTCUTS BEGIN ----------------------------
map     <F1> :call Switch_HPP_CPP()<CR>   " switching between *.hpp and *.cpp file
nmap    <F5> :NERDTreeToggle<CR>   " klawisz do odpalania NERDTree
nmap    <F4> :NERDTreeFind<CR>   " klawisz do szukania w NERDTree ospowiedniej sciezki

map     <F6> :vsplit<CR>
nmap <F8> :TagbarToggle<CR>
map     <F9> :set number!<CR>               " przelacza wyswietlanie numerow linii

"------------------ SHORTCUTS END -----------------------------------


map <F2> <C-]>
map <F3> <C-T>

imap    ii <Esc>
map             <S-Insert>     :set paste <MiddleMouse>
map!    <S-Insert>      <MiddleMouse>


"------------- FILE SEARCH (CTRL-P) BEGIN -------------------
     let g:ctrlp_working_path_mode = 'a'
     let g:ctrlp_max_height = 30
     let g:ctrlp_user_command = 'find %s  \( -not -path "*/lteDo/*" -a -not -path "*/misc/*" -a -not -path "*/logs/*" -a -not -path "*/.svn/*" \) -type f'
     " Use a leader instead of the actual named binding
     nmap <leader>p :CtrlP<cr>

     " Easy bindings for its various modes
     nmap <leader>bb :CtrlPBuffer<cr>
     nmap <leader>bm :CtrlPMixed<cr>
     nmap <leader>bs :CtrlPMRU<cr>
     cnoremap %proj <c-r>=expand('/var/fpwork/nowinski/trunk')<cr>

     "uncomment if you want to launch Ctrl-P in regexp and file-name mode
     "automatically
     "let g:ctrlp_regexp = 1
     "let g:ctrlp_by_filename = 1
 "------------- FILE SEARCH (CTRL-P) END -------------------


"----------AirLine--------"
let g:airline_theme='simple'

" Enable the list of buffers
 let g:airline#extensions#tabline#enabled = 1
"
" " Show just the filename
 let g:airline#extensions#tabline#fnamemod = ':t'
"
" " This allows buffers to be hidden if you've modified a buffer.
" " This is almost a must if you wish to use buffers in this way.
 set hidden
"
" " To open a new empty buffer
" " This replaces :tabnew which I used to bind to this mapping
 nmap <leader>T :enew<cr>
"
" " Move to the next buffer
 nmap <leader>j :bnext<CR>
"
" " Move to the previous buffer
 nmap <leader>h :bprevious<CR>
"
" " Close the current buffer and move to the previous one
" " This replicates the idea of closing a tab
 nmap <leader>bq :bp <BAR> bd #<CR>
"
" " Show all open buffers and their status
 nmap <leader>bl :ls<CR>


