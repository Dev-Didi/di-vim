local lsp = require('lsp-zero')

lsp.preset('recommended')


lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    -- Replace the language servers listed here 
    -- with the ones you want to install
    ensure_installed = {'elixirls'},
    handlers = {
        lsp.default_setup,
    },
})
lsp.setup()


local cmp = require('cmp')

cmp.setup({
  mapping = cmp.mapping.preset.insert({
      ['<Tab>'] = cmp.mapping.confirm({select = true}),
  }),
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
})
