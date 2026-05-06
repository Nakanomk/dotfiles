-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- ~/.config/nvim/lua/config/autocmds.lua

local function make_transparent()
  local highlights = {
    "Normal",
    "NonText",
    "SignColumn",
    "EndOfBuffer",
    "MsgArea",
    "NormalNC",
    "NormalFloat",
    "FloatBorder",
    "NeoTreeNormal",
    "NeoTreeNormalNC",
    "NeoTreeEndOfBuffer",
    "NeoTreeWinSeparator",
    "StatusLine",
    "StatusLineNC",
    "WinSeparator",
    "WinBar",
    "WinBarNC",
    "Pmenu",
    "PmenuSel",
  }
  for _, hl in ipairs(highlights) do
    vim.api.nvim_set_hl(0, hl, { bg = "NONE", ctermbg = "NONE" })
  end
end

local transp_group = vim.api.nvim_create_augroup("DankColorsTransparency", { clear = true })

-- 监听两个事件：
-- 1. UIEnter: 抵抗重启时 UI 插件的覆盖
-- 2. ColorScheme: 抵抗你白天/黑夜切换时 DMS 的覆盖
vim.api.nvim_create_autocmd({ "UIEnter", "ColorScheme" }, {
  group = transp_group,
  callback = make_transparent,
})
