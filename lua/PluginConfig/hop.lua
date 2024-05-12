local api = vim.api

local hop = require("hop")

-- you can configure Hop the way you like here; see :h hop-config
hop.setup({ keys = "etovxqpdygfblzhckisuran" })

-- defalut
-- local hop = require('hop')
-- local directions = require('hop.hint').HintDirection
--   vim.keymap.set('', 'f', function()
--     hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false})
--   end, {remap=true})
--   vim.keymap.set('', 'F', function()
--     hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
--   end, {remap=true})
--   vim.keymap.set('', 't', function()
--     hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
--   end, {remap=true})
--   vim.keymap.set('', 'T', function()
--     hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
-- end, {remap=true})

-- custom
-- place this in one of your configuration file(s)
api.nvim_set_keymap("n", "[hop]", "<Nop>", { noremap = true, silent = true })
api.nvim_set_keymap("v", "[hop]", "<Nop>", { noremap = true, silent = true })
api.nvim_set_keymap("n", "<Space><Space>", "[hop]", {})
api.nvim_set_keymap("v", "<Space><Space>", "[hop]", {})

-- Normal Mode
local hint = require("hop.hint")

for k, v in pairs({
  ["[hop]w"] = hop.hint_words,
  ["[hop]e"] = function()
    hop.hint_words({ hint_position = hint.HintPosition.END })
  end,
  ["[hop]0"] = hop.hint_lines,
  ["[hop]k"] = function()
    hop.hint_vertical({ direction = hint.HintDirection.BEFORE_CURSOR })
  end,
  ["[hop]j"] = function()
    hop.hint_vertical({ direction = hint.HintDirection.AFTER_CURSOR })
  end,
  ["[hop]lk"] = function()
    hop.hint_lines({ direction = hint.HintDirection.BEFORE_CURSOR })
  end,
  ["[hop]lj"] = function()
    hop.hint_lines({ direction = hint.HintDirection.AFTER_CURSOR })
  end,
  ["[hop]/"] = hop.hint_patterns,
  ["[hop]r"] = hop.hint_char1,
  ["[hop]h"] = hop.hint_char2,
  ["f"] = function()
    -- hop.hint_words()
    hop.hint_char1({ current_line_only = false })
    -- hop.hint_char1({ direction = hint.HintDirection.AFTER_CURSOR, current_line_only = false })
  end,
  ["F"] = function()
    hop.hint_char1({ current_line_only = false })
    -- hop.hint_char1({ direction = hint.HintDirection.BEFORE_CURSOR, current_line_only = false })
  end,
  ["t"] = function()
    hop.hint_char1({ current_line_only = false, hint_offset = -1 })
    -- hop.hint_char1({ direction = hint.HintDirection.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })
  end,
  ["T"] = function()
    hop.hint_char1({  current_line_only = false, hint_offset = 1 })
    -- hop.hint_char1({ direction = hint.HintDirection.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 })
  end,
}) do
  vim.keymap.set("", k, v)
end