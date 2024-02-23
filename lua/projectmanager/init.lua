local config = require("projectmanager.config")
local view = require("projectmanager.view")

local M = {}

M.setup = config.setup
M.toggle = view.toggle

return M
