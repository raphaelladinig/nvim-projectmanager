command! -nargs=0 PMCreateProject lua require("projectmanager").createProject()
command! -nargs=0 PMProject lua  vim.cmd("Telescope projectmanager projects")
command! -nargs=0 PMAddToPinnedProjects lua require("projectmanager").addToPinnedProjects()
command! -nargs=0 PMPinnedProjects lua vim.cmd("Telescope projectmanager pinnedProjects") 
command! -nargs=0 PMTemplates lua vim.cmd("Telescope projectmanager templates") 
