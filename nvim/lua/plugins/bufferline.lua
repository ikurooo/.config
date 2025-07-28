local opts = {
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center", -- or "left", "right"
        separator = false,
        padding = 0,
      },
    },
    separator_style = "thick", -- or "thick", "padded_slant", "slope"
    show_buffer_close_icons = false,
    show_close_icon = false,
    max_name_length = 18,
    tab_size = 25,
    show_buffer_close_icons = true, -- enables close icons on each tab
    show_close_icon = true,         -- enables the global close icon on the right
    close_icon = '',               -- you can customize this (needs Nerd Font)
    buffer_close_icon = '',        -- icon for individual tabs (default Nerd Font)
  },
  highlights = {
    fill = {
      fg = "#bbbbbb",
      bg = "#1e1e2e",
    },
    buffer_selected = {
      fg = "#ffffff",
      bg = "#2e2e3e",
      bold = true,
      italic = false,
    },
    tab = {
      bg = "#222222",
    },
    tab_selected = {
      bg = "#2e2e3e",
    },
  }
}


return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        vim.opt.termguicolors = true,
        require("bufferline").setup(opts)
    end
}
