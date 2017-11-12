" ウィンドウの縦幅
set lines=54
" ウィンドウの横幅
set columns=120
" 半透明化
" autocmd GUIEnter * set transparency=220

function! s:toggle_transparence()
    if &transparency == 220
        set transparency=0
    else
        set transparency=220
    endif
endfunction
nnoremap <silent> <Space>tt :<C-u>call <SID>toggle_transparence()<CR>

"---------------------------------------------------------------------------
" フォント設定:
"
if has('win32')
  " Windows用
  set guifont=Consolas:h11
  set guifontwide=MeiryoKe_Gothic:h11
  "set guifont=MS_Gothic:h12:cSHIFTJIS
  "set guifont=MS_Mincho:h12:cSHIFTJIS
  " 行間隔の設定
  set linespace=0
  " 一部のUCS文字の幅を自動計測して決める
  if has('kaoriya')
    set ambiwidth=auto
  endif
elseif has('unix')
  "set guifont=Inconsolata\ 13
  set guifont=Mim\ for\ Powerline\ 13.5
  set linespace=0
elseif has('mac')
  set guifont=Osaka－等幅:h14
elseif has('xfontset')
  " UNIX用 (xfontsetを使用)
  set guifontset=a14,r14,k14
endif

" メニューバー非表示
set guioptions-=m
" ツールバー非表示
set guioptions-=T
" スクロールバー非表示
set guioptions-=r
set guioptions-=L
" タブバーの表示
set guioptions-=e
set showtabline=2
set cmdheight=1
" 選択にコマンドラインを使用
set guioptions+=c

set visualbell t_vb=

