-- keep-sorted start block=yes newline_separated=yes
local address = s("a", {
	t("&"),
	i(0, "type"),
})

local array = s("arr", {
	t("["),
	i(1, "..."),
	t("]"),
	i(0, "type"),
})

local equals = s("eq", {
	t("== "),
})

local equals_nil = s("en", {
	t("== nil"),
})

local even = s("even", {
	i(1, "v"),
	t("%2 == 0"),
	i(0),
})

local if_block = s("ifb", {
	t("if "),
	i(1, "statement"),
	t("; "),
	i(2, "condition"),
	t({ " {", "\t" }),
	i(0),
	t({ "", "}" }),
})

local if_nil = s("ifn", {
	t("if "),
	i(1, "v"),
	t({ " == nil {", "\t" }),
	i(0),
	t({ "", "}" }),
})

local if_zero = s("ifz", {
	t("if "),
	i(1, "v"),
	t({ " == 0 {", "\t" }),
	i(0),
	t({ "", "}" }),
})

local literal = s("lit", {
	t("&"),
	i(1, "type"),
	t("{"),
	i(0),
	t("}"),
})

local logical_and = s("and", {
	t("&& "),
})

local logical_not = s("not", {
	t("!"),
})

local logical_or = s("or", {
	t("|| "),
})

local not_equals = s("neq", {
	t("!= "),
})

local not_equals_nil = s("nn", {
	t("!= nil"),
})

local not_implemented = s("nimpl", {
	t('panic("not implemented") // TODO: implement'),
})

local odd = s("odd", {
	i(1, "v"),
	t("%2 != 0"),
	i(0),
})

local pointer = s("p", {
	t("*"),
	i(0, "type"),
})

local return_err = s("rr", {
	t('return nil, errors.New("'),
	i(0),
	t('")'),
})

local return_nil = s("rn", {
	t("return "),
	i(0, "v"),
	t(", nil"),
})

local slice = s("s", {
	t("[]"),
	i(0, "type"),
})

local todo = s("todo", {
	t("// TODO: "),
	i(0),
})

local value = s("v", {
	i(1, "v"),
	t(" := "),
	i(0),
})

local value_array = s("varr", {
	i(1, "v"),
	t(" := ["),
	i(2, "..."),
	t("]"),
	i(3, "type"),
	t("{"),
	i(0),
	t("}"),
})

local value_err = s("vr", {
	i(1, "v"),
	t(", err := "),
	i(0),
})

local value_literal = s("vlit", {
	i(1, "v"),
	t(" := "),
	t("&"),
	i(2, "type"),
	t("{"),
	i(0),
	t("}"),
})

local value_make = s("vmake", {
	i(1, "v"),
	t(" := make("),
	i(2, "type"),
	t(", "),
	i(0, "0"),
	t(")"),
})

local value_map = s("vmap", {
	i(1, "v"),
	t(" := map["),
	i(2, "type"),
	t("]"),
	i(3, "type"),
	t("{"),
	i(0),
	t("}"),
})

local value_new = s("vnew", {
	i(1, "v"),
	t(" := new("),
	i(0, "type"),
	t(")"),
})

local value_ok = s("vk", {
	i(1, "v"),
	t(", ok := "),
	i(0),
})

local value_slice = s("vs", {
	i(1, "v"),
	t(" := []"),
	i(2, "type"),
	t("{"),
	i(0),
	t("}"),
})
-- keep-sorted end

return {
	-- keep-sorted start
	address,
	array,
	equals,
	equals_nil,
	even,
	if_block,
	if_nil,
	if_zero,
	literal,
	logical_and,
	logical_not,
	logical_or,
	not_equals,
	not_equals_nil,
	not_implemented,
	odd,
	pointer,
	return_err,
	return_nil,
	slice,
	todo,
	value,
	value_array,
	value_err,
	value_literal,
	value_make,
	value_map,
	value_new,
	value_ok,
	value_slice,
	-- keep-sorted end
}
