---@class memento.Highlight: vim.api.keyset.highlight
---@field style? vim.api.keyset.highlight

---@alias memento.Highlights table<string,memento.Highlight|string>

---@alias memento.HighlightsFn fun(colors: ColorScheme, opts:memento.Config):memento.Highlights

---@class memento.Cache
---@field groups memento.Highlights
---@field inputs table
