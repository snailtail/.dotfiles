-- Grundläggande inställningar (rekommenderas alltid)
vim.opt.number = true          -- radnummer
vim.opt.relativenumber = true  -- relativa radnummer
vim.opt.termguicolors = true   -- true color support
vim.opt.clipboard = 'unnamedplus'  -- systemklippbord

vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Color scheme gruvbox (klassiker med bra treesitter-stöd)
vim.pack.add({
    {src = "https://github.com/ellisonleao/gruvbox.nvim"},
})

vim.cmd("colorscheme gruvbox")              -- default dark
