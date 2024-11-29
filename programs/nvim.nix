{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    neovim
    stylua
    lua-language-server
    xclip # for neovim clipboard
    nil # lsp for .nix (nvim)
    nixfmt-rfc-style
    cargo # for some rust tools
  ];
}
