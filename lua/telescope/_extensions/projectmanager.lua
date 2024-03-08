local projectmanager = require "projectmanager"
local util = require "projectmanager.util"
local config = require "projectmanager.config"
local template = require "projectmanager.template"
local has_telescope, telescope = pcall(require, "telescope")
local finders = require "telescope.finders"
local pickers = require "telescope.pickers"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

if not has_telescope then
    util.log("This plugin requires nvim-telescope/telescope.nvim", "ErrorMsg")
    return
end

local function projects(opts)
    opts = opts or {}
    pickers
        .new(opts, {
            results_title = "Projects",
            prompt_title = "Name",
            finder = finders.new_table {
                results = util.removeDuplicates(
                    util.concatenateTables(projectmanager.getPinnedProjects(), projectmanager.getRecentProjects())
                ),
            },
            sorter = conf.generic_sorter(opts),
            attach_mappings = function(bufnr, map)
                map({ "n", "i" }, config.options.keybinds.addToPinnedProjects, function()
                    actions.close(bufnr)
                    projectmanager.addToPinnedProjects(action_state.get_selected_entry().value)
                end)
                map({ "n", "i" }, config.options.keybinds.removeFromPinnedProjects, function()
                    actions.close(bufnr)
                    projectmanager.removeFromPinnedProjects(action_state.get_selected_entry().value)
                end)

                actions.select_default:replace(function()
                    actions.close(bufnr)
                    projectmanager.openProject(action_state.get_selected_entry().value)
                end)
                return true
            end,
        })
        :find()
end

local function templates(opts)
    opts = opts or {}
    pickers
        .new(opts, {
            results_title = "Templates",
            prompt_title = "Name",
            finder = finders.new_table {
                results = projectmanager.getTemplates(),
            },
            sorter = conf.generic_sorter(opts),
            attach_mappings = function(bufnr)
                actions.select_default:replace(function()
                    actions.close(bufnr)
                    local selection = action_state.get_selected_entry()
                    template.loadTemplate(selection.value)
                end)
                return true
            end,
        })
        :find()
end

return telescope.register_extension {
    exports = {
        projects = projects,
        templates = templates,
    },
}
