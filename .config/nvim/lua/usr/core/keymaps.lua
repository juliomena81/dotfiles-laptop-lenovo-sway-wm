-- lua/config/keymaps.lua
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Mapeos Generales (Calidad de Vida)
keymap("i", "jj", "<Esc>", { desc = "Salir modo insertar" })
keymap("n", "<leader>nh", "<cmd>nohl<cr>", { desc = "Limpiar highlights de búsqueda" })
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Mover línea hacia abajo" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Mover línea hacia arriba" })

-- Git (Gitsigns & Diffview)
keymap("n", "<leader>gp", "<cmd>Gitsigns prev_hunk<cr>", { desc = "Git: Hunk Anterior" })
keymap("n", "<leader>gn", "<cmd>Gitsigns next_hunk<cr>", { desc = "Git: Hunk Siguiente" })
keymap("n", "<leader>gl", "<cmd>Gitsigns blame_line<cr>", { desc = "Git: Blame Line" })
keymap("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Git: Abrir Diffview" })
keymap("n", "<leader>gq", "<cmd>DiffviewClose<cr>", { desc = "Git: Cerrar Diffview" })

-- Testing (Neotest)
keymap("n", "<leader>tt", function() require("neotest").run.run() end, { desc = "Test: Correr más cercano" })
keymap("n", "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, { desc = "Test: Correr archivo" })
keymap("n", "<leader>to", function() require("neotest").output.open({ enter = true }) end, { desc = "Test: Ver salida" })

-- Debugging (DAP)
keymap("n", "<leader>db", "<cmd>DapToggleBreakpoint<cr>", { desc = "DAP: Breakpoint" })
keymap("n", "<leader>dc", "<cmd>DapContinue<cr>", { desc = "DAP: Continuar" })
keymap("n", "<leader>di", "<cmd>DapStepInto<cr>", { desc = "DAP: Paso dentro" })
keymap("n", "<leader>do", "<cmd>DapStepOver<cr>", { desc = "DAP: Paso sobre" })