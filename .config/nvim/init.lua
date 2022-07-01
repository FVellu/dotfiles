require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Package manager
    use 'eddyekofo94/gruvbox-flat.nvim'
    use "lukas-reineke/indent-blankline.nvim"
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons',
        },
        tag = 'nightly'
    }
    use 'nvim-treesitter/nvim-treesitter'
    use 'tmsvg/pear-tree'
    use "jose-elias-alvarez/null-ls.nvim"
    use "jose-elias-alvarez/nvim-lsp-ts-utils"
    use 'nvim-lua/plenary.nvim'
    use { 'CRAG666/code_runner.nvim', requires = 'nvim-lua/plenary.nvim' }
    use 'onsails/lspkind.nvim'
    use {
      'romgrk/barbar.nvim',
      requires = {'kyazdani42/nvim-web-devicons', 'BurntSushi/ripgrep'}
    }
    use 'nvim-telescope/telescope.nvim'
    use 'evanleck/vim-svelte'
    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.startify'.config)
        end
    }
    use 'folke/which-key.nvim'
    use 'lewis6991/impatient.nvim'
    use 'edluffy/hologram.nvim'
    use 'terrortylor/nvim-comment'
    use 'mg979/vim-visual-multi'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'

    -- lsp
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
end)

-- General Settings
vim.cmd[[
	colorscheme gruvbox-flat
	set cot=menuone,noinsert,noselect shm+=c
	set expandtab
	set incsearch
	set linebreak
	set mouse=a
	set nobackup
	set noerrorbells
	set noswapfile
	set nu
	set shiftwidth=4
	set signcolumn=yes
	set smartcase
	set smartindent
	set tabstop=4
	set termguicolors
	set wrap
    set laststatus=0
    set scrolloff=6
	syntax on
    
    " C-hjkl to manage splits
    nnoremap <silent> <C-l> <c-w>l
    nnoremap <silent> <C-h> <c-w>h
    nnoremap <silent> <C-k> <c-w>k
    nnoremap <silent> <C-j> <c-w>j
]]

-- impatient.nvim
require('impatient')

-- Remap space as leader key
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Indentation line
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}

-- Neovim tree
require("nvim-tree").setup()
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
--vim.cmd[[autocmd VimEnter * NvimTreeFindFileToggle]]

-- Code Runner
require('code_runner').setup({
  -- put here the commands by filetype
  filetype = {
		java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
		python = "python3 -u",
		typescript = "deno run",
		rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
        cpp = "cd $dir && g++ $file -o output && ./output",
	},
})

-- Treesitter
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

-- which key
require("which-key").setup {
}

-- Start page
local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
   return
end
local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
   [[                           _ _       ]],    
   [[ _ __   ___  _____   _____| | |_   _ ]],          
   [[| '_ \ / _ \/ _ \ \ / / _ \ | | | | |]],           
   [[| | | |  __/ (_) \ V /  __/ | | |_| |]],           
   [[|_| |_|\___|\___/ \_/ \___|_|_|\____|]],           
 
} 
dashboard.section.buttons.val = { 
   dashboard.button("<C-P>", "  Find file", ":Telescope find_files <CR>"),
   dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
   dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
   dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
   dashboard.button("<CS-F>", "  Find text", ":Telescope live_grep <CR>"),
   dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
   dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}
local function footer()
    phrases = {
	"Write here phrases",
	"like this"
    }
    math.randomseed(os.time())
   return phrases[math.random(#phrases)]
end
dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"
dashboard.opts.opts.noautocmd = true
vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)

-- Comments
require('nvim_comment').setup()

-----------------------------------------------------------------------------
-- KEYMAPS
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<Leader>q", ":qa!<CR>")
map("n", "<Leader>cr", ":source %<CR>")
map("n", "<Leader>co", ":split ~/.config/nvim/init.lua<CR>")
map("n", "<Leader>r", ":RunCode<CR>")
map("n", "<Leader>tf", ":Telescope find_files<CR>")
map("n", "<Leader>tl", ":Telescope live_grep<CR>")
map("n", "<Leader>f", ":NvimTreeFindFileToggle<CR>")
map("n", "<Leader>/", ":CommentToggle<CR>")
map("v", "<Leader>/", ":CommentToggle<CR>")

map("n", "<Leader>lw", ":lua vim.lsp.buf.definition()<CR>")
map("n", "<Leader>li", ":lua vim.lsp.buf.hover()<CR>")

-----------------------------------------------------------------------------
------------------------------------ LSP ------------------------------------
-----------------------------------------------------------------------------
local lsp_installer = require("nvim-lsp-installer")
local cmp = require'cmp'
local lspkind = require('lspkind')

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol', -- show only symbol annotations
            maxwidth = 50,
        })
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'nvim_lsp_signature_help' },
    }, {
      { name = 'buffer' },
    })
})

cmp.setup.cmdline('/', {
mapping = cmp.mapping.preset.cmdline(),
sources = {
  { name = 'buffer' }
}
})

cmp.setup.cmdline(':', {
mapping = cmp.mapping.preset.cmdline(),
sources = cmp.config.sources({
  { name = 'path' }
}, {
  { name = 'cmdline' }
})
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lsp_installer.on_server_ready(function(server)
  local opts = {}
  server:setup(opts)
end)

local lspconfig = require("lspconfig")

lspconfig.tsserver.setup({
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        local ts_utils = require("nvim-lsp-ts-utils")
        ts_utils.setup({})
        ts_utils.setup_client(client)
        on_attach(client, bufnr)
    end,
})
-----------------------------------------------------------------------------
