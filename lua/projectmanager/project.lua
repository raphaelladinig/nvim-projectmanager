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

function M.addToPinnedProjects()
    vim.ui.select(recentProjects, {
        prompt = "Select Project",
    }, function(projectname)
        if projectname ~= nil then
            if not util.isDuplicate(projectname, pinnedProjects) then
                table.insert(pinnedProjects, projectname)
                util.tableToFile(pinnedProjectsFile, pinnedProjects)
            end
            util.log("added " .. projectname, "NormalMsg")
        else
            util.log("please select a project", "ErrorMsg")
        end
    end)
end

function M.removeFromPinnedProjects()
    vim.ui.select(pinnedProjects, {
        prompt = "Select Project",
    }, function(projectname)
        if projectname ~= nil then
            for i, v in ipairs(pinnedProjects) do
                if v == projectname then
                    table.remove(pinnedProjects, i)
                    util.tableToFile(pinnedProjectsFile, pinnedProjects)
                    break
                end
            end
            util.log("removed " .. projectname, "NormalMsg")
        else
            util.log("please select a project", "ErrorMsg")
        end
    end)
end

function M.createProject()
    vim.ui.input({ prompt = "Project name: " }, function(projectname)
        if projectname ~= nil then
            vim.fn.mkdir(config.options.default_project_dir .. projectname, "p")
            addToRecentProjects(projectname)
            util.log("created " .. projectname, "NormalMsg")
        else
            util.log("please enter a name", "ErrorMsg")
        end
    end)
end

function M.openProject()
    vim.ui.select(recentProjects, {
        prompt = "Select Project",
    }, function(projectname)
        if projectname ~= nil then
            vim.cmd("cd " .. config.options.default_project_dir .. projectname)
            addToRecentProjects(projectname)
            util.log("opened " .. projectname, "NormalMsg")
        else
            util.log("please select a project", "ErrorMsg")
        end
    end)
end

function M.loadTemplate()
    vim.ui.select(vim.fn.readdir(config.options.template_dir), {
        prompt = "Select Template",
    }, function(templatename)
        if templatename ~= nil then
            vim.cmd("! cp -r " .. config.options.template_dir .. templatename .. " " .. config.options.default_project_dir)
            util.log("loaded " .. templatename, "NormalMsg")
        else
            util.log("please select a template", "ErrorMsg")
        end
    end)
end

return M
