local projectmanager = require "projectmanager"
local has_telescope, telescope = pcall(require, "telescope")

if not has_telescope then
    projectmanager.util.log("This plugin requires nvim-telescope/telescope.nvim", "ErrorMsg")
    return
end

local finders = require "telescope.finders"
local pickers = require "telescope.pickers"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local function projects(opts)
    opts = opts or {}
    pickers
        .new(opts, {
            finder = finders.new_table {
                results = projectmanager.getProjects(),
            },
            sorter = conf.generic_sorter(opts),
            attach_mappings = function(bufnr)
                actions.select_default:replace(function()
                    actions.close(bufnr)
                    local selection = action_state.get_selected_entry()
                    projectmanager.openProject(selection.value)
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
            finder = finders.new_table {
                results = projectmanager.getTemplates(),
            },
            sorter = conf.generic_sorter(opts),
            attach_mappings = function(bufnr)
                actions.select_default:replace(function()
                    actions.close(bufnr)
                    local selection = action_state.get_selected_entry()
                    projectmanager.template.loadTemplate(selection.value)
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
