local config = require "projectmanager.config"
local project = require "projectmanager.project"
local template = require "projectmanager.template"
local dataDir = vim.fn.stdpath "data" .. "/projectmanager"

if dataDir then
    vim.fn.mkdir(dataDir, "p")
end

local M = {}

M.setup = config.setup
M.createProject = project.createProject
M.addToPinnedProjects = project.addToPinnedProjects
M.getTemplates = template.getTemplates
M.getRecentProjects = project.getRecentProjects
M.getPinnedProjects = project.getPinnedProjects

return M
