# nvim/nvim-tree.nix
{ ... }: {
  plugins.nvim-tree.enable = true;

  # Nvim-tree specific Lua configuration
  extraConfigLua = ''
    require("nvim-tree").setup({
      renderer = {
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "->",
              arrow_open = "L>",
            },
          },
        },
      },
    })
  '';

  keymaps = [
    {
      mode = "n";
      key = "<leader>ntt";
      action = ":NvimTreeToggle<CR>";
      options.desc = "Toggle file tree";
    }
  ];

  # Pre-plugin-load configuration
  extraConfigLuaPre = ''
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  '';
}
