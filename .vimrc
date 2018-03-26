" vim-plug Installation
"
" Download plug.vim and put it in the "autoload" directory.
" Vim
" Unix
"
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" You can automate the process by putting the command in your Vim configuration file as suggested here.
" Windows (PowerShell)
"
" md ~\vimfiles\autoload
" $uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
" (New-Object Net.WebClient).DownloadFile(
"   $uri,
"   $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
"     "~\vimfiles\autoload\plug.vim"
"   )
" )
"
" Neovim
" Unix
"
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" Windows (PowerShell)
"
" md ~\AppData\Local\nvim\autoload
" $uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
" (New-Object Net.WebClient).DownloadFile(
"   $uri,
"   $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
"     "~\AppData\Local\nvim\autoload\plug.vim"
"   )
" )

"================================================================
" 基本設定
"================================================================

" エンコーディングを設定
set fenc=utf-8
scriptencoding utf-8

" 自動生成ファイルの出力先指定
if !has('nvim')
    let back_path = expand('~/.vim/backup')
    let swap_path = expand('~/.vim/swap')
    let info_path = expand('~/.vim/viminfo')
    let undo_path = expand('~/.vim/undo')

    if !isdirectory(back_path)
        call mkdir(back_path, "p")
    endif
    if !isdirectory(swap_path)
        call mkdir(swap_path, "p")
    endif
    if !isdirectory(info_path)
        call mkdir(info_path, "p")
    endif
    if !isdirectory(undo_path)
        call mkdir(undo_path, "p")
    endif

    set backupdir=~/.vim/backup
    set directory=~/.vim/swap
    set viminfo+=n~/.vim/viminfo/viminfo.txt
    set undodir=~/.vin/undo
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
set cursorline
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
" autocmd BufEnter * execute 'lcd ' fnameescape(expand('%:p:h'))
" autocmd BufEnter * if expand('%:p') !~ '://' | execute 'lcd ' fnameescape(expand('%:p:h')) | endif

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


" ===============================================================
" Plugin
" ===============================================================

call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-jp/vimdoc-ja'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'honjet/hydrangea-vim'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'kana/vim-smartinput'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'w0rp/ale'

call plug#end()

colorscheme hydrangea

autocmd User ALELint call lightline#update()

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

" ale
let g:ale_sign_column_always = 1
