return {
	-- keep-sorted start block=yes newline_separated=yes
	s("a", {
		t("&"),
		i(0, "type"),
	}),

	s("and", {
		t("&& "),
	}),

	s("arr", {
		t("["),
		i(1, "..."),
		t("]"),
		i(0, "type"),
	}),

	s("embed", {
		t("//go:embed "),
		i(0, "files"),
	}),

	s("en", {
		t("== nil"),
	}),

	s("eq", {
		t("== "),
	}),

	s("even", {
		i(1, "v"),
		t("%2 == 0"),
		i(0),
	}),

	s("ifb", {
		t("if "),
		i(1, "statement"),
		t("; "),
		i(2, "condition"),
		t({ " {", "\t" }),
		i(0),
		t({ "", "}" }),
	}),

	s("ifn", {
		t("if "),
		i(1, "v"),
		t({ " == nil {", "\t" }),
		i(0),
		t({ "", "}" }),
	}),

	s("ifz", {
		t("if "),
		i(1, "v"),
		t({ " == 0 {", "\t" }),
		i(0),
		t({ "", "}" }),
	}),

	s("lit", {
		t("&"),
		i(1, "type"),
		t("{"),
		i(0),
		t("}"),
	}),

	s("neq", {
		t("!= "),
	}),

	s("nimpl", {
		t('panic("not implemented") // TODO: implement'),
	}),

	s("nn", {
		t("!= nil"),
	}),

	s("not", {
		t("!"),
	}),

	s("odd", {
		i(1, "v"),
		t("%2 != 0"),
		i(0),
	}),

	s("or", {
		t("|| "),
	}),

	s("p", {
		t("*"),
		i(0, "type"),
	}),

	s("rn", {
		t("return "),
		i(0, "v"),
		t(", nil"),
	}),

	s("rr", {
		t('return nil, errors.New("'),
		i(0),
		t('")'),
	}),

	s("s", {
		t("[]"),
		i(0, "type"),
	}),

	s("todo", {
		t("// TODO: "),
		i(0),
	}),

	s("v", {
		i(1, "v"),
		t(" := "),
		i(0),
	}),

	s("varr", {
		i(1, "v"),
		t(" := ["),
		i(2, "..."),
		t("]"),
		i(3, "type"),
		t("{"),
		i(0),
		t("}"),
	}),

	s("vk", {
		i(1, "v"),
		t(", ok := "),
		i(0),
	}),

	s("vlit", {
		i(1, "v"),
		t(" := "),
		t("&"),
		i(2, "type"),
		t("{"),
		i(0),
		t("}"),
	}),

	s("vmake", {
		i(1, "v"),
		t(" := make("),
		i(2, "type"),
		t(", "),
		i(0, "0"),
		t(")"),
	}),

	s("vmap", {
		i(1, "v"),
		t(" := map["),
		i(2, "type"),
		t("]"),
		i(3, "type"),
		t("{"),
		i(0),
		t("}"),
	}),

	s("vnew", {
		i(1, "v"),
		t(" := new("),
		i(0, "type"),
		t(")"),
	}),

	s("vr", {
		i(1, "v"),
		t(", err := "),
		i(0),
	}),

	s("vs", {
		i(1, "v"),
		t(" := []"),
		i(2, "type"),
		t("{"),
		i(0),
		t("}"),
	}),
	-- keep-sorted end
}
