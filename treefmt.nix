{
    programs = {
        # keep-sorted start block=yes newline_separated=yes
        deno = {
            enable = true;
            includes = [
                "*.md"
                "deno.json"
            ];
        };

        keep-sorted = {
            enable = true;
        };

        nixfmt = {
            enable = true;
            width = 80;
            indent = 4;
        };

        stylua = {
            enable = true;
        };
        # keep-sorted end
    };
}
