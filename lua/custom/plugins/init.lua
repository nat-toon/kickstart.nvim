return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'
    dashboard.section.header.val = {
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
    }
    vim.api.nvim_create_autocmd('User', {
      pattern = 'LazyVimStarted',
      desc = 'Add Alpha dashboard footer',
      once = true,
      callback = function()
        local stats = require('lazy').stats()
        local datetime = os.date ' %d-%m-%Y   %H:%M:%S' -- 24 chars
        local datetime_len = string.len(datetime)
        local nvimsettings = ' '
          .. stats.count
          .. ' plugins'
          .. '    v'
          .. vim.version().major
          .. '.'
          .. vim.version().minor
          .. '.'
          .. vim.version().patch
        local nvimsettings_len = string.len(nvimsettings)
        local len = math.max(datetime_len, nvimsettings_len)
        local additional_text = 'Hello'
        dashboard.section.footer.val = {
          string.format(string.format('%%%ds', (len + datetime_len) / 2), datetime),
          string.format(string.format('%%%ds', (len + nvimsettings_len) / 2), nvimsettings),
          ' ',
          string.format(string.format('%%%ds', (len + string.len(additional_text)) / 2), additional_text),
        }
        dashboard.section.footer.opts.position = 'center'
        dashboard.section.footer.opts.hl = '@text'
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
    dashboard.section.buttons.val = {
      dashboard.button('e', '   New file', ':ene <BAR> startinsert <CR>'),
      dashboard.button('f', '   Find file', ':Telescope find_files<CR>'),
      dashboard.button('w', '󰱼   Find word', ':Telescope live_grep<CR>'),
      dashboard.button('c', '   Config', ':e $MYVIMRC <CR>'),
      dashboard.button('r', '󰈚   Restore Session', ':SessionRestore<CR>'),
      dashboard.button('q', '   Quit NVIM', ':qa<CR>'),
    }
    alpha.setup(dashboard.opts)
  end,
}
