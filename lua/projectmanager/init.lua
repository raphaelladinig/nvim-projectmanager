local config = require "projectmanager.config"
local project = require "projectmanager.project"
local dataDir = vim.fn.stdpath "data" .. "/projectmanager"

if dataDir then
    vim.fn.mkdir(dataDir, "p")
end

local M = {}

M.setup = config.setup
M.createProject = project.createProject
M.openProject = project.openProject

return M
