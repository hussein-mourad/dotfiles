local opt = vim.opt
opt.relativenumber = true
opt.number = true
opt.hlsearch = false
opt.incsearch = true
-- opt.scrolloff = 8
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.colorcolumn = "80"
