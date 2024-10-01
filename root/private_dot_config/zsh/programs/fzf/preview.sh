#!/bin/env sh

export FZF_DIR_PREVIEW="eza --tree --color=always {} | head -200"
export FZF_FILE_PREVIEW="bat -n --color=always --line-range :500 {}"
export FZF_PREVIEW="if [ -d {} ]; then $FZF_DIR_PREVIEW; else $FZF_FILE_PREVIEW; fi"

