{
    description = "dotfiles";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        flake-parts.url = "github:hercules-ci/flake-parts";
        systems.url = "github:nix-systems/x86_64-linux";
    };

    outputs =
        inputs:
        let
            mkPackage =
                pkgs:
                pkgs.stdenv.mkDerivation {
                    name = "shimeoki-dotfiles";
                    src = ./home/dot_scripts;

                    installPhase = ''
                        mkdir -p $out/bin
                        for file in "$src"/executable_*; do
                            old_name=$(basename "$file")
                            new_name=''${old_name#executable_} # remove prefix
                            path="$out/bin/$new_name"
                            cp "$file" "$path"
                            chmod +x "$path"
                        done
                    '';
                };
        in
        inputs.flake-parts.lib.mkFlake { inherit inputs; } {
            systems = import inputs.systems;

            imports = [
                ./flake/module.nix
            ];

            perSystem =
                { pkgs, ... }:
                {
                    packages.default = mkPackage pkgs;
                };
        };
}
