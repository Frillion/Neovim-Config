return{
	"mcchrish/zenbones.nvim",		
	dependencies = {
		"rktjmp/lush.nvim",
	},
	priority = 1000,
	config = function()
		vim.cmd([[colorscheme tokyobones]])
	end,
}
