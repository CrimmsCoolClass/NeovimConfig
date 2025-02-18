local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = function(_, _)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end
require 'nvim-treesitter.configs'.setup{
	highlight = {
		enable = true,
		additional_vim_regex_highlight = false,
	},
}

local cmp = require("cmp")
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-o>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
 snippet = {
    expand = function(args)
        require('luasnip').lsp_expand(args.body)
    end,
  }, 
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip'  },
  }, {
    { name = 'buffer' },
  }),
})
require("mason").setup()
require("mason-lspconfig").setup()

require("lspconfig").vhdl_ls.setup{
  capabilities = capabilities,
  on_attach = on_attach
}

require'lspconfig'.perlnavigator.setup{
    cmd ={ "perlnavigator" },
    capabilities = capabilities,
    on_attach = on_attach
}
require'lspconfig'.pyright.setup{
    capabilities = capabilities,
    on_attach = on_attach
}
require'lspconfig'.clangd.setup{
    capabilities = capabilities,
    on_attach = on_attach
}
require'toggleterm'.setup({
    size = 20,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "horizontal",
    close_on_exit = true,
    shell = vim.o.shell
})
