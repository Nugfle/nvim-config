return {
    "catppuccin/nvim",
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    opts = {
        flavour = "mocha",
        term_colors = false,
        transparent_background = true,
    },
    config = function(_, opts)
        require 'catppuccin'.setup(opts)
        vim.cmd.colorscheme 'catppuccin'
    end
}
