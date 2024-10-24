return {
    {
       "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
          ensure_installed = {'html', 'templ'},
          auto_install = true,
          highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
          },
        }
    }
}
