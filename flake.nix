{
    description = "dotfiles";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        flake-parts.url = "github:hercules-ci/flake-parts";
        systems.url = "github:nix-systems/x86_64-linux";
    };

    outputs =
        {
            self,
            nixpkgs,
            systems,
            ...
        }:
        let
            forEachSystem = nixpkgs.lib.genAttrs (import systems);
            getPkgs = system: import nixpkgs { inherit system; };

            home = path: "${self}/home/${path}";
            config = path: home "private_dot_config/${path}";
            functions = { inherit config; };

            module =
                { lib, ... }:
                {
                    options.shimeoki.dotfiles = with lib; {
                        config = mkOption {
                            type = with types; functionTo pathInStore;
                        };

                        package = mkOption {
                            type = types.package;
                        };
                    };

                    config = {
                        shimeoki.dotfiles = functions;
                    };
                };

            mkPackage =
                system:
                let
                    pkgs = getPkgs system;
                in
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
        {
            homeModules.default = module;
            nixosModules.default = module;

            packages = forEachSystem (system: {
                default = mkPackage system;
            });
        };
}
