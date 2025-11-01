{ inputs, ... }:
{
    imports = [
        inputs.treefmt.flakeModule
    ];

    perSystem = {
        treefmt = import "${inputs.self}/treefmt.nix";
    };
}
