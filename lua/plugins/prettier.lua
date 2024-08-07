return  {
    {
        'jose-elias-alvarez/null-ls.nvim',
        opts = {
          on_attach = function(client, bufnr)
            if client.supports_method("textDocument/formatting") then
              vim.keymap.set("n", "<Leader>f", function()
                vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
              end, { buffer = bufnr, desc = "[lsp] format" })

              -- format on save
              vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
              vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                group = group,
                callback = function()
                  vim.lsp.buf.format({ bufnr = bufnr, async = "BufWritePre" ==  "BufWritePost"})
                end,
                desc = "[lsp] format on save",
              })
            end

            if client.supports_method("textDocument/rangeFormatting") then
              vim.keymap.set("x", "<Leader>f", function()
                vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
              end, { buffer = bufnr, desc = "[lsp] format" })
            end
          end,
        }
    },
    {
        'MunifTanjim/prettier.nvim',
        opts = {
          bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
          filetypes = {
            "css",
            "graphql",
            "html",
            "javascript",
            "javascriptreact",
            "json",
            "less",
            "markdown",
            "scss",
            "typescript",
            "typescriptreact",
            "yaml",
          },
        },
    },
}
