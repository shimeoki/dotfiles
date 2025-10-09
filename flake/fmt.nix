{ inputs, ... }:
{
    imports = [
        inputs.treefmt.flakeModule
    ];

    perSystem = {
        treefmt = {
            programs = {
                nixfmt = {
                    enable = true;
                    width = 80;
                };

                deno = {
                    enable = true;
                    includes = [
                        "*.md"
                        "deno.json"
                    ];
                };
            };

            settings.formatter = {
                # TODO: use indent option after numtide/treefmt-nix#416
                nixfmt.options = [ "--indent=4" ];
            };
        };
    };
}
