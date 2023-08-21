require("toggleterm").setup({
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_size = true,
    direction = 'horizontal',
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
        border = 'curved',
    },
    winbar = {
        enabled = false,
        name_formatter = function(term) --  term: Terminal
            return term.name
        end
    },
})

vim.keymap.set("n", "<leader>tt", vim.cmd.ToggleTerm);
vim.keymap.set("n", "<leader>tf", function() vim.cmd.ToggleTerm("direction=float") end);
