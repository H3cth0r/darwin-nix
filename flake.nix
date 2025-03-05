{
  description = "h3cth0r nix-darwin system flake";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nixvim }:
  let
    configuration = { pkgs, lib, config, ... }: {
      environment.systemPackages = [ 
        # Replace pkgs.neovim with NixVim package
        (nixvim.legacyPackages.${pkgs.system}.makeNixvimWithModule {
          module = ./nvim/config.nix;
          inherit pkgs;
        })
        pkgs.tmux
        pkgs.git
        pkgs.ripgrep
        pkgs.fzf
        pkgs.wget
      ];

      nix.settings.experimental-features = "nix-command flakes";
      system.configurationRevision = self.rev or self.dirtyRev or null;
      system.stateVersion = 6;
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    darwinConfigurations."Hectors-MacBook-Pro" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };
  };
}

