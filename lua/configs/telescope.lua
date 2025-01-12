-- Load telescope with a protected call
local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
   return
end

local actions = require "telescope.actions"

-- Telescope options
telescope.setup {
  defaults = {

    prompt_prefix = " ",
    selection_caret = "  ",
    path_display = { "smart" },
    file_ignore_patterns = { ".git/", "node_modules" },

    mappings = {
      i = {
        ["<A-q>"] = actions.close,
        ["<A-j>"] = actions.move_selection_next,
        ["<A-k>"] = actions.move_selection_previous,
        ["<A-u>"] = actions.preview_scrolling_up,
        ["<A-d>"] = actions.preview_scrolling_down,
        ["<C-v>"] = actions.select_vertical,
        ["<C-h>"] = actions.select_horizontal,
      },
    },
  },
}

-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"
