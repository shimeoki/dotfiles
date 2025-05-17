local value = s("v", {
	i(1, "v"),
	t(" := "),
	i(0),
})

local value_err = s("vr", {
	i(1, "v"),
	t(", err := "),
	i(0),
})

local value_ok = s("vk", {
	i(1, "v"),
	t(", ok := "),
	i(0),
})

local array = s("arr", {
	t("["),
	i(1, "..."),
	t("]"),
	i(0, "type"),
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

local slice = s("s", {
	t("[]"),
	i(0, "type"),
})

local value_slice = s("vs", {
	i(1, "v"),
	t(" := []"),
	i(2, "type"),
	t("{"),
	i(0),
	t("}"),
})

local literal = s("lit", {
	t("&"),
	i(1, "type"),
	t("{"),
	i(0),
	t("}"),
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

local value_new = s("vnew", {
	i(1, "v"),
	t(" := new("),
	i(0, "type"),
	t(")"),
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

local address = s("a", {
	t("&"),
	i(0, "type"),
})

local pointer = s("p", {
	t("*"),
	i(0, "type"),
})

local logical_and = s("and", {
	t("&& "),
})

local logical_or = s("or", {
	t("|| "),
})

local logical_not = s("not", {
	t("!"),
})

return {
	value,
	value_err,
	value_ok,
	array,
	value_array,
	slice,
	value_slice,
	literal,
	value_literal,
	value_new,
	value_make,
	value_map,
	address,
	pointer,
	logical_and,
	logical_or,
	logical_not,
}
