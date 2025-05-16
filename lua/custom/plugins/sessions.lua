return {
  'rmagatti/auto-session',
  config = function()
    require('auto-session').setup {
      log_level = vim.log.levels.ERROR,
      auto_session_suppress_dirs = { '~/' },
      auto_restore_enabled = false,
      auto_session_enabled = true,
      bypass_session_save_file_types = {
        'alpha',
      },
      auto_session_enable_last_session = false,
      post_restore_cmds = { 'Neotree filesystem reveal left' },
      session_lens = {
        buftypes_to_ignore = {},
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = false,
      },
    }

    -- Set mapping for searching a session.
    -- ⚠️ This will only work if Telescope.nvim is installed
    vim.keymap.set('n', '<C-s>', require('auto-session.session-lens').search_session, {
      noremap = true,
    })
    vim.opt.sessionoptions = 'buffers,curdir,folds,help,winsize,winpos,tabpages,terminal'
  end,
}
