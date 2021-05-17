call plug#begin('~/.vim/plugged')

Plug 'drewtempelmeyer/palenight.vim'
" Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'
" Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdcommenter'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'frazrepo/vim-rainbow'
" Plug 'Lokaltog/vim-easymotion'
Plug 'liuchengxu/vista.vim'

call plug#end()

let mapleader="\<space>"

" +================ palenight.nvim =================+ "

set nolazyredraw
set background=dark
colorscheme palenight
let g:lightline = { 'colorscheme': 'palenight' }
set number
set shiftwidth=4
set tabstop=4
set softtabstop=4
set t_Co=256
set synmaxcol=128
syntax sync minlines=256

" +================ coc.nvim =================+ "

set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

" set statusline^=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}%{coc#status()}%{get(b:,'coc_current_function','')}
"
let g:coc_global_extensions = [
	\ 'coc-css',
	\ 'coc-diagnostic',
	\ 'coc-eslint',
	\ 'coc-explorer',
	\ 'coc-flutter-tools',
	\ 'coc-gitignore',
	\ 'coc-html',
	\ 'coc-json',
	\ 'coc-lists',
	\ 'coc-prettier',
	\ 'coc-prisma',
	\ 'coc-pyright',
	\ 'coc-python',
	\ 'coc-snippets',
	\ 'coc-sourcekit',
	\ 'coc-stylelint',
	\ 'coc-syntax',
	\ 'coc-tasks',
	\ 'coc-translator',
	\ 'coc-tslint-plugin',
	\ 'coc-tsserver',
	\ 'coc-vetur',
	\ 'coc-vimlsp',
	\ 'coc-yaml']

autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gy <Plug>(coc-references)

inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

command! -nargs=? Fold :call     CocAction('fold', <f-args>)

nnoremap <silent><nowait> <leader>a :<C-u>CocList diagnostics<cr>

" +================ fzf.nvim =================+ "

command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
let g:fzf_layout = { 'down': '~40%' }
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-f> :Rg<CR>
nnoremap <silent> <leader>' :Buffers<CR>

" +================ fzf.nvim =================+ "

let g:lightline = {
          \ 'colorscheme': 'default',
          \ 'active': {
          \   'left': [ [ 'mode', 'paste' ],
          \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
          \ },
          \ 'component_function': {
          \   'cocstatus': 'coc#status'
          \ },
          \ }

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" +================ vim-rainbow.nvim =================+ "

let g:rainbow_active = 1

" let g:rainbow_load_separately = [
"     \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
"     \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
"     \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
"     \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
"     \ ]
" 
" let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

" +================ coc-explorer =================+ "

nmap <silent> <leader>e :CocCommand explorer<CR>

" +================ vim-devicons.nvim =================+ "

set encoding=UTF-8

" +================ nerdcommenter.nvim =================+ "

let g:NERDSpaceDelims = 1

" +================ vista.nvim =================+ "

let g:vista_default_executive = 'coc'
nmap <silent> <leader>t :Vista!!<CR>
nmap <silent> <leader>r :Vista focus<CR>
