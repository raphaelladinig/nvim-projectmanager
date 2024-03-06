command! -nargs=0 PMCreateProject lua require("projectmanager").createProject()
command! -nargs=0 PMAddToPinnedProjects lua require("projectmanager").addToPinnedProjects()
command! -nargs=0 PMRemoveFromPinnedProjects lua require("projectmanager").removeFromPinnedProjects()
