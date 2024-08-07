return {
    {
        'williamboman/mason.nvim',
        config = function()
            local lsp_zero = require("lsp-zero")
            require('mason').setup({})
            require('mason-lspconfig').setup({
                ensure_installed = {'tsserver', 'eslint', 'gopls', 'lua_ls'},
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require("lspconfig").lua_ls.setup(lua_opts)
                  end,
                }
            })
        end
    },
    {
        "hrsh7th/nvim-cmp",
    }
}
