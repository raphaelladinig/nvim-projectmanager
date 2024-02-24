local config = require "projectmanager.config"
local util = require "projectmanager.util"
local dataDir = vim.fn.stdpath("data") .. "/projectmanager"
local recentProjectsFile = dataDir .. "/recent_projects"
local pinnedProjectsFile = dataDir .. "/pinned_projects"
local M = {}


local recentProjects = util.tableFromFile(recentProjectsFile) or {}
local pinnedProjects = util.tableFromFile(pinnedProjectsFile) or {}


local function addToRecentProjects(projectname)
    if not util.isDuplicate(projectname, recentProjects) then
        if #recentProjects >= config.options.number_of_recent_projects then
            -- Remove the oldest project if the limit is reached
            table.remove(recentProjects, #recentProjects)
        end
        table.insert(recentProjects, 1, projectname)
        util.tableToFile(recentProjectsFile, recentProjects)
    end
end

function M.addToPinnedProjects(projectname)
    if not util.isDuplicate(projectname, pinnedProjects) then
        table.insert(pinnedProjects, 1, projectname)
        util.tableToFile(pinnedProjectsFile, pinnedProjects)
    end
end

function M.createProject()
    vim.ui.input({ prompt = "Project name: " }, function(projectname)
        vim.fn.mkdir(config.options.default_project_dir .. projectname, "p")
        addToRecentProjects(projectname)
    end)
end

function M.openProject()
    vim.ui.select(recentProjects, {
        prompt = "Select Project",
    }, function(projectname)
        vim.cmd("cd " .. config.options.default_project_dir .. projectname)
        addToRecentProjects(projectname)
    end)
end

return M
