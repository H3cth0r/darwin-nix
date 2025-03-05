# nvim/nvim-tree.nix
{ ... }: {
  plugins.nvim-tree.enable = true;
  keymaps = [
    {
      mode = "n";
      key = "<leader>ntt";
      action = ":NvimTreeToggle<CR>";
      options.desc = "Toggle file tree";
    }
  ];
}
