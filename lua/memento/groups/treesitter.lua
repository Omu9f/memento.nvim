local Util = require("memento.util")

local M = {}

---@type memento.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    ["@annotation"]                 = "PreProc",
    ["@attribute"]                  = "PreProc",
    ["@boolean"]                    = "Boolean",
    ["@character"]                  = "Character",
    ["@character.printf"]           = "SpecialChar",
    ["@character.special"]          = "SpecialChar",
    ["@comment"]                    = "Comment",
    ["@comment.error"]              = { fg = c.error },
    ["@comment.hint"]               = { fg = c.hint },
    ["@comment.info"]               = { fg = c.info },
    ["@comment.note"]               = { fg = c.hint },
    ["@comment.todo"]               = { fg = c.todo },
    ["@comment.warning"]            = { fg = c.warning },
    ["@constant"]                   = "Constant",
    ["@constant.builtin"]           = "Special",
    ["@constant.macro"]             = "Define",
    ["@constructor"]                = { fg = c.magenta }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
    ["@constructor.tsx"]            = { fg = c.blue1 },
    ["@diff.delta"]                 = "DiffChange",
    ["@diff.minus"]                 = "DiffDelete",
    ["@diff.plus"]                  = "DiffAdd",
    -- new stuff
    -- ["@function"]                   = "Function",
    -- ["@function.builtin"]           = "Special",
    -- ["@function.call"]              = "@function",
    -- ["@function.macro"]             = "Macro",
    -- ["@function.method"]            = "Function",
    -- ["@function.method.call"]       = "@function.method",
    -- new stuff
    ["@function"]                   = { fg = c.purple, style = opts.styles.keywords },
    ["@function.builtin"]           = "Special",
    ["@function.call"]              = "@function",
    ["@function.macro"]             = "Macro",
    -- ["@function.method"]            = { fg = "#ea6398" },
    -- ["@function.method.call"]       = { fg = "#ea6398" },
    ["@function.method"]            = { fg = c.purple, style = opts.styles.keywords },
    ["@function.method.call"]       = "@function.method",
    -- new stuff 
    -- ["@keyword"]                    = { fg = c.purple, style = opts.styles.keywords }, -- For keywords that don't fall in previous categories.
    ["@keyword"]                    = { fg = "#ea6398" }, -- For keywords that don't fall in previous categories.
    -- ["@keyword.conditional"]        = "Conditional",
    ["@keyword.conditional"]        = { fg = "#ea6398" },
    ["@keyword.coroutine"]          = "@keyword",
    ["@keyword.debug"]              = "Debug",
    ["@keyword.directive"]          = "PreProc",
    ["@keyword.directive.define"]   = "Define",
    ["@keyword.exception"]          = "Exception",
    -- ["@keyword.function"]           = { fg = c.magenta, style = opts.styles.functions }, -- For keywords used to define a function.
    -- ["@keyword.import"]             = "Include",
    ["@keyword.import"]             = "@keyword",
    ["@keyword.operator"]           = "@operator",
    -- ["@keyword.repeat"]             = "Repeat",
    ["@keyword.repeat"]             = "@keyword",
    ["@keyword.return"]             = "@keyword",
    ["@keyword.storage"]            = "StorageClass",
    -- new stuff
    -- ["@keyword"]                    = { fg = "#ea6398" }, -- For keywords that don't fall in previous categories.
    -- ["@keyword.conditional"]        = { fg = "#ea6398" }
    -- ["@keyword.coroutine"]          = { fg = "#ea6398" }
    -- ["@keyword.debug"]              = { fg = "#ea6398" }
    -- ["@keyword.directive"]          = { fg = "#ea6398" }
    -- ["@keyword.directive.define"]   = { fg = "#ea6398" }
    -- ["@keyword.exception"]          = { fg = "#ea6398" }
    -- ["@keyword.function"]           = { fg = "#ea6398" }, -- For keywords used to define a function.
    -- ["@keyword.import"]             = { fg = "#ea6398" },
    -- ["@keyword.operator"]           = { fg = "#ea6398" },
    -- ["@keyword.repeat"]             = { fg = "#ea6398" },
    -- ["@keyword.return"]             = { fg = "#ea6398" },
    -- ["@keyword.storage"]            = { fg = "#ea6398" },
    -- new stuff
    ["@label"]                      = { fg = c.blue }, -- For labels: `label:` in C and `:label:` in Lua.
    ["@markup"]                     = "@none",
    ["@markup.emphasis"]            = { italic = true },
    ["@markup.environment"]         = "Macro",
    ["@markup.environment.name"]    = "Type",
    ["@markup.heading"]             = "Title",
    ["@markup.italic"]              = { italic = true },
    ["@markup.link"]                = { fg = c.teal },
    ["@markup.link.label"]          = "SpecialChar",
    ["@markup.link.label.symbol"]   = "Identifier",
    ["@markup.link.url"]            = "Underlined",
    ["@markup.list"]                = { fg = c.blue5 }, -- For special punctutation that does not fall in the categories before.
    ["@markup.list.checked"]        = { fg = c.green1 }, -- For brackets and parens.
    ["@markup.list.markdown"]       = { fg = c.orange, bold = true },
    ["@markup.list.unchecked"]      = { fg = c.blue }, -- For brackets and parens.
    ["@markup.math"]                = "Special",
    ["@markup.raw"]                 = "String",
    ["@markup.raw.markdown_inline"] = { bg = c.terminal_black, fg = c.blue },
    ["@markup.strikethrough"]       = { strikethrough = true },
    ["@markup.strong"]              = { bold = true },
    ["@markup.underline"]           = { underline = true },
    ["@module"]                     = "Include",
    ["@module.builtin"]             = { fg = c.red }, -- Variable names that are defined by the languages, like `this` or `self`.
    ["@namespace.builtin"]          = "@variable.builtin",
    ["@none"]                       = {},
    ["@number"]                     = "Number",
    ["@number.float"]               = "Float",
    ["@operator"]                   = { fg = c.blue5 }, -- For any operator: `+`, but also `->` and `*` in C.
    -- ["@property"]                   = { fg = c.green1 },
    ["@property"]                   = { fg = c.fg },
    ["@punctuation.bracket"]        = { fg = c.fg_dark }, -- For brackets and parens.
    ["@punctuation.delimiter"]      = { fg = c.blue5 }, -- For delimiters ie: `.`
    ["@punctuation.special"]        = { fg = c.blue5 }, -- For special symbols (e.g. `{}` in string interpolation)
    ["@punctuation.special.markdown"] = { fg = c.orange }, -- For special symbols (e.g. `{}` in string interpolation)
    -- new stuff
    -- ["@string"]                     = "String",
    -- ["@string.documentation"]       = { fg = c.yellow },
    -- ["@string.escape"]              = { fg = c.magenta }, -- For escape characters within a string.
    -- ["@string.regexp"]              = { fg = c.blue6 }, -- For regexes.
    -- new stuff
    -- ["@string"]                     = { fg = "#ff8f4f" }, -- Set color for strings
    ["@string"]                     = "Function", -- Set color for strings
    ["@string.documentation"]       = { fg = c.yellow }, -- Set color for docstrings
    ["@string.escape"]              = { fg = "#ffffff" }, -- For escape characters within a string.
    ["@string.regexp"]              = { fg = c.blue6 }, -- For regexes.
    -- new stuff
    ["@tag"]                        = "Label",
    ["@tag.attribute"]              = "@property",
    ["@tag.delimiter"]              = "Delimiter",
    ["@tag.delimiter.tsx"]          = { fg = Util.blend_bg(c.blue, 0.7) },
    -- ["@tag.tsx"]                    = { fg = c.red },
    -- ["@tag.javascript"]             = { fg = c.red },
    ["@tag.tsx"]                    = { fg = c.blue2 },
    ["@tag.javascript"]             = { fg = c.blue2 },
    ["@type"]                       = "Type",
    ["@type.builtin"]               = { fg = Util.blend_bg(c.blue1, 0.8) },
    ["@type.definition"]            = "Typedef",
    ["@type.qualifier"]             = "@keyword",
    ["@variable"]                   = { fg = c.fg, style = opts.styles.variables }, -- Any variable name that does not have another highlight.
    ["@variable.builtin"]           = { fg = c.red }, -- Variable names that are defined by the languages, like `this` or `self`.
    ["@variable.member"]            = { fg = c.green1 }, -- For fields.
    ["@variable.parameter"]         = { fg = c.yellow }, -- For parameters of a function.
    ["@variable.parameter.builtin"] = { fg = Util.blend_fg(c.yellow, 0.8) }, -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]
  }

  for i, color in ipairs(c.rainbow) do
    ret["@markup.heading." .. i .. ".markdown"] = { fg = color, bold = true }
  end
  return ret
end

return M
