{
    description = "dotfiles";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        flake-parts.url = "github:hercules-ci/flake-parts";
        systems.url = "github:nix-systems/x86_64-linux";

        treefmt = {
            url = "github:numtide/treefmt-nix";
            inputs = {
                nixpkgs.follows = "nixpkgs";
            };
        };
    };

    outputs =
        inputs:
        inputs.flake-parts.lib.mkFlake { inherit inputs; } {
            systems = import inputs.systems;

            imports = [
                # keep-sorted start
                ./flake/fmt.nix
                ./flake/module.nix
                ./flake/package.nix
                # keep-sorted end
            ];
        };
}
