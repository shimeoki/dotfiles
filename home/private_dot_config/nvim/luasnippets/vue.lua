return {
	-- keep-sorted start block=yes newline_separated=yes
	s("init", {
		t({ '<script setup lang="ts">', "" }),
		t({ "</script>", "", "" }),
		t({ "<template></template>", "", "" }),
		t({ '<style scoped lang="css">', "" }),
		t("</style>"),
	}),
	-- keep-sorted end
}
