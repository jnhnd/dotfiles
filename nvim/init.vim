"================================================================
" 基本設定
"================================================================

" エンコーディングを設定
"set encoding=utf-8
set fenc=utf-8
scriptencoding utf-8

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
set clipboard+=unnamed,unnamedplus
" 畳み込み禁止
set nofoldenable
" スクロールに行数の余裕をもたせる
set scrolloff=7


"================================================================
" 自動コマンド
"================================================================

" ディレクトリ自動変更
autocmd BufEnter * execute 'lcd ' fnameescape(expand('%:p:h'))

" ペースト時の自動インデントと自動コメントアウトの無効化
autocmd FileType * setlocal formatoptions-=ro

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

" コマンドモードでのキーマッピング
cnoremap <c-p> <up>
cnoremap <c-n> <down>

" 挿入モードでのキーマッピング
inoremap jj <Esc>
inoremap <c-j> <Esc>o

" ===============================================================
" Plugin
" ===============================================================

call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'yuttie/hydrangea-vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/vim-easy-align'

call plug#end()

colorscheme hydrangea

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
" lightline 色の設定
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
let s:p.tabline.left = [ [ 'gray9', 'gray2' ] ]
let s:p.tabline.tabsel = [ [ 'darkestgreen', 'brightgreen' ] ]
let s:p.tabline.middle = [ [ 'gray9', 'gray4' ] ]
let s:p.tabline.right = [ [ 'gray9', 'gray2' ] ]
let s:p.normal.error = [ [ 'gray9', 'brightestred' ] ]
let s:p.normal.warning = [ [ 'gray1', 'yellow' ] ]
let g:lightline#colorscheme#powerline#palette = lightline#colorscheme#fill(s:p)
let g:lightline.component_expand = {
            \ 'tabs': 'lightline#tabs' }
let g:lightline.component_type = {
            \ 'tabs': 'tabsel' }

let g:fzf_commands_expect = 'enter'
if executable('rg')
    set grepprg=rg\ --vimgrep
    command! -bang -nargs=* Rg
        \ call fzf#vim#grep(
        \   'rg --line-number --no-heading '.shellescape(<q-args>), 1,
        \   fzf#vim#with_preview({'options': '--exact --reverse'}, 'right:50%:wrap'))
endif
nnoremap <Space>p :Commands<CR>
nnoremap <Space>ff :Files ~/<CR>
nnoremap <Space>fg :GFiles<CR>
nnoremap <Space>fh :History<CR>
nnoremap <Space>fb :Buffers<CR>
nnoremap <Space>fr :Rg<CR>

nnoremap <Space>fn :NERDTreeFind<CR>
nnoremap <Space>ft :NERDTreeToggle<CR>

let g:rooter_change_directory_for_non_project_files = 'current'
