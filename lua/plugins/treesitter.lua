return {
    {
       "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            'vrischmann/tree-sitter-templ',
        },
        opts = {
          auto_install = true,
          highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
          },
        }
    }
}
