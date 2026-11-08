{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.cursor;
in
{
  options.programs.cursor = {
    enable = lib.mkEnableOption "Cursor IDE";
  };

  config = {
    nixpkgs.config.allowUnfreePredicate = lib.mkDefault (pkg: lib.getName pkg == "cursor");

    environment.systemPackages = lib.mkIf cfg.enable [ pkgs.cursor ];
  };
}
