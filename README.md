# Cursor flake for Nix

<a href="https://github.com/jasonkwh/cursor-ide-nix/actions/workflows/eval.yml"><img src="https://img.shields.io/github/actions/workflow/status/jasonkwh/cursor-ide-nix/eval.yml?label=eval" alt="eval"></a>

I created this repo because the Cursor version in nixpkgs is outdated, and the agent interface stopped working because that version is obsolete.

This flake provides the `code-cursor` package, the same attribute name as nixpkgs.

It also provides a NixOS module, which allows you to install the package the usual way:

```nix
environment.systemPackages = with pkgs; [ code-cursor ];
```

## Using the Cursor package in your NixOS configuration

First, add this repository to your flake inputs.

```nix
inputs = {
  nixpkgs.url = "nixpkgs/nixos-unstable";
  cursor = {
    url = "github:jasonkwh/cursor-ide-nix";
    inputs.nixpkgs.follows = "nixpkgs";
  };
};
```

Next, pass the module from this flake into your NixOS configuration to make the package available.

```nix
outputs = { self, nixpkgs, cursor }: {
  # ...
  lib.nixosSystem {
    system = "...";
    modules = [
      cursor.nixosModules.default
      # ...
    ];
  };
};
```

`programs.cursor.enable = true` adds `pkgs.code-cursor` to `environment.systemPackages`. The program name stays `cursor`.

The package is also available as `cursor.packages.${system}.code-cursor` for `x86_64-linux`, `aarch64-linux`, and `aarch64-darwin`.
