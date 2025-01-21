-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

vim.keymap.set('n', '<leader>q', '<cmd>q<CR>', { desc = 'Quit', nowait = true, remap = false })
vim.keymap.set('n', '<leader>w', '<cmd>w!<CR>', { desc = 'Save', nowait = true, remap = false })

return {
  { 'christoomey/vim-tmux-navigator' }, -- done
  { 'nvzone/showkeys', cmd = 'ShowkeysToggle', config = { show_count = true } },
  { 'lervag/vimtex' },
  {
    'sindrets/diffview.nvim',
    config = function()
      vim.keymap.set('n', '<leader>gd', '<cmd>DiffviewOpen<CR>', { desc = '[G]it [D]iff' })
      vim.keymap.set('n', '<leader>gq', '<cmd>DiffviewClose<CR>', { desc = '[G]it Diff [Q]uit' })
    end,
  },
  {
    'kdheepak/lazygit.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<CR>', { desc = 'LazyGit' })
    end,
  },
  {
    'leoluz/nvim-dap-go',
    init = function()
      require('dap-go').setup()
      vim.keymap.set('n', '<leader>xg', function()
        require('dap-go').debug_test()
        require('dapui').toggle()
      end, { desc = 'Debug Go Test', nowait = true, remap = false })
    end,
  },
  {
    'folke/todo-comments.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require('todo-comments').setup {}
    end,
  },

  {
    'stevearc/oil.nvim',
    opts = {},
    config = function()
      require('oil').setup()
      vim.keymap.set('n', '<leader>e', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    end,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    'mgierada/lazydocker.nvim',
    dependencies = { 'akinsho/toggleterm.nvim' },
    config = function()
      require('lazydocker').setup {}
      vim.keymap.set('n', '<leader>gP', '<cmd>Lazydocker<CR>', { desc = 'LazyDocker' })
    end,
  },
  {
    'OXY2DEV/markview.nvim',
    lazy = false, -- Recommended
    ft = 'markdown', -- If you decide to lazy-load anyway

    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
  },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },
  -- {
  --   dir = '~/projects/curly.nvim',
  --   opts = {},
  -- },
  --
}
