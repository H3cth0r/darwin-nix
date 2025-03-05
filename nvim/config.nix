{ pkgs, lib, ... }: {
  viAlias = true;
  vimAlias = true;
  
  opts = {
    number = true;
    relativenumber = true;
    shiftwidth = 2;
    tabstop = 2;
    expandtab = true;
    autoindent = true;  # Replaced smartindent with autoindent
    wrap = false;
    ignorecase = true;
    smartcase = true;
    clipboard = "unnamedplus";
    linebreak = true;   # Corresponds to opt.lbr
    cursorline = false;
    backspace = "indent,eol,start";
    splitright = true;
    splitbelow = true;
  };

  # Append hyphen to iskeyword
  extraConfigVim = ''
    set iskeyword+=-
  '';

  imports = [ 
    ./nvim-tree.nix 
    ./telescope.nix 
  ];

  plugins = {
    tmux-navigator.enable = true;       # Enables vim-tmux-navigator
  };

  keymaps = [
    # No highlight
    {
      mode = "n";
      key = "<leader>nh";
      action = ":nohl<CR>";
      options.desc = "No highlight";
    }
    # Delete without yanking
    {
      mode = "n";
      key = "x";
      action = "\"_x\"";
      options.desc = "Delete without yanking";
    }
    # Increment/Decrement numbers
    {
      mode = "n";
      key = "<leader>+";
      action = "<C-a>";
      options.desc = "Increment number";
    }
    {
      mode = "n";
      key = "<leader>-";
      action = "<C-x>";
      options.desc = "Decrement number";
    }
    # Window splits
    {
      mode = "n";
      key = "<leader>sv";
      action = "<C-w>v";
      options.desc = "Split vertically";
    }
    {
      mode = "n";
      key = "<leader>sh";
      action = "<C-w>s";
      options.desc = "Split horizontally";
    }
    {
      mode = "n";
      key = "<leader>se";
      action = "<C-w>=";
      options.desc = "Equalize splits";
    }
    {
      mode = "n";
      key = "<leader>sx";
      action = ":close<CR>";
      options.desc = "Close split";
    }
    # Tab management
    {
      mode = "n";
      key = "<leader>to";
      action = ":tabnew<CR>";
      options.desc = "Open new tab";
    }
    {
      mode = "n";
      key = "<leader>tx";
      action = ":tabclose<CR>";
      options.desc = "Close current tab";
    }
    {
      mode = "n";
      key = "<leader>tn";
      action = ":tabn<CR>";
      options.desc = "Next tab";
    }
    {
      mode = "n";
      key = "<leader>tp";
      action = ":tabp<CR>";
      options.desc = "Previous tab";
    }
    # Maximizer
    {
      mode = "n";
      key = "<leader>sm";
      action = ":MaximizerToggle<CR>";
      options.desc = "Toggle maximize split";
    }
  ];

}

