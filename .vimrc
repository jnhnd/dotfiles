"================================================================
" 基本設定
"================================================================

" エンコーディングを設定
set encoding=utf-8
set fenc=utf-8
scriptencoding utf-8

" ファイルフォーマットを指定
set fileformats=unix,dos,mac

" 自動生成ファイルの出力先指定
if !has('nvim')
    let back_path = expand('~/.vim/backup')
    let swap_path = expand('~/.vim/swap')
    let undo_path = expand('~/.vim/undo')
    let info_path = expand('~/.vim/viminfo')
    " make directory
    if !isdirectory(back_path)
        call mkdir(back_path, "p")
    endif
    if !isdirectory(swap_path)
        call mkdir(swap_path, "p")
    endif
    if !isdirectory(undo_path)
        call mkdir(undo_path, "p")
    endif
    if !isdirectory(info_path)
        call mkdir(info_path, "p")
    endif
    " set directory
    set backupdir=~/.vim/backup
    set directory=~/.vim/swap
    set undodir=~/.vin/undo
    set viminfo+=n~/.vim/viminfo/viminfo.txt
endif

" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" 終了時の保存確認
set confirm
"タイトルバーにファイルパス情報等の表示をする
set title
" 行番号を表示
set number
" 現在の行を強調表示
" set cursorline
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
set matchtime=1
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list,full
" コマンドラインの高さ
set cmdheight=1
" タブページ表示
set showtabline=2
" 不可視文字を可視化
set list listchars=tab:>-,trail:~
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=4
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" 置換時に g オプションをデフォルトでつける
set gdefault
" カーソルの回り込みを可能に
set whichwrap=b,s,h,l,[,],<,>
" BackSpace を空白、行頭、行末でも可能に
set backspace=indent,eol,start
" クリップボードへのコピー
set clipboard=unnamed
" 畳み込み禁止
set nofoldenable
" 行に余裕をもたせてスクロールする
set scrolloff=8
" 長い行を表示する
set display=lastline
" 補完メニューの高さ
set pumheight=10


"================================================================
" 自動コマンド
"================================================================

" Quickfix の自動化
autocmd QuickFixCmdPost *grep* cwindow

" ディレクトリ自動変更
autocmd BufEnter * execute 'lcd ' fnameescape(expand('%:p:h'))

" ペースト時の自動インデントと自動コメントアウトの無効化
autocmd FileType * setlocal formatoptions-=ro

" 背景無効化
" au VimEnter,ColorScheme * highlight Normal ctermbg=NONE
" au VimEnter,ColorScheme * highlight NonText ctermbg=NONE
" au VimEnter,ColorScheme * highlight LineNr ctermbg=NONE
" au VimEnter,ColorScheme * highlight SpecialKey ctermbg=NONE
" au VimEnter,ColorScheme * highlight ErrorMsg ctermbg=NONE
" au VimEnter,ColorScheme * highlight HtmlTag ctermbg=NONE
" au VimEnter,ColorScheme * highlight HtmlEndTag ctermbg=NONE
" au VimEnter,ColorScheme * highlight SpecialComment ctermbg=NONE


"================================================================
" カーソル形状
"================================================================

set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor


"================================================================
" キーマップ
"================================================================

" ノーマルモード & ビジュアルモードでのキーマッピング
noremap <m-q> :qa<CR>
noremap <m-w> :wa<CR>
noremap <c-q> :bd<CR>
noremap ; :
noremap : ;
noremap <m-c> "+y
noremap <m-v> "+gP
noremap Q <Nop>

" コマンドモード & 挿入モードでのキーマッピング
noremap! <c-f> <right>
noremap! <c-b> <left>
noremap! <c-a> <home>
noremap! <c-e> <end>
noremap! <c-d> <del>

" ノーマルモードでのキーマッピング
nnoremap Y y$
nnoremap + <c-a>
nnoremap - <c-x>
nnoremap <Enter> o<Esc>
nnoremap <Esc><Esc> :noh<CR>
nnoremap <m-j> <c-w>+
nnoremap <m-k> <c-w>-
nnoremap <m-h> <c-w><
nnoremap <m-l> <c-w>>

" コマンドモードでのキーマッピング
cnoremap <c-p> <up>
cnoremap <c-n> <down>

" 挿入モードでのキーマッピング
" inoremap jj <Esc>

"================================================================
" ユーザ定義コマンド
"================================================================
if has('win32') || has('win64')
    " markdown to html
    function! s:markdown_to_html()
        write
        !md2html.bat %
    endfunction
    command! Md2html call s:markdown_to_html()
    " markdown to docx
    function! s:markdown_to_docx()
        write
        !md2docx.bat %
    endfunction
    command! Md2docx call s:markdown_to_docx()
endif


" ===============================================================
" Plugin
" ===============================================================

call plug#begin('~/.vim/plugged')

Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" Look
Plug 'yuttie/hydrangea-vim'
Plug 'mkarmona/materialbox'
Plug 'itchyny/lightline.vim'

" File
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
if has('win32') || has('win64')
    Plug 'kien/ctrlp.vim'
endif

" Edit
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/vim-easy-align'

call plug#end()

"================================================================
" プラグイン設定
"================================================================

" colorscheme
colorscheme hydrangea

" lightline
let g:lightline = {
            \ 'colorscheme': 'hydrangea',
            \ 'component': {
            \   'readonly': '%{&readonly?"\u2b64":""}',
            \ },
            \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
            \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" }
            \ }
let g:lightline.tabline = {
            \ 'left': [ [ 'tabs' ] ],
            \ 'right': [ [ 'close' ] ] }
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ ['darkestgreen', 'brightgreen', 'bold'], ['white', 'gray4'] ]
let s:p.normal.right = [ ['gray5', 'gray10'], ['gray9', 'gray4'], ['gray8', 'gray2'] ]
let s:p.inactive.right = [ ['gray1', 'gray5'], ['gray4', 'gray1'], ['gray4', 'gray0'] ]
let s:p.inactive.left = s:p.inactive.right[1:]
let s:p.insert.left = [ ['darkestcyan', 'white', 'bold'], ['white', 'darkblue'] ]
let s:p.insert.right = [ [ 'darkestcyan', 'mediumcyan' ], [ 'mediumcyan', 'darkblue' ], [ 'mediumcyan', 'darkestblue' ] ]
let s:p.replace.left = [ ['white', 'brightred', 'bold'], ['white', 'gray4'] ]
let s:p.visual.left = [ ['darkred', 'brightorange', 'bold'], ['white', 'gray4'] ]
let s:p.normal.middle = [ [ 'gray7', 'gray2' ] ]
let s:p.insert.middle = [ [ 'mediumcyan', 'darkestblue' ] ]
let s:p.replace.middle = s:p.normal.middle
let s:p.replace.right = s:p.normal.right
let s:p.tabline.left = [ [ 'gray9', 'gray4' ] ]
let s:p.tabline.tabsel = [ [ 'darkestgreen', 'brightgreen' ] ]
let s:p.tabline.middle = [ [ 'gray7', 'gray2' ] ]
let s:p.tabline.right = [ [ 'gray9', 'gray4' ] ]
let s:p.normal.error = [ [ 'gray9', 'brightestred' ] ]
let s:p.normal.warning = [ [ 'gray1', 'yellow' ] ]
let g:lightline#colorscheme#powerline#palette = lightline#colorscheme#fill(s:p)
let g:lightline.component_expand = {
            \ 'tabs': 'lightline#tabs' }
let g:lightline.component_type = {
            \ 'tabs': 'tabsel' }

" NERDTree
nnoremap <Space>fn :NERDTreeFind<CR>
nnoremap <Space>ft :NERDTreeToggle<CR>

" fzf
if executable('fzf')
    let g:fzf_commands_expect = 'enter'
    if executable('rg')
        set grepprg=rg\ --vimgrep
        command! -bang -nargs=* Rg
                    \ call fzf#vim#grep(
                    \   'rg --line-number --no-heading '.shellescape(<q-args>), 1,
                    \   fzf#vim#with_preview({'options': '--exact --reverse'}, 'right:50%:wrap'))
    endif
    " fzf keymap
    nnoremap <Space>p :Commands<CR>
    nnoremap <Space>ff :Files ~/<CR>
    nnoremap <Space>fg :GFiles<CR>
    nnoremap <Space>fh :History<CR>
    nnoremap <Space>fb :Buffers<CR>
    nnoremap <Space>fr :Rg<CR>
endif

" ctrlp
if has('win32') || has('win64')
    let g:ctrlp_cmd = 'CtrlPMRUFiles'
    let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,result:50'
    let g:ctrlp_root_markers = ['Cargo.toml', 'stack.yaml', 'Gemfile']
    let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_mruf_max = 500
    let g:ctrlp_open_new_file = 'h'
    let g:ctrlp_use_migemo = 1
    if executable('rg')
        let g:ctrlp_user_command = 'rg %s --files --hidden --no-ignore --follow --color=never --glob "!.git/*"'
        let g:ctrlp_use_caching = 0
    endif
endif

