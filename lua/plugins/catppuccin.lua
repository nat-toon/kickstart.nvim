return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      flavour = 'mocha',
      transparent_background = true,
      color_overrides = {
        mocha = {
          text = '#fbc1e6',
          overlay_1 = '#A565C9',
        },
      },
    }
    vim.cmd.colorscheme 'catppuccin'
  end,
}
