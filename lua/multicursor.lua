local mc = require("multicursor-nvim")
mc.setup()

local map = vim.keymap.set

-- Add or skip cursor above/below the main cursor.
map({"n", "x"}, "<A-m>", function() mc.lineAddCursor(1) end)
map({"n", "x"}, "<A-,>", function() mc.lineAddCursor(-1) end)
map({"n", "x"}, "<leader><A-m>", function() mc.lineAddCursor(1) end)
map({"n", "x"}, "<leader><A-,>", function() mc.lineAddCursor(-1) end)

-- Add or skip adding a new cursor by matching word/selection
map({"n", "x"}, "<C-n>", function() mc.matchAddCursor(1) end)
map({"n", "x"}, "<C-s>", function() mc.matchSkipCursor(1) end)
map({"n", "x"}, "<C-p>", function() mc.matchAddCursor(-1) end)
map({"n", "x"}, "<C-S>", function() mc.matchSkipCursor(-1) end)

-- Disable and enable cursors.
map({"n", "x"}, "<c-q>", mc.toggleCursor)

-- Mappings defined in a keymap layer only apply when there are
-- multiple cursors. This lets you have overlapping mappings.
mc.addKeymapLayer(function(layerSet)

  -- Select different a cursor as the main one.
  layerSet({"n", "x"}, "<C-,>", mc.prevCursor)
  layerSet({"n", "x"}, "<C-m>", mc.nextCursor)

  -- Delete the main cursor.
  layerSet({"n", "x"}, "C-x", mc.deleteCursor)

  -- Enable and clear cursors using escape.
  layerSet("n", "<esc>", function()
      if not mc.cursorsEnabled() then
	  mc.enableCursors()
      else
	  mc.clearCursors()
      end
  end)
end)

-- Customize how cursors look.
local hl = vim.api.nvim_set_hl
hl(0, "MultiCursorCursor", { reverse = true })
hl(0, "MultiCursorVisual", { link = "Visual" })
hl(0, "MultiCursorSign", { link = "SignColumn"})
hl(0, "MultiCursorMatchPreview", { link = "Search" })
hl(0, "MultiCursorDisabledCursor", { reverse = true })
hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
hl(0, "MultiCursorDisabledSign", { link = "SignColumn"})
