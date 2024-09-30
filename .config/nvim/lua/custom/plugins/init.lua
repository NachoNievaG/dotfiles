-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  { 'christoomey/vim-tmux-navigator' },
  { 'lervag/vimtex' },
  { 'sindrets/diffview.nvim' },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup {}
    end,
  },
  {
    'kdheepak/lazygit.nvim',
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
  {
    'leoluz/nvim-dap-go',
    init = function()
      require('dap-go').setup()
    end,
  },
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = { 'tpope/vim-dadbod', 'kristijanhusak/vim-dadbod-completion', 'tpope/vim-dotenv' },
    config = function()
      local function db_completion()
        require('cmp').setup.buffer { sources = { { name = 'vim-dadbod-completion' } } }
      end
      vim.api.nvim_create_autocmd('FileType', {
        pattern = {
          'sql',
        },
        command = [[setlocal omnifunc=vim_dadbod_completion#omni]],
      })

      vim.api.nvim_create_autocmd('FileType', {
        pattern = {
          'sql',
          'mysql',
          'plsql',
        },
        callback = function()
          vim.schedule(db_completion)
        end,
      })
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
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    'mgierada/lazydocker.nvim',
    dependencies = { 'akinsho/toggleterm.nvim' },
    config = function()
      require('lazydocker').setup {}
    end,
  },
}
