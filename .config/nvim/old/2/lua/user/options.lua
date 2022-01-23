local options = {
	backup = false,                          -- creates a backup file
	clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
	cmdheight = 1,                           -- more space in the neovim command line for displaying messages
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 0,                        -- so that `` is visible in markdown files
	fileencoding = "utf-8",                  -- the encoding written to a file
	hlsearch = true,                         -- highlight all matches on previous search pattern
	ignorecase = true,                       -- ignore case in search patterns
	mouse = "a",                             -- allow the mouse to be used in neovim
	pumheight = 10,                          -- pop up menu height
	showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
	smartcase = true,                        -- smart case
	smartindent = true,                      -- make indenting smarter again
	splitbelow = true,                       -- force all horizontal splits to go below current window
	splitright = true,                       -- force all vertical splits to go to the right of current window
	swapfile = false,                        -- creates a swapfile
	timeoutlen = 1000,                        -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true,                         -- enable persistent undo
	updatetime = 300,                        -- faster completion (4000ms default)
	writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = false,                        -- convert tabs to spaces
	shiftwidth = 2,                          -- the number of spaces inserted for each indentation
	tabstop = 2,                             -- insert 2 spaces for a tab
	cursorline = true,                       -- highlight the current line
	number = true,                           -- set numbered lines
	relativenumber = false,                  -- set relative numbered lines
	scrolloff = 8,                           -- is one of my fav
	sidescrolloff = 8,
	signcolumn = "yes",
}

vim.cmd([[
	" Remove indent line from startify
	let g:indentLine_fileTypeExclude = ['startify']

	" Remove bottom bar
	set laststatus=0 

	" Make whole word go on new line if too much characters
	set wrap 
	set linebreak

	" F6 to get how many words
	nnoremap <F6> :!wc % -w<CR>

	" Run code with F5
	autocmd FileType javascript map <buffer> <leader>r :w<CR>:exec '!node' shellescape(@%, 1)<CR>
	autocmd FileType python map <buffer> <leader>r :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
	autocmd FileType ruby map <buffer> <leader>r :w<CR>:exec '!ruby' shellescape(@%, 1)<CR>
	autocmd FileType cpp map <buffer> <leader>r :w<CR>:!g++ % -o comp && ./comp<CR>
	autocmd FileType rust map <buffer> <leader>r :w<CR>:!cargo run<CR>

	" Makes so when you have a big line you can press j to go down even if it isn't seperate lines
	map j gj
	map k gk

	" Add special keys
	inoremap <F7>e è
	inoremap <F7>p é
	inoremap <F7>o ò
	inoremap <F7>u ù

	" Set right and down arrow keys to move between tabs
	nnoremap <Left> :BufferLineCyclePrev<CR>
	nnoremap <Right> :BufferLineCycleNext<CR>

	" Clear search when ESC is pressed
	nnoremap <ESC> :noh<CR>


	let g:sneak#label = 1
	let g:code_runner_save_before_execute = 1
]])

-- Vimwiki stuff
vim.g.vimwiki_list = {
	{
		path = '~/Gombiki/',
		syntax = 'markdown',
		ext = '.md',
	}
}


vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

