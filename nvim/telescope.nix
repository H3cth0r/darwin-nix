# nvim/telescope.nix
{ ... }: {
  plugins.telescope = {
    enable = true;
    # enabledExtensions = [ "fzf" ];
  };
  plugins.fzf-lua = {
    enable = true;
  };

  extraConfigLua = ''
    require('telescope').setup({
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = require('telescope.actions').move_selection_previous,
            ["<C-j>"] = require('telescope.actions').move_selection_next,
            ["<C-q>"] = require('telescope.actions').send_selected_to_qflist + require('telescope.actions').open_qflist,
          },
        },
      },
    })

  '';

  keymaps = [
    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd>Telescope find_files<cr>";
      options.desc = "Find files within current working directory, respects .gitignore";
    }
    {
      mode = "n";
      key = "<leader>fs";
      action = "<cmd>Telescope live_grep<cr>";
      options.desc = "Find string in current working directory as you type";
    }
    {
      mode = "n";
      key = "<leader>fc";
      action = "<cmd>Telescope grep_string<cr>";
      options.desc = "Find string under cursor in current working directory";
    }
    {
      mode = "n";
      key = "<leader>fb";
      action = "<cmd>Telescope buffers<cr>";
      options.desc = "List open buffers in current neovim instance";
    }
    {
      mode = "n";
      key = "<leader>fh";
      action = "<cmd>Telescope help_tags<cr>";
      options.desc = "List available help tags";
    }
  ];
}
