{config, lib, pkgs, ...}:
{
  programs.emacs = {
    enable = true;
    extraPackages = epkgs: [
      epkgs.nix-mode
      epkgs.python-mode
      epkgs.denote
    ];
  };
}
