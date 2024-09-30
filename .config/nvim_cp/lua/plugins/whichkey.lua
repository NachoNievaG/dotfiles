local harpoon = require("harpoon")

local mappings = {
	{ "<leader>1", "<CMD>lua require('harpoon'):list():select(1)<CR>", hidden = true, nowait = true, remap = false },
	{ "<leader>2", "<CMD>lua require('harpoon'):list():select(2)<CR>", hidden = true, nowait = true, remap = false },
	{ "<leader>3", "<CMD>lua require('harpoon'):list():select(3)<CR>", hidden = true, nowait = true, remap = false },
	{ "<leader>4", "<CMD>lua require('harpoon'):list():select(4)<CR>", hidden = true, nowait = true, remap = false },
	{ "<leader>5", "<CMD>lua require('harpoon'):list():select(5)<CR>", hidden = true, nowait = true, remap = false },
	{ "<leader>6", "<CMD>lua require('harpoon'):list():select(6)<CR>", hidden = true, nowait = true, remap = false },
	{ "<leader>7", "<CMD>lua require('harpoon'):list():select(7)<CR>", hidden = true, nowait = true, remap = false },
	{ "<leader>8", "<CMD>lua require('harpoon'):list():select(8)<CR>", hidden = true, nowait = true, remap = false },
	{ "<leader>9", "<CMD>lua require('harpoon'):list():select(9)<CR>", hidden = true, nowait = true, remap = false },
	{ "<leader>N", "<cmd>tabnew<cr>", desc = "New Buffer", nowait = true, remap = false },
	{ "<leader>Q", "<cmd>q!<CR>", desc = "Quit", nowait = true, remap = false },
	{ "<leader>W", "<cmd>wa!<CR>", desc = "Save & quit", nowait = true, remap = false },
	{
		"<leader>c",
		"<CMD>lua require('close_buffers').delete({type = 'this'})<CR>",
		desc = "Close buffer",
		nowait = true,
		remap = false,
	},
	{ "<leader>d", group = "dadbod", nowait = true, remap = false },
	{ "<leader>db", "<cmd>DBUIToggle<cr>", desc = "Toggle", nowait = true, remap = false },
	{ "<leader>e", "<CMD>Oil<CR>", desc = "Explorer", nowait = true, remap = false },
	{ "<leader>f", group = "Telescope", nowait = true, remap = false },
	{ "<leader>fC", "<cmd>Telescope git_bcommits<cr>", desc = "Git Commits", nowait = true, remap = false },
	{ "<leader>fM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages", nowait = true, remap = false },
	{ "<leader>fS", "<cmd>Telescope git_stash<cr>", desc = "Git Stash", nowait = true, remap = false },
	{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers", nowait = true, remap = false },
	{ "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Find Commands", nowait = true, remap = false },
	{ "<leader>fd", "<cmd>Telescope diagnostics <cr>", desc = "Find Diagnostics", nowait = true, remap = false },
	{ "<leader>ff", "<cmd>Telescope find_files <cr>", desc = "Find files", nowait = true, remap = false },
	{ "<leader>fh", "<cmd>Telescope help_tags <cr>", desc = "Find Help", nowait = true, remap = false },
	{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps", nowait = true, remap = false },
	{
		"<leader>fn",
		"<cmd>TodoTelescope keywords=NOTE,INFO <cr>",
		desc = "Find Annotations",
		nowait = true,
		remap = false,
	},
	{ "<leader>fp", "<cmd>TodoTelescope keywords=TODO,FIX <cr>", desc = "Find Pendings", nowait = true, remap = false },
	{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File", nowait = true, remap = false },
	{ "<leader>fs", "<cmd>Telescope git_status<cr>", desc = "Git Status", nowait = true, remap = false },
	{ "<leader>fw", "<cmd>Telescope live_grep <cr>", desc = "Find Text", nowait = true, remap = false },
	{ "<leader>g", group = "Git", nowait = true, remap = false },
	{ "<leader>gP", "<cmd>Lazydocker<cr>", desc = "LazyDocker", nowait = true, remap = false },
	{
		"<leader>gR",
		"<cmd>lua require 'gitsigns'.reset_buffer()<cr>",
		desc = "Reset Buffer",
		nowait = true,
		remap = false,
	},
	{ "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch", nowait = true, remap = false },
	{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit", nowait = true, remap = false },
	{ "<leader>gd", "<cmd>Gvdiffsplit<cr>", desc = "Diff", nowait = true, remap = false },
	{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit", nowait = true, remap = false },
	{ "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk", nowait = true, remap = false },
	{ "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk", nowait = true, remap = false },
	{ "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame", nowait = true, remap = false },
	{ "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file", nowait = true, remap = false },
	{
		"<leader>gp",
		"<cmd>lua require 'gitsigns'.preview_hunk()<cr>",
		desc = "Preview Hunk",
		nowait = true,
		remap = false,
	},
	{ "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk", nowait = true, remap = false },
	{ "<leader>gs", "<cmd>Git<cr>", desc = "Git Status", nowait = true, remap = false },
	{
		"<leader>gu",
		"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
		desc = "Undo Stage Hunk",
		nowait = true,
		remap = false,
	},
	{ "<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight", nowait = true, remap = false },
	{ "<leader>j", group = "json", nowait = true, remap = false },
	{ "<leader>js", "<cmd>%!jq '.'<cr>", desc = "Format", nowait = true, remap = false },
	{ "<leader>m", group = "Harpoon", nowait = true, remap = false },
	{
		"<leader>ma",
		function()
			harpoon:list():append()
		end,
		desc = "Add File",
		nowait = true,
		remap = false,
	},
	{
		"<leader>mo",
		function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end,
		desc = "Menu",
		nowait = true,
		remap = false,
	},
	{
		"<leader>n",
		"<CMD>lua require('close_buffers').delete({type = 'nameless'})<CR>",
		desc = "Close no name",
		nowait = true,
		remap = false,
	},
	{
		"<leader>o",
		"<CMD>lua require('close_buffers').delete({type = 'other'})<CR>",
		desc = "Close other buffers",
		nowait = true,
		remap = false,
	},
	{ "<leader>q", "<cmd>q<CR>", desc = "Quit", nowait = true, remap = false },
	{ "<leader>w", "<cmd>w!<CR>", desc = "Save", nowait = true, remap = false },
	{ "<leader>x", group = "Debugger", nowait = true, remap = false },
	{
		"<leader>xB",
		function()
			require("dap").clear_breakpoints()
		end,
		desc = "Clear Breakpoints",
		nowait = true,
		remap = false,
	},
	{
		"<leader>xQ",
		function()
			require("dap").terminate()
		end,
		desc = "Terminate",
		nowait = true,
		remap = false,
	},
	{
		"<leader>xb",
		function()
			require("dap").toggle_breakpoint()
		end,
		desc = "Toggle Breakpoint",
		nowait = true,
		remap = false,
	},
	{
		"<leader>xc",
		function()
			require("dap").continue()
		end,
		desc = "Continue",
		nowait = true,
		remap = false,
	},
	{
		"<leader>xg",
		function()
			require("dap-go").debug_test()
			require("dapui").toggle()
		end,
		desc = "Debug Go Test",
		nowait = true,
		remap = false,
	},
	{
		"<leader>xi",
		function()
			require("dap").step_into()
		end,
		desc = "Step Into",
		nowait = true,
		remap = false,
	},
	{
		"<leader>xl",
		function()
			require("dapui").float_element("breakpoints")
		end,
		desc = "List Breakpoints",
		nowait = true,
		remap = false,
	},
	{
		"<leader>xo",
		function()
			require("dap").step_over()
		end,
		desc = "Step Over",
		nowait = true,
		remap = false,
	},
	{
		"<leader>xq",
		function()
			require("dap").close()
		end,
		desc = "Close Session",
		nowait = true,
		remap = false,
	},
	{
		"<leader>xr",
		function()
			require("dap").repl.toggle()
		end,
		desc = "REPL",
		nowait = true,
		remap = false,
	},
	{
		"<leader>xs",
		function()
			require("dapui").float_element("scopes")
		end,
		desc = "Scopes",
		nowait = true,
		remap = false,
	},
	{
		"<leader>xt",
		function()
			require("dapui").float_element("stacks")
		end,
		desc = "Threads",
		nowait = true,
		remap = false,
	},
	{
		"<leader>xu",
		function()
			require("dapui").toggle()
		end,
		desc = "Toggle Debugger UI",
		nowait = true,
		remap = false,
	},
	{
		"<leader>xw",
		function()
			require("dapui").float_element("watches")
		end,
		desc = "Watches",
		nowait = true,
		remap = false,
	},
	{
		"<leader>xx",
		function()
			require("dap.ui.widgets").hover()
		end,
		desc = "Inspect",
		nowait = true,
		remap = false,
	},
}

return {
	"folke/which-key.nvim",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		preset = "helix",
	},
	config = function()
		require("which-key").add(mappings)
	end,
}
