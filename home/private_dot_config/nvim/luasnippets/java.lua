return {
	-- keep-sorted start block=yes newline_separated=yes
	s("todo", {
		t("// TODO: "),
		i(0),
	}),

	s("v", {
		t("final "),
		i(1, "var"),
		t(" "),
		i(2, "name"),
		t(" = "),
		i(0),
	}),
	-- keep-sorted end
}
