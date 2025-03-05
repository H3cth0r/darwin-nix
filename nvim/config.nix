{ pkgs, lib, ... }: {
  # enable = true;
  # defaultEditor = true;
  viAlias = true;
  vimAlias = true;
  
  opts = {
    number = true;
    relativenumber = true;
    shiftwidth = 2;
    tabstop = 2;
    expandtab = true;
    smartindent = true;
    wrap = false;
    ignorecase = true;
    smartcase = true;
  };
}

