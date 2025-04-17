local enabled = true

local opts = {
	style = "markdown",
	output_extension = "md",
	force_ft = "markdown",
}

local err = require("log").error

local default_notebook = [[
{
    "cells": [
    {
        "cell_type": "markdown",
        "metadata": {},
        "source": [
        ""
        ]
    }
    ],
    "metadata": {
        "kernelspec": {
            "display_name": "Python 3",
            "language": "python",
            "name": "python3"
        },
        "language_info": {
            "codemirror_mode": {
                "name": "ipython"
            },
            "file_extension": ".py",
            "mimetype": "text/x-python",
            "name": "python",
            "nbconvert_exporter": "python",
            "pygments_lexer": "ipython3"
        }
    },
    "nbformat": 4,
    "nbformat_minor": 5
}
]]

local function new_notebook(filename)
	local path = filename .. ".ipynb"
	local file = io.open(path, "w")

	if not file then
		err("could not open new notebook")
		return
	end

	file:write(default_notebook)
	file:close()

	vim.cmd("edit " .. path)
end

local cmd = "NewNotebook"

if enabled then
	vim.api.nvim_create_user_command(cmd, function(opt)
		new_notebook(opt.args)
	end, {
		nargs = 1,
		complete = "file",
	})
end

return {
	"GCBallesteros/jupytext.nvim",
	name = "jupytext",
	main = "jupytext",
	cond = enabled,
	lazy = false,
	cmd = { cmd },
	opts = opts,
}
