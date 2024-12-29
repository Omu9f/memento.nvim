local M = {}

M.url = "https://github.com/echasnovski/mini.trailspace"

---@type memento.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    MiniTrailspace = { bg = c.red },
  }
end

return M