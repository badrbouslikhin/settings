" key bindings
nmap <C-e> :!eijiro <C-R><C-W><CR>
nmap ,man :!man -S 2,3,1,4,5,6,7,8,9 <C-R><C-W><CR>
map ,cd :cd %:p:h<CR>
"nmap <C-N><C-N> :set invnumber<CR>
nmap ,last '0
nmap ,msession :mksession $HOME/etc/session.vim<CR>
nmap ,rsession :source $HOME/etc/session.vim<CR>
nmap . .`[

"nmap <Space> :MBEbn<CR>
"" screen like key bindings
"let mapleader = "^F"
"nnoremap <Leader><Space> :MBEbn<CR>
"nnoremap <Leader>n       :MBEbn<CR>
"nnoremap <Leader><C-n>   :MBEbn<CR>
"nnoremap <Leader>p       :MBEbp<CR>
"nnoremap <Leader><C-p>   :MBEbp<CR>
"nnoremap <Leader>c       :new<CR>
"nnoremap <Leader><C-c>   :new<CR>
"nnoremap <Leader>k       :bd<CR>
"nnoremap <Leader><C-k>   :bd<CR>
""nnoremap <Leader>s       :IncBufSwitch<CR>
""nnoremap <Leader><C-s>   :IncBufSwitch<CR>
"nnoremap <Leader><Tab>   :wincmd w<CR>
"nnoremap <Leader>Q       :only<CR>
"nnoremap <Leader>w       :ls<CR>
"nnoremap <Leader><C-w>   :ls<CR>
"nnoremap <Leader>a       :e #<CR>
"nnoremap <Leader><C-a>   :e #<CR>
"nnoremap <Leader>"       :BufExp<CR>
"nnoremap <Leader>1       :e #1<CR>
"nnoremap <Leader>2       :e #2<CR>
"nnoremap <Leader>3       :e #3<CR>
"nnoremap <Leader>4       :e #4<CR>
"nnoremap <Leader>5       :e #5<CR>
"nnoremap <Leader>6       :e #6<CR>
"nnoremap <Leader>6       :e #7<CR>
"nnoremap <Leader>6       :e #8<CR>
"nnoremap <Leader>6       :e #9<CR>

" close symbols
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi{<C-R>z}<ESC>
vnoremap [ "zdi[<C-R>z]<ESC>
vnoremap ( "zdi(<C-R>z)<ESC>
vnoremap " "zdi"<C-R>z"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

" move between function
map [[ ?{<CR>w99[{
map ][ /}<CR>b99]}
map ]] j0[[%/{<CR>
map [] k$][%?}<CR>

" ctags with screen (C-t key binding)
nmap <c-\[> :pop<CR>

" short command name
command! MK make
command! MKC make clean
command! MKI make install-files
command! GF execute "Gtags -f " . expand("%:~:.")
command! RS %s/\s\+$//
if has("python")
  command! -nargs=+ Calc :python print <args>
  python from math import *
endif

" Don't exit vim when closing last tab with :q and :wq, :qa, :wqa
cabbrev q   <C-r>=(getcmdtype() == ':' && getcmdpos() == 1 && tabpagenr('$') == 1 && winnr('$') == 1 ? 'enew' : 'q')<CR>
cabbrev wq  <C-r>=(getcmdtype() == ':' && getcmdpos() == 1 && tabpagenr('$') == 1 && winnr('$') == 1 ? 'w\|enew' : 'wq')<CR>
cabbrev qa  <C-r>=(getcmdtype() == ':' && getcmdpos() == 1 ? 'tabonly\|only\|enew' : 'qa')<CR>
cabbrev wqa <C-r>=(getcmdtype() == ':' && getcmdpos() == 1 ? 'wa\|tabonly\|only\|enew' : 'wqa')<CR>

""---------------------------------------------------------------------------
"" Key-mappings:
""
"
"" Use <C-Space>.
"nmap <C-Space>  <C-@>
"cmap <C-Space>  <C-@>
"
"" Visual mode keymappings: "{{{
"" <TAB>: indent.
"xnoremap <TAB>  >
"" <S-TAB>: unindent.
"xnoremap <S-TAB>  <
"
"" Indent
"nnoremap > >>
"nnoremap < <<
"xnoremap > >gv
"xnoremap < <gv
"
"if has('clipboard')
"  xnoremap <silent> y "*y:let [@+,@"]=[@*,@*]<CR>
"endif
""}}}
"
"" Insert mode keymappings: "{{{
"" <C-t>: insert tab.
"inoremap <C-t>  <C-v><TAB>
"" <C-d>: delete char.
"inoremap <C-d>  <Del>
"" <C-a>: move to head.
"inoremap <silent><C-a>  <C-o>^
"" Enable undo <C-w> and <C-u>.
"inoremap <C-w>  <C-g>u<C-w>
"inoremap <C-u>  <C-g>u<C-u>
"
"if has('gui_running')
"  inoremap <ESC> <ESC>
"endif
"
"" H, D: delete camlcasemotion.
"inoremap <expr>H           <SID>camelcase_delete(0)
"inoremap <expr>D           <SID>camelcase_delete(1)
"function! s:camelcase_delete(is_reverse)
"  let save_ve = &l:virtualedit
"  setlocal virtualedit=all
"  if a:is_reverse
"    let cur_text = getline('.')[virtcol('.')-1 : ]
"  else
"    let cur_text = getline('.')[: virtcol('.')-2]
"  endif
"  let &l:virtualedit = save_ve
"
"  let pattern = '\d\+\|\u\+\ze\%(\u\l\|\d\)\|' .
"        \'\u\l\+\|\%(\a\|\d\)\+\ze_\|\%(\k\@!\S\)\+' .
"        \'\|\%(_\@!\k\)\+\>\|[_]\|\s\+'
"
"  if a:is_reverse
"    let cur_cnt = len(matchstr(cur_text, '^\%('.pattern.'\)'))
"  else
"    let cur_cnt = len(matchstr(cur_text, '\%('.pattern.'\)$'))
"  endif
"
"  let del = a:is_reverse ? "\<Del>" : "\<BS>"
"
"  return (pumvisible() ?
"        \ neocomplcache#smart_close_popup() : '') . repeat(del, cur_cnt)
"endfunction
""}}}
"
" Command-line mode keymappings:"{{{
" <C-a>, A: move to head.
cnoremap <C-a>          <Home>
" <C-b>: previous char.
cnoremap <C-b>          <Left>
" <C-d>: delete char.
cnoremap <C-d>          <Del>
" <C-e>, E: move to end.
cnoremap <C-e>          <End>
" <C-f>: next char.
cnoremap <C-f>          <Right>
" <C-n>: next history.
cnoremap <C-n>          <Down>
" <C-p>: previous history.
cnoremap <C-p>          <Up>
"" <C-k>, K: delete to end.
"cnoremap <C-k> <C-\>e getcmdpos() == 1 ?
"      \ '' : getcmdline()[:getcmdpos()-2]<CR>
"" <C-y>: paste.
"cnoremap <C-y>          <C-r>*
"
"cmap <C-o>          <Plug>(unite_cmdmatch_complete)
""}}}

" Command line buffer."{{{
nnoremap <SID>(command-line-enter) q:
xnoremap <SID>(command-line-enter) q:
nnoremap <SID>(command-line-norange) q:<C-u>

nmap ;;  <SID>(command-line-enter)
xmap ;;  <SID>(command-line-enter)

autocmd MyAutoCmd CmdwinEnter * call s:init_cmdwin()
autocmd MyAutoCmd CmdwinLeave * let g:neocomplcache_enable_auto_select = 1

function! s:init_cmdwin()
  let g:neocomplcache_enable_auto_select = 0
  let b:neocomplcache_sources_list = ['vim_complete']

  nnoremap <buffer><silent> q :<C-u>quit<CR>
  nnoremap <buffer><silent> <TAB> :<C-u>quit<CR>
  inoremap <buffer><expr><CR> neocomplete#close_popup()."\<CR>"
  inoremap <buffer><expr><C-h> col('.') == 1 ?
        \ "\<ESC>:quit\<CR>" : neocomplete#cancel_popup()."\<C-h>"
  inoremap <buffer><expr><BS> col('.') == 1 ?
        \ "\<ESC>:quit\<CR>" : neocomplete#cancel_popup()."\<C-h>"

  " Completion.
  inoremap <buffer><expr><TAB>  pumvisible() ?
        \ "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : "\<C-x>\<C-u>\<C-p>"

  " Remove history lines.
  silent execute printf("1,%ddelete _", min([&history - 20, line("$") - 20]))
  call cursor(line('$'), 0)

  startinsert!
endfunction"}}}

" [Space]: Other useful commands "{{{
" Smart space mapping.
" Notice: when starting other <Space> mappings in noremap, disappeared [Space].
nmap  <Space>   [Space]
xmap  <Space>   [Space]
nnoremap  [Space]   <Nop>
xnoremap  [Space]   <Nop>

" Toggle relativenumber.
nnoremap <silent> [Space].
      \ :<C-u>call ToggleOption('relativenumber')<CR>
nnoremap <silent> [Space]p
      \ :<C-u>call ToggleOption('paste')<CR>:set mouse=<CR>
" Toggle highlight.
nnoremap <silent> [Space]/
      \ :<C-u>call ToggleOption('hlsearch')<CR>
" Toggle cursorline.
nnoremap <silent> [Space]cl
      \ :<C-u>call ToggleOption('cursorline')<CR>
" Set autoread.
nnoremap [Space]ar
      \ :<C-u>setlocal autoread<CR>
" Output encoding information.
nnoremap <silent> [Space]en
      \ :<C-u>setlocal encoding? termencoding? fenc? fencs?<CR>
" Set spell check.
nnoremap [Space]sp
      \ :<C-u>call ToggleOption('spell')<CR>
nnoremap [Space]w
      \ :<C-u>call ToggleOption('wrap')<CR>
" Echo syntax name.
nnoremap [Space]sy
      \ :<C-u>echo synIDattr(synID(line('.'), col('.'), 1), "name")<CR>

" Easily edit .vimrc and .gvimrc "{{{
nnoremap <silent> [Space]ev  :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> [Space]eg  :<C-u>edit $MYGVIMRC<CR>
" Load .gvimrc after .vimrc edited at GVim.
nnoremap <silent> [Space]rv :<C-u>source $MYVIMRC \|
      \ if has('gui_running') \|
      \   source $MYGVIMRC \|
      \ endif \| echo "source $MYVIMRC"<CR>
nnoremap <silent> [Space]rg
      \ :<C-u>source $MYGVIMRC \|
      \ echo "source $MYGVIMRC"<CR>
"}}}

" Useful save mappings.
nnoremap <silent> <Leader><Leader> :<C-u>update<CR>

" Change current directory.
nnoremap <silent> [Space]cd :<C-u>call <SID>cd_buffer_dir()<CR>
function! s:cd_buffer_dir() "{{{
  let filetype = getbufvar(bufnr('%'), '&filetype')
  if filetype ==# 'vimfiler'
    let dir = getbufvar(bufnr('%'), 'vimfiler').current_dir
  elseif filetype ==# 'vimshell'
    let dir = getbufvar(bufnr('%'), 'vimshell').save_dir
  else
    let dir = isdirectory(bufname('%')) ? bufname('%') : fnamemodify(bufname('%'), ':p:h')
  endif

  cd `=dir`
endfunction"}}}

" Delete windows ^M codes.
nnoremap <silent> [Space]<C-m> mmHmt:<C-u>%s/\r$//ge<CR>'tzt'm

" Delete spaces before newline.
nnoremap <silent> [Space]ss mmHmt:<C-u>%s/<Space>$//ge<CR>`tzt`m

" Easily syntax change.
nnoremap <silent> [Space]ft :<C-u>Unite -start-insert filetype<CR>

" Exchange gj and gk to j and k. "{{{
command! -nargs=? -bar -bang ToggleGJK call s:ToggleGJK()
nnoremap <silent> [Space]gj :<C-u>ToggleGJK<CR>
xnoremap <silent> [Space]gj :<C-u>ToggleGJK<CR>
function! s:ToggleGJK()
  if exists('b:enable_mapping_gjk') && b:enable_mapping_gjk
    let b:enable_mapping_gjk = 0
    noremap <buffer> j j
    noremap <buffer> k k
    noremap <buffer> gj gj
    noremap <buffer> gk gk

    xnoremap <buffer> j j
    xnoremap <buffer> k k
    xnoremap <buffer> gj gj
    xnoremap <buffer> gk gk
  else
    let b:enable_mapping_gjk = 1
    noremap <buffer> j gj
    noremap <buffer> k gk
    noremap <buffer> gj j
    noremap <buffer> gk k

    xnoremap <buffer> j gj
    xnoremap <buffer> k gk
    xnoremap <buffer> gj j
    xnoremap <buffer> gk k
  endif
endfunction"}}}

" Change tab width. "{{{
nnoremap <silent> [Space]t2 :<C-u>setl shiftwidth=2 softtabstop=2<CR>
nnoremap <silent> [Space]t4 :<C-u>setl shiftwidth=4 softtabstop=4<CR>
nnoremap <silent> [Space]t8 :<C-u>setl shiftwidth=8 softtabstop=8<CR>
"}}}
"}}}

"" s: Windows and buffers(High priority) "{{{
"" The prefix key.
"nnoremap    [Window]   <Nop>
"nmap    s [Window]
"nnoremap <silent> [Window]p  :<C-u>call <SID>split_nicely()<CR>
"nnoremap <silent> [Window]v  :<C-u>vsplit<CR>
"nnoremap <silent> [Window]c  :<C-u>call <sid>smart_close()<CR>
"nnoremap <silent> -  :<C-u>call <SID>smart_close()<CR>
"nnoremap <silent> [Window]o  :<C-u>only<CR>
"nnoremap <silent> [Window]b  :<C-u>Thumbnail<CR>
"nnoremap <silent> [Window]<Space>  :<C-u>Unite -buffer-name=files file_rec:~/.vim/rc<CR>
"
"" A .vimrc snippet that allows you to move around windows beyond tabs
"nnoremap <silent> <Tab> :call <SID>NextWindow()<CR>
"nnoremap <silent> <S-Tab> :call <SID>PreviousWindowOrTab()<CR>
"
"function! s:smart_close()
"  if winnr('$') != 1
"    close
"  else
"    call s:alternate_buffer()
"  endif
"endfunction
"
"function! s:NextWindow()
"  if winnr('$') == 1
"    silent! normal! ``z.
"  else
"    wincmd w
"  endif
"endfunction
"
"function! s:NextWindowOrTab()
"  if tabpagenr('$') == 1 && winnr('$') == 1
"    call s:split_nicely()
"  elseif winnr() < winnr("$")
"    wincmd w
"  else
"    tabnext
"    1wincmd w
"  endif
"endfunction
"
"function! s:PreviousWindowOrTab()
"  if winnr() > 1
"    wincmd W
"  else
"    tabprevious
"    execute winnr("$") . "wincmd w"
"  endif
"endfunction
"
"" Split nicely."{{{
"command! SplitNicely call s:split_nicely()
"function! s:split_nicely()
"  " Split nicely.
"  if winwidth(0) > 2 * &winwidth
"    vsplit
"  else
"    split
"  endif
"  wincmd p
"endfunction
""}}}
"" Delete current buffer."{{{
"" Force delete current buffer.
"nnoremap <silent> [Window]D  :<C-u>call <SID>CustomBufferDelete(1)<CR>
"function! s:CustomBufferDelete(is_force)
"  let current = bufnr('%')
"
"  call s:alternate_buffer()
"
"  if a:is_force
"    silent! execute 'bdelete! ' . current
"  else
"    silent! execute 'bdelete ' . current
"  endif
"endfunction
""}}}
"function! s:alternate_buffer() "{{{
"  let listed_buffer_len = len(filter(range(1, bufnr('$')),
"        \ 's:buflisted(v:val) && getbufvar(v:val, "&filetype") !=# "unite"'))
"  if listed_buffer_len <= 1
"    enew
"    return
"  endif
"
"  let cnt = 0
"  let pos = 1
"  let current = 0
"  while pos <= bufnr('$')
"    if s:buflisted(pos)
"      if pos == bufnr('%')
"        let current = cnt
"      endif
"
"      let cnt += 1
"    endif
"
"    let pos += 1
"  endwhile
"
"  if current > cnt / 2
"    bprevious
"  else
"    bnext
"  endif
"endfunction"}}}
"function! s:buflisted(bufnr) "{{{
"  return exists('t:unite_buffer_dictionary') ?
"        \ has_key(t:unite_buffer_dictionary, a:bufnr) && buflisted(a:bufnr) :
"        \ buflisted(a:bufnr)
"endfunction"}}}
"
"" JunkFile
"" nnoremap <silent> [Window]e  :<C-u>JunkfileOpen<CR>
"nnoremap <silent> [Window]e  :<C-u>Unite junkfile/new junkfile -start-insert<CR>
"command! -nargs=0 JunkfileDiary call junkfile#open_immediately(
"      \ strftime('%Y-%m-%d.md'))
""}}}
"
"" e: Change basic commands "{{{
"" The prefix key.
"nnoremap [Alt]   <Nop>
"xnoremap [Alt]   <Nop>
"onoremap [Alt]   <Nop>
"nmap    e  [Alt]
"xmap    e  [Alt]
"omap    e  [Alt]
"
"nnoremap    [Alt]e   e
"xnoremap    [Alt]e   e
"
"" Indent paste.
"nnoremap <silent> [Alt]p o<Esc>pm``[=`]``^
"xnoremap <silent> [Alt]p o<Esc>pm``[=`]``^
"nnoremap <silent> [Alt]P O<Esc>Pm``[=`]``^
"xnoremap <silent> [Alt]P O<Esc>Pm``[=`]``^
"" Insert blank line.
"nnoremap <silent> [Alt]o o<Space><BS><ESC>
"nnoremap <silent> [Alt]O O<Space><BS><ESC>
"" Yank to end line.
"nnoremap [Alt]y y$
"nnoremap Y y$
"nnoremap x "_x
"
"" Useless commands
"nnoremap [Alt];  ;
"nnoremap [Alt],  ,
""}}}
"
"" Disable Ex-mode.
"nnoremap Q  q
"
"" q: Quickfix  "{{{
"" The prefix key.
"nnoremap [Quickfix]   <Nop>
"
"" Toggle quickfix window.
"nnoremap <silent> [Quickfix]<Space>
"      \ :<C-u>call <SID>toggle_quickfix_window()<CR>
"function! s:toggle_quickfix_window()
"  let _ = winnr('$')
"  cclose
"  if _ == winnr('$')
"    copen
"    setlocal nowrap
"    setlocal whichwrap=b,s
"  endif
"endfunction
""}}}
"
"" Jump mark can restore column."{{{
"nnoremap \  `
"" Useless command.
"nnoremap M  m
""}}}
"
"" Smart <C-f>, <C-b>.
"nnoremap <silent> <C-f> <C-f>
"nnoremap <silent> <C-b> <C-b>

" Disable ZZ.
nnoremap ZZ  <Nop>

"" Like gv, but select the last changed text.
"" nnoremap gc  `[v`]
"" Specify the last changed text as {motion}.
"" vnoremap <silent> gc  :<C-u>normal gc<CR>
"" onoremap <silent> gc  :<C-u>normal gc<CR>
"
"" Auto escape / and ? in search command.
"cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
"
"" Smart }."{{{
"nnoremap <silent> } :<C-u>call ForwardParagraph()<CR>
"onoremap <silent> } :<C-u>call ForwardParagraph()<CR>
"xnoremap <silent> } <Esc>:<C-u>call ForwardParagraph()<CR>mzgv`z
"function! ForwardParagraph()
"  let cnt = v:count ? v:count : 1
"  let i = 0
"  while i < cnt
"    if !search('^\s*\n.*\S','W')
"      normal! G$
"      return
"    endif
"    let i = i + 1
"  endwhile
"endfunction
""}}}
"
"" Smart home and smart end."{{{
"nnoremap <silent> gh  :<C-u>call SmartHome('n')<CR>
"nnoremap <silent> gl  :<C-u>call SmartEnd('n')<CR>
"xnoremap <silent> gh  <ESC>:<C-u>call SmartHome('v')<CR>
"xnoremap <silent> gl  <ESC>:<C-u>call SmartEnd('v')<CR>
"" Smart home function"{{{
"function! SmartHome(mode)
"  let curcol = col('.')
"
"  if &wrap
"    normal! g^
"  else
"    normal! ^
"  endif
"  if col('.') == curcol
"    if &wrap
"      normal! g0
"    else
"      normal! 0
"    endif
"  endif
"
"  if a:mode == "v"
"    normal! msgv`s
"  endif
"
"  return ""
"endfunction"}}}
"
"" Smart end function"{{{
"function! SmartEnd(mode)
"  let curcol = col('.')
"  let lastcol = a:mode ==# 'i' ? col('$') : col('$') - 1
"
"  " Gravitate towards ending for wrapped lines
"  if curcol < lastcol - 1
"    call cursor(0, curcol + 1)
"  endif
"
"  if curcol < lastcol
"    if &wrap
"      normal! g$
"    else
"      normal! $
"    endif
"  else
"    normal! g_
"  endif
"
"  " Correct edit mode cursor position, put after current character
"  if a:mode == "i"
"    call cursor(0, col(".") + 1)
"  endif
"
"  if a:mode == "v"
"    normal! msgv`s
"  endif
"
"  return ""
"endfunction "}}}
""}}}
"
"" Jump to a line and the line of before and after of the same indent."{{{
"" Useful for Python.
"nnoremap <silent> g{ :<C-u>call search('^' .
"      \ matchstr(getline(line('.') + 1), '\(\s*\)') .'\S', 'b')<CR>^
"nnoremap <silent> g} :<C-u>call search('^' .
"      \ matchstr(getline(line('.')), '\(\s*\)') .'\S')<CR>^
""}}}
"
"" Select rectangle.
"xnoremap r <C-v>
"" Select until end of current line in visual mode.
"xnoremap v $h
"
"" Paste next line.
"nnoremap <silent> gp o<ESC>p^
"nnoremap <silent> gP O<ESC>P^
"xnoremap <silent> gp o<ESC>p^
"xnoremap <silent> gP O<ESC>P^
"
"" Redraw.
"nnoremap <silent> <C-l>    :<C-u>redraw!<CR>
"
"" Folding."{{{
"" If press h on head, fold close.
""nnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zc' : 'h'
"" If press l on fold, fold open.
"nnoremap <expr> l foldclosed(line('.')) != -1 ? 'zo0' : 'l'
"" If press h on head, range fold close.
""xnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zcgv' : 'h'
"" If press l on fold, range fold open.
"xnoremap <expr> l foldclosed(line('.')) != -1 ? 'zogv0' : 'l'
"noremap [Space]j zj
"noremap [Space]k zk
"noremap [Space]h zc
"noremap [Space]l zo
"noremap [Space]a za
"noremap [Space]m zM
"noremap [Space]i zMzv
"noremap [Space]rr zR
"noremap [Space]f zf
"noremap [Space]d zd
"noremap [Space]u :<C-u>Unite outline:foldings<CR>
"noremap [Space]gg :<C-u>echo FoldCCnavi()<CR>
""}}}
"
"" Substitute.
"xnoremap s :s//g<Left><Left>
"
"" Sticky shift in English keyboard."{{{
"" Sticky key.
"inoremap <expr> ;  <SID>sticky_func()
"cnoremap <expr> ;  <SID>sticky_func()
"snoremap <expr> ;  <SID>sticky_func()
"
"function! s:sticky_func()
"  let sticky_table = {
"        \',' : '<', '.' : '>', '/' : '?',
"        \'1' : '!', '2' : '@', '3' : '#', '4' : '$', '5' : '%',
"        \'6' : '^', '7' : '&', '8' : '*', '9' : '(', '0' : ')', '-' : '_', '=' : '+',
"        \';' : ':', '[' : '{', ']' : '}', '`' : '~', "'" : "\"", '\' : '|',
"        \}
"  let special_table = {
"        \"\<ESC>" : "\<ESC>", "\<Space>" : ';', "\<CR>" : ";\<CR>"
"        \}
"
"  if mode() !~# '^c'
"    echo 'Input sticky key: '
"  endif
"  let char = ''
"
"  while char == ''
"    let char = nr2char(getchar())
"  endwhile
"
"  if char =~ '\l'
"    return toupper(char)
"  elseif has_key(sticky_table, char)
"    return sticky_table[char]
"  elseif has_key(special_table, char)
"    return special_table[char]
"  else
"    return ''
"  endif
"endfunction
""}}}
"
"" Easy escape."{{{
"inoremap jj           <ESC>
"" inoremap <expr> j       getline('.')[col('.') - 2] ==# 'j' ? "\<BS>\<ESC>" : 'j'
"cnoremap <expr> j       getcmdline()[getcmdpos()-2] ==# 'j' ? "\<BS>\<C-c>" : 'j'
"onoremap jj           <ESC>
"
"inoremap j<Space>     j
"onoremap j<Space>     j
""}}}
"
"" Execute countable 'n.'.
"" EXAMPLE: 3@n
"let @n='n.'
"
"" a>, i], etc... "{{{
"" <angle>
"onoremap aa  a>
"xnoremap aa  a>
"onoremap ia  i>
"xnoremap ia  i>
"
"" [rectangle]
"onoremap ar  a]
"xnoremap ar  a]
"onoremap ir  i]
"xnoremap ir  i]
"
"" 'quote'
"onoremap aq  a'
"xnoremap aq  a'
"onoremap iq  i'
"xnoremap iq  i'
"
"" "double quote"
"onoremap ad  a"
"xnoremap ad  a"
"onoremap id  i"
"xnoremap id  i"
""}}}
"
"" Move to top/center/bottom.
"noremap <expr> zz (winline() == (winheight(0)+1)/ 2) ?
"      \ 'zt' : (winline() == 1)? 'zb' : 'zz'
"
"" Capitalize.
"nnoremap gu gUiw`]
"inoremap <C-q> <ESC>gUiw`]a
"
"" Clear highlight.
"nnoremap <ESC><ESC> :nohlsearch<CR>
"
"" operator-html-escape.vim
"nmap <Leader>h <Plug>(operator-html-escape)
"xmap <Leader>h <Plug>(operator-html-escape)
"
"" Easily macro.
"nnoremap @@ @a
""}}}
"
"" Improved increment.
"nmap <C-a> <SID>(increment)
"nmap <C-x> <SID>(decrement)
"nnoremap <silent> <SID>(increment)    :AddNumbers 1<CR>
"nnoremap <silent> <SID>(decrement)   :AddNumbers -1<CR>
"command! -range -nargs=1 AddNumbers
"      \ call s:add_numbers((<line2>-<line1>+1) * eval(<args>))
"function! s:add_numbers(num)
"  let prev_line = getline('.')[: col('.')-1]
"  let next_line = getline('.')[col('.') :]
"  let prev_num = matchstr(prev_line, '\d\+$')
"  if prev_num != ''
"    let next_num = matchstr(next_line, '^\d\+')
"    let new_line = prev_line[: -len(prev_num)-1] .
"          \ printf('%0'.len(prev_num . next_num).'d',
"          \    max([0, prev_num . next_num + a:num])) . next_line[len(next_num):]
"  else
"    let new_line = prev_line . substitute(next_line, '\d\+',
"          \ "\\=printf('%0'.len(submatch(0)).'d',
"          \         max([0, submatch(0) + a:num]))", '')
"  endif
"
"  if getline('.') !=# new_line
"    call setline('.', new_line)
"  endif
"endfunction
"
"" Syntax check.
"nnoremap <silent> [Window]y
"      \ :<C-u>echo map(synstack(line('.'), col('.')),
"      \     'synIDattr(v:val, "name")')<CR>
"
"" Open github URI.
"call operator#user#define('open-neobundlepath', 'OpenNeoBundlePath')
"nmap gz <Plug>(operator-open-neobundlepath)
"xmap gz <Plug>(operator-open-neobundlepath)
"function! OpenNeoBundlePath(motion_wise) "{{{
"  if line("'[") != line("']")
"    return
"  endif
"  let start = col("'[") - 1
"  let end = col("']")
"  let sel = strpart(getline('.'), start, end - start)
"  let sel = substitute(sel,
"        \'^\%(github\|gh\|git@github\.com\):\(.\+\)',
"        \ 'https://github.com/\1', '')
"  let sel = substitute(sel,
"        \'^\%(bitbucket\|bb\):\(.\+\)', 'https://bitbucket.org/\1', '')
"  let sel = substitute(sel,
"        \'^gist:\(.\+\)', 'https://gist.github.com/\1', '')
"  let sel = substitute(sel,
"        \'^git://', 'https://', '')
"  if sel =~ '^https\?://'
"    call openbrowser#open(sel)
"  elseif sel =~ '/'
"    call openbrowser#open('https://github.com/'.sel)
"  else
"    call openbrowser#open('https://github.com/vim-scripts/'.sel)
"  endif
"endfunction "}}}
"
"" Search.
"nnoremap ;n  ;
"nnoremap ;m  ,
"
"nnoremap <silent> q :<C-u>call <sid>smart_close()<CR>

" Toggle options. "{{{
function! ToggleOption(option_name)
  execute 'setlocal' a:option_name.'!'
  execute 'setlocal' a:option_name.'?'
endfunction  "}}}
" Toggle variables. "{{{
function! ToggleVariable(variable_name)
  if eval(a:variable_name)
    execute 'let' a:variable_name.' = 0'
  else
    execute 'let' a:variable_name.' = 1'
  endif
  echo printf('%s = %s', a:variable_name, eval(a:variable_name))
endfunction  "}}}
