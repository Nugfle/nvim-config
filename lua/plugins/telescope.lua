return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fd', builtin.lsp_definitions, {})
        vim.keymap.set('n', '<leader>fi', builtin.lsp_implementations, {})
        vim.keymap.set('n', '<leader>fu', builtin.lsp_references, {})
        vim.keymap.set('n', '<leader>fU', vim.lsp.buf.references, {})

        vim.keymap.set('n', '<leader>fi', function()
            require('telescope.builtin').lsp_implementations()
        end, { desc = 'Find implementations (Telescope)' })
    end,
}
