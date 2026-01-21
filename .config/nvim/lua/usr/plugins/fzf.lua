return {
  "ibhagwan/fzf-lua",
  config = function()
    local actions = require("fzf-lua").actions
    require('fzf-lua').setup({
      winopts = {
        height       = 0.85,
        width        = 0.80,
        row          = 0.35,
        col          = 0.50,
        border       = "rounded",
        backdrop     = 60,
        preview = {
          default      = 'bat', 
          border       = "rounded",
          layout       = "flex",
          flip_columns = 100,
        }
      },
      keymap = {
        builtin = {
          ["<M-Esc>"]     = "hide",
          ["<F1>"]        = "toggle-help",
          ["<F2>"]        = "toggle-fullscreen",
        },
        fzf = {
          ["ctrl-z"]      = "abort",
          ["ctrl-f"]      = "half-page-down",
          ["ctrl-b"]      = "half-page-up",
          ["alt-a"]       = "toggle-all",
          ["f3"]          = "toggle-preview-wrap",
          ["f4"]          = "toggle-preview",
        },
      },
      actions = {
        files = {
          ["default"]     = actions.file_edit_or_qf,
          ["ctrl-s"]      = actions.file_split,
          ["ctrl-v"]      = actions.file_vsplit,
          ["ctrl-t"]      = actions.file_tabedit,
        },
      },
      fzf_opts = {
        ["--ansi"]           = true,
        ["--info"]           = "inline-right",
        ["--layout"]         = "reverse",
        ["--highlight-line"] = true,
      },
      previewers = {
        bat = {
          cmd  = "bat",
          args = "--color=always --style=numbers,changes",
        },
      },
      codeaction_native = {
        diff_opts = { ctxlen = 3 },
        pager = [[delta --width=$COLUMNS --hunk-header-style="omit" --file-style="omit"]],
      },
    })

    -- Mapeos de teclado rápidos
    vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Find Files" })
    vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>", { desc = "Live Grep" })
    vim.keymap.set("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", { desc = "Buffers" })
  end
}
