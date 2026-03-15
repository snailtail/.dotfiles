vim.opt.termguicolors = true

-- ============================================================================
-- OPTIONS
-- ============================================================================
vim.opt.number = true -- line number
vim.opt.relativenumber = true -- relative line numbers
vim.opt.cursorline = true -- highlight current line
vim.opt.wrap = false -- do not wrap lines by default
vim.opt.scrolloff = 10 -- keep 10 lines above/below cursor
vim.opt.sidescrolloff = 10 -- keep 10 lines to left/right of cursor

vim.opt.tabstop = 2 -- tabwidth
vim.opt.shiftwidth = 2 -- indent width
vim.opt.softtabstop = 2 -- soft tab stop not tabs on tab/backspace
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.smartindent = true -- smart auto-indent
vim.opt.autoindent = true -- copy indent from current line

vim.opt.ignorecase = true -- case insensitive search
vim.opt.smartcase = true -- case sensitive if uppercase in string
vim.opt.hlsearch = true -- highlight search matches
vim.opt.incsearch = true -- show matches as you type

vim.opt.signcolumn = "yes" -- always show a sign column
vim.opt.colorcolumn = "100" -- show a column at 100 position chars
vim.opt.showmatch = true -- highlights matching brackets

vim.opt.hidden = true -- allow hidden buffers
vim.opt.errorbells = false -- no error sounds

vim.opt.clipboard = "unnamedplus" -- Använd systemklippbordet
vim.opt.mouse = "a"               -- Musstöd (scroll, klicka etc.)

-- ============================================================================
-- KEYMAPS
-- ============================================================================
vim.g.mapleader = " " -- space for leader
vim.g.maplocalleader = " " -- space for localleader

-- Bättre split-fönster
vim.opt.splitbelow = true
vim.opt.splitright = true


vim.pack.add({
  { src = "https://github.com/folke/tokyonight.nvim" },

  { 
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  { 
    src = "https://github.com/nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
})

-- Ladda och konfigurera treesitter LAZY (efter att plugin laddats)
vim.api.nvim_create_autocmd("User", {
  pattern = "PackLoadPost",  -- triggas när vim.pack laddat plugins
  callback = function()
    -- Skydda mot att köras flera gånger
    if vim.g.loaded_treesitter_setup then return end
    vim.g.loaded_treesitter_setup = true

    local ok, configs = pcall(require, "nvim-treesitter.configs")
    if not ok then
      vim.notify("nvim-treesitter inte laddat än – försök igen eller kolla installation", vim.log.levels.WARN)
      return
    end

    configs.setup {
      ensure_installed = {
        "html", "javascript", "css", "php", "python", "c_sharp", "yaml", "json",
        "lua", "vim", "vimdoc", "markdown", "markdown_inline",
      },
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = { enable = true },
    }

    -- Extra: trigga TSUpdate om det behövs
    vim.cmd("TSUpdate")
  end,
  desc = "Setup nvim-treesitter efter vim.pack load",
})


require("tokyonight").setup({
  style = "night",                  -- Alternativ: "storm", "moon", "night", "day"
                                    -- "night" är mörk och clean, många favoriter
  transparent = false,              -- true = transparent bakgrund (bra i terminal)
  styles = {
    comments = { italic = true },   -- italic på kommentarer?
    keywords = { italic = true },
    functions = {},
    variables = {},
  },
  sidebars = { "qf", "help", "terminal" },  -- vilka fönster ska ha transparent bg
  on_colors = function(colors)
  end,
  on_highlights = function(hl, c)
  end,
})


-- Aktivera och konfigurera lualine
require("lualine").setup {
  options = {
    icons_enabled = true,                    -- Kräver nvim-web-devicons för symboler
    theme = "tokyonight",                    -- Använder ditt färgschema automatiskt
    component_separators = { left = "|", right = "|" },
    section_separators = { left = "", right = "" },  -- snygga pilar
    disabled_filetypes = { "NvimTree", "packer", "startify" },  -- dölj i vissa fönster
    always_divide_middle = true,
    globalstatus = true,                     -- en statusline för alla fönster (bättre i tmux/split)
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { "filename" },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {}
  },
  extensions = { "quickfix", "fugitive" }  -- extra stöd för vissa plugins
}

-- Aktivera schemat (efter setup!)
vim.cmd("colorscheme tokyonight-night")

