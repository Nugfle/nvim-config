vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', '<leader><leader>', vim.cmd.so)

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '>-1<CR>gv=gv")

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('x', '<leader>pp', "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set('n', '<leader>d', "\"_d")
vim.keymap.set('v', '<leader>d', "\"_d")

vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set('n', '<leader>k', function()
    local new_config = not vim.diagnostic.config().virtual_lines
    vim.diagnostic.config({ virtual_lines = new_config })
end, { desc = 'Toggle diagnostic virtual_lines' })

-- Function to jump to nth item in quickfix list
local function jump_to_qf_item(n)
    local qf_list = vim.fn.getqflist()

    if #qf_list == 0 then
        vim.notify("Quickfix list is empty", vim.log.levels.WARN)
        return
    end

    if n < 1 or n > #qf_list then
        vim.notify("Invalid quickfix item number: " .. n .. " (valid range: 1-" .. #qf_list .. ")", vim.log.levels.WARN)
        return
    end

    -- Jump to the nth item (1-indexed)
    vim.cmd("cc " .. n)
end

-- Keybindings for <leader>qn (where n is 0-9)
for i = 1, 9 do
    vim.keymap.set('n', '<leader>q' .. i, function()
        jump_to_qf_item(i)
    end, { desc = 'Jump to quickfix item ' .. i })
end
