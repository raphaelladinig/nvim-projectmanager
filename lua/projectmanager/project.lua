local config = require "projectmanager.config"
local util = require "projectmanager.util"
local dataDir = vim.fn.stdpath "data" .. "/projectmanager"
local recentProjectsFile = dataDir .. "/recent_projects"
local pinnedProjectsFile = dataDir .. "/pinned_projects"
local M = {}

local recentProjects = util.tableFromFile(recentProjectsFile) or {}
local pinnedProjects = util.tableFromFile(pinnedProjectsFile) or {}

local function addToRecentProjects(projectname)
    if not util.isDuplicate(projectname, recentProjects) then
        if #recentProjects >= config.options.number_of_recent_projects then
            table.remove(recentProjects, #recentProjects)
        end
        table.insert(recentProjects, 1, projectname)
        util.tableToFile(recentProjectsFile, recentProjects)
    end
end

function M.addToPinnedProjects(projectname)
    if not util.isDuplicate(projectname, pinnedProjects) then
        table.insert(pinnedProjects, projectname)
        util.tableToFile(pinnedProjectsFile, pinnedProjects)
        util.log("pinned " .. projectname, "NormalMsg")
    else
        util.log("already pinned " .. projectname, "ErrorMsg")
    end
end

function M.removeFromPinnedProjects(projectname)
    for i, v in ipairs(pinnedProjects) do
        if v == projectname then
            table.remove(pinnedProjects, i)
            util.tableToFile(pinnedProjectsFile, pinnedProjects)
            util.log("removed " .. projectname, "NormalMsg")
        else
            util.log("not pinned " .. projectname, "ErrorMsg")
        end
    end
end

function M.createProject()
    vim.ui.input({ prompt = "Project name: " }, function(projectname)
        if projectname ~= nil then
            if string.find(projectname, "/") then
                vim.fn.mkdir(projectname, "p")
            else
                vim.fn.mkdir(config.options.default_project_dir .. projectname, "p")
            end
            addToRecentProjects(projectname)
            util.log("created " .. projectname, "NormalMsg")
        else
            util.log("please enter a name", "ErrorMsg")
        end
    end)
end

function M.openProject(projectname)
    if projectname ~= nil then
        addToRecentProjects(projectname)
        vim.cmd("cd " .. config.options.default_project_dir .. projectname)
        util.log("opened " .. projectname, "NormalMsg")
    else
        vim.ui.input({ prompt = "Project name: " }, function(projectname)
            if projectname ~= nil then
                addToRecentProjects(projectname)
                vim.cmd("cd " .. projectname)
                util.log("opened " .. projectname, "NormalMsg")
            else
                util.log("please enter a name", "ErrorMsg")
            end
        end)
    end
end

function M.getRecentProjects()
    return recentProjects
end

function M.getPinnedProjects()
    return pinnedProjects
end

function M.clearRecentProjects()
    recentProjects = {}
    util.tableToFile(recentProjectsFile, recentProjects)
    util.log "cleared project history"
end

return M
