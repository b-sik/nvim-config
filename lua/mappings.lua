vim.api.nvim_set_keymap('n', '<leader>t', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

--change colorscheme
local colorschemes = {'kanagawa-dragon', 'kanagawa-wave', 'kanagawa-lotus'}
local colorschemes_idx = vim.fn.index(
    colorschemes,
    vim.api.nvim_cmd({ cmd = "colorscheme" }, { output = true })
)

local function change_colorscheme(forward)
    if forward then
        colorschemes_idx = colorschemes_idx + 1
    else
        colorschemes_idx = colorschemes_idx - 1
    end

    if colorschemes_idx > #colorschemes then
        colorschemes_idx = 1
    elseif colorschemes_idx < 1 then
        colorschemes_idx = #colorschemes
    end

    local ok = pcall(function()
        vim.cmd("colorscheme " .. colorschemes[colorschemes_idx])
    end)

    if not ok then
        change_colorscheme(forward)
    end

    print(colorschemes[colorschemes_idx])
end

vim.keymap.set("n", "<C-h>", function()
    change_colorscheme(true)
end)

vim.keymap.set("n", "<C-l>", function()
    change_colorscheme(false)
end)

--barbar
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<C-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<C-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<C-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<C->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<C-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<C-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<C-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<C-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<C-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<C-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<C-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<C-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<C-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<C-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<C-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<C-c>', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-P>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used
