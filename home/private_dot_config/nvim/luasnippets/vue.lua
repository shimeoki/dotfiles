-- keep-sorted start block=yes newline_separated=yes
local init = s("init", {
	t({ '<script setup lang="ts">', "" }),
	t({ "</script>", "", "" }),
	t({ "<template></template>", "", "" }),
	t({ '<style scoped lang="css">', "" }),
	t("</style>"),
}, {
	condition = conds.line_begin,
})
-- keep-sorted end

return {
	-- keep-sorted start
	init,
	-- keep-sorted end
}
