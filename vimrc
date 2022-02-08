" .vimrc
set encoding=utf-8

" load up pathogen and all bundles
call pathogen#infect()
call pathogen#helptags()

syntax enable                     " show syntax highlighting
filetype plugin indent on
filetype plugin on
set autoindent                    " set auto indent
set autoread                      " Auto-reload buffers when file changed on disk
set ts=2                          " set indent to 2 spaces
set showcmd                       " show normal mode commands as I type them
set noshowmode                    " Get rid of default mode indicator
set t_Co=256                      " Explicitly tell vim that the terminal supports 256 colors
set showcmd                       " display incomplete commands
set shiftwidth=2
set expandtab                     " use spaces, not tab characters
set nocompatible                  " don't need to be compatible with old vim
set relativenumber                " show relative line numbers
set showmatch                     " show bracket matches
set ignorecase                    " ignore case in search
set hlsearch                      " highlight all search matches
set cursorline                    " highlight current line
set smartcase                     " pay attention to case when caps are used
set incsearch                     " show search results as I type
set mouse=a                       " enable mouse support
set timeoutlen=200                " decrease timeout for faster insert with 'O'
set vb                            " enable visual bell (disable audio bell)
set ruler                         " show row and column in footer
set scrolloff=2                   " minimum lines above/below cursor
set laststatus=2                  " always show status bar
set list listchars=tab:»·,trail:· " show extra space characters
set nofoldenable
set clipboard=unnamed             " use the system clipboard
set wildmenu                      " enable bash style tab completion
set wildmode=list:longest,full
set nobackup
set nowritebackup
set noswapfile
set foldmethod=syntax
runtime macros/matchit.vim        " use % to jump between start/end of methods

" put git status, column/row number, total lines, and percentage in status
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]

" set dark background and color scheme
set background=dark
colorscheme jellybeans

" fire up NERDTree when loading VIM
" autocmd vimenter * NERDTree

" set up some custom colors
highlight clear SignColumn
highlight VertSplit    ctermbg=236
highlight ColorColumn  ctermbg=237
highlight LineNr       ctermbg=236 ctermfg=240
highlight CursorLineNr ctermbg=236 ctermfg=240
highlight CursorLine   ctermbg=236
highlight StatusLineNC ctermbg=238 ctermfg=0
highlight StatusLine   ctermbg=240 ctermfg=12
highlight IncSearch    ctermbg=3   ctermfg=1
highlight Search       ctermbg=1   ctermfg=3
highlight Visual       ctermbg=3   ctermfg=0
highlight Pmenu        ctermbg=240 ctermfg=12
highlight PmenuSel     ctermbg=3   ctermfg=1
highlight SpellBad     ctermbg=0   ctermfg=1

" highlight the status bar when in insert mode
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
  au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
endif

" highlight trailing spaces in annoying red
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"" Whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()  " strip trailing whitespace on save
set nowrap                        " don't wrap lines
set tabstop=2 shiftwidth=2        " a tab is two spaces (or set this to 4)
set expandtab                     " use spaces, not tabs (optional)
set backspace=indent,eol,start    " backspace through everything in insert mode

" Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

" airline
let g:airline#extensions#tabline#enabled = 1

" sets explorer mode to look more like NerdTree
let g:netrw_liststyle=3

" set leader key to comma
let mapleader = ","

" filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

" allow bash aliases in vim default shell
let $BASH_ENV = "~/.bash_aliases"

"Vim rails shortcuts
map <Leader>vu :RVunittest<CR>
map <Leader>vm :RVmodel<CR>
map <Leader>vv :RVview<CR>
map <Leader>vc :RVcontroller<CR>
map <Leader>m :Rmodel<CR>
map <Leader>c :Rcontroller<CR>

map <Leader>z za<CR>

"" Surround.vim shortcuts
map <Leader>s yss
map <Leader>hd yss<div>
map <Leader>h1 yss<h1>
map <Leader>h2 yss<h2>
map <Leader>hp yss<p>
map <Leader>hu yss<ul>
map <Leader>ho yss<ol>
map <Leader>hl yss<li>

"" Convenience
nmap <Leader>p orequire "pry"<CR>binding.pry<ESC>;       " pry insertion
nmap <Leader>so osave_and_open_page<ESC>;                " insert launchy gem save and open page on line below
vnoremap . :norm.<CR>;                                   " in visual mode, "." will for each line, go into normal mode and execute the "."
map <C-S> <ESC>:w!<CR>;                                  " remap save
imap <C-S> <ESC>:w!<CR>
map <C-Q> :q<CR>

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" replaces %/ with current directory, and %% with current file
cmap %/ <C-R>=expand("%:p:h")."/"<CR>;
cmap %% <C-R>=expand("%")<CR>;

" ctrlp config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_height = 20
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0

" use silver searcher for ctrlp
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" Vim RSPEC keybindings
map <Leader>rc :call RunCurrentSpecFile()<CR>
map <Leader>ns :call RunNearestSpec()<CR>
map <Leader>ls :call RunLastSpec()<CR>
map <Leader>as :call RunAllSpecs()<CR>

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" ctrl n toggles nerd tree
map <C-t> :NERDTreeToggle<CR>

"" filetypes
au  BufRead,BufNewFile *.elm setfiletype haskell

" unmap ex mode: 'Type visual to go into Normal mode.'
nnoremap Q <nop>

map <leader>a :Ag!<space>
map <Leader>m :!open -a Marked %<cr><cr>
map <Leader>gb :Gblame<cr>
map <Leader>gl :!clear && git log -p %<cr>
map <Leader>gd :!clear && git diff %<cr>
map <Leader>gc :!git checkout
map <Leader>gcm :!git commit -m
map <Leader>gs :!git status<cr>
map <Leader>gh :!git hist<cr>
map <leader>ga :!git add
map <Leader>i mmgg=G`m<cr>
map <Leader>sc :sp db/schema.rb<cr>

" clear the command line and search highlighting
noremap <c-c> :nohlsearch<CR>

" toggle spell check with <F5>
map <F5> :setlocal spell! spelllang=en_us<cr>
imap <F5> <ESC>:setlocal spell! spelllang=en_us<cr>

" add :Plain command for converting text to plaintext
command! Plain execute "%s/’/'/ge | %s/[“”]/\"/ge | %s/—/-/ge"

" hint to keep lines short
if exists('+colorcolumn')
  set colorcolumn=80
endif

" jump to last position in file
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" multi-purpose tab key (auto-complete)
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" rename current file
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>

function! RunTests(filename)
  " Write the file and run tests for the given filename
  :w
  :silent !clear
  if match(a:filename, '\.feature$') != -1
    exec ":!bundle exec cucumber " . a:filename
  elseif match(a:filename, '_test\.rb$') != -1
    if filereadable("bin/testrb")
      exec ":!bin/testrb " . a:filename
    else
      exec ":!ruby -Itest " . a:filename
    end
  else
    if filereadable("Gemfile")
      exec ":!bundle exec rspec --color " . a:filename
    else
      exec ":!rspec --color " . a:filename
    end
  end
endfunction

function! SetTestFile()
  " set the spec file that tests will be run for.
  let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  " run the tests for the previously-marked file.
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFile()
  elseif !exists("t:grb_test_file")
    return
  end
  call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number . " -b")
endfunction

function! CorrectTestRunner()
  if match(expand('%%'), '\.feature$') != -1
    return "cucumber"
  elseif match(expand('%%'), '_spec\.rb$') != -1
    return "rspec"
  endif
endfunction

function! RunCurrentLineInTest()
  execute "!" . CorrectTestRunner() expand('%%:p') . ":" . line(".")
endfunction

" run test runner
map <leader>t :call RunTestFile()<cr>
map <leader>nt :call RunNearestTest()<cr>
map <leader>st :call RunCurrentLineInTest()<cr>
