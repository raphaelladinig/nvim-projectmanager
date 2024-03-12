local config = require "projectmanager.config"
local util = require "projectmanager.util"
local M = {}

function M.getTemplates()
    return vim.fn.readdir(config.options.template_dir)
end

function M.loadTemplate(templatename)
    vim.cmd("! cp -r " .. config.options.template_dir .. templatename .. "/. " .. vim.fn.getcwd())
    util.log("loaded " .. templatename, "NormalMsg")
end

function M.templates()
    if M.getTemplates() ~= nil then
        vim.cmd "Telescope projectmanager templates"
    else
        util.log("no templates found", "ErrorMSG")
    end
end

return M
