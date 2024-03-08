command! -nargs=0 PMCreateProject lua require("projectmanager").createProject()
command! -nargs=0 PMProjects lua  vim.cmd("Telescope projectmanager projects")
command! -nargs=0 PMTemplates lua vim.cmd("Telescope projectmanager templates") 
command! -nargs=0 PMClearRecentProjects lua require("projectmanager").clearRecentProjects()
