{ inputs, ... }:
let
    home = path: "${inputs.self}/home/${path}";
    config = path: home "private_dot_config/${path}";

    public = { inherit config; };

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
