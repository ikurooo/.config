return {
    'hrsh7th/nvim-cmp',
    version = false,
    dependencies = {
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
        local cmp = require('cmp') 
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end
            },
            window = {
                completion = cmp.config.window.bordered({}),
                documentation = cmp.config.window.bordered({}),
            },
            mapping = {
                ['<Esc>'] = require('cmp').mapping.abort(),
                ['<CR>'] = require('cmp').mapping.confirm(),
                ['<Down>'] = require('cmp').mapping.select_next_item(),
                ['<Up>'] = require('cmp').mapping.select_prev_item(),
            },
            sources = {
                { name = 'nvim_lsp', max_item_count = 10 },
                { name = 'buffer', max_item_count = 5 },
            }
        })
    end
}
