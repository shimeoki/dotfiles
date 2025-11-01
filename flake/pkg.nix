{ inputs, ... }:
{
    perSystem =
        { pkgs, ... }:
        {
            packages.default = pkgs.stdenv.mkDerivation {
                name = "shimeoki-dotfiles";

                src = "${inputs.self}/home/dot_scripts";

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
        };
}
