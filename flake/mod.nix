{ inputs, ... }:
let
    home = path: "${inputs.self}/home/${path}";
    config = path: home "private_dot_config/${path}";

    public = { inherit config; };

    module =
        { lib, ... }:
        {
            options.shimeoki.dotfiles = {
                config = lib.mkOption {
                    type = with lib.types; functionTo pathInStore;
                };

                package = lib.mkOption {
                    type = with lib.types; package;
                };
            };

            config = {
                shimeoki.dotfiles = public;
            };
        };
in
{
    flake = {
        homeModules.default = module;
        nixosModules.default = module;
    };
}
