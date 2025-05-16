return {
  'github/copilot.vim',
  config = function()
    vim.keymap.set('i', '<CR>', 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false,
    })
  end,
}
