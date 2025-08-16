local init = s("init", {
	t({ '<script setup lang="ts">', "" }),
	t({ "</script>", "", "" }),
	t({ "<template></template>", "", "" }),
	t({ '<style scoped lang="css">', "" }),
	t("</style>"),
}, {
	condition = conds.line_begin,
})

return {
	init,
}
