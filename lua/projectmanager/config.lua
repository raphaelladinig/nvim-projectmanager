local M = {}

local defaults = {
    default_project_dir = nil,
    template_dir = nil,
    number_of_recent_projects = 5,
    keybinds = {
        addToPinnedProjects = "<c-p>",
        removeFromPinnedProjects = "<c-r>",
    },
}

M.options = {}

function M.setup(options)
    M.options = vim.tbl_deep_extend("force", defaults, options or {})
end

return M
