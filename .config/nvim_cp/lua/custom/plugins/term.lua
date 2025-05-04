local term = {
  'akinsho/toggleterm.nvim',
  config = function()
    require('toggleterm').setup {
      direction = 'float', -- Set to open in a floating terminal
      float_opts = {
        border = 'curved', -- Optional: Customize the border
      },
    }
    local opts = { noremap = true }
    function set_terminal_keymaps()
      vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
    end
    vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'

    local Terminal = require('toggleterm.terminal').Terminal
    local chat = Terminal:new { cmd = 'cd ~/code/streems && go run main.go -auth true', hidden = true }
    function _CHAT_TOGGLE()
      chat:toggle()
    end
    vim.keymap.set('n', '<leader>tt', '<cmd>lua _CHAT_TOGGLE()<CR>', { desc = 'Toggle Chat' })
  end,
}
return term
