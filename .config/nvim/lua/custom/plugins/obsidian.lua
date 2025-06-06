local obs_opts = {
  workspaces = {
    {
      name = 'personal',
      path = '~/personal/notes',
      overrides = {
        notes_subdir = 'notes',
      },
    },
    -- {
    --   name = 'work',
    --   path = '~/work/notes',
    --   overrides = {
    --     notes_subdir = 'notes',
    --   },
    -- },
  },
  daily_notes = {
    folder = 'dailies',
    date_format = '%Y-%m-%d',
    default_tags = { 'daily-notes' },
    -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
    template = nil,
  },
  mappings = {
    ['gf'] = {
      action = function()
        return require('obsidian').util.gf_passthrough()
      end,
      opts = { noremap = false, expr = true, buffer = true },
    },
    ['<leader>ch'] = {
      action = function()
        return require('obsidian').util.toggle_checkbox()
      end,
      opts = { buffer = true },
    },
    ['<cr>'] = {
      action = function()
        return require('obsidian').util.smart_action()
      end,
      opts = { buffer = true, expr = true },
    },
  },

  picker = {
    name = 'telescope.nvim',
    note_mappings = {
      new = '<leader>on',
      insert_link = '<leader>ol',
    },
  },
  ui = {
    checkboxes = {
      [' '] = { char = '󰄱', hl_group = 'ObsidianTodo' },
      ['x'] = { char = '', hl_group = 'ObsidianDone' },
      ['>'] = { char = '', hl_group = 'ObsidianRightArrow' },
      ['~'] = { char = '󰰱', hl_group = 'ObsidianTilde' },
      ['!'] = { char = '', hl_group = 'ObsidianImportant' },
    },
  },
}
return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',
  },
  opts = {},
  config = function()
    require('obsidian').setup(obs_opts)
    vim.keymap.set('n', '<leader>oo', '<cmd>ObsidianToday<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>oy', '<cmd>ObsidianYesterday<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>ot', '<cmd>ObsidianTomorrow<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>ow', '<cmd>ObsidianQuickSwitch<CR>', { noremap = true, silent = true })
  end,
}
