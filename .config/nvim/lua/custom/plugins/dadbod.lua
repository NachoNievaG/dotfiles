local dadbod = {
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
    vim.keymap.set('n', '<leader>db', '<cmd>DBUIToggle<cr>', { desc = '[D]ad[B]od', nowait = true, remap = false })
  end,
}

return dadbod
