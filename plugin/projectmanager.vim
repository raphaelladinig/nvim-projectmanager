command! -nargs=0 PMCreateProject lua require("projectmanager").createProject()
command! -nargs=0 PMOpenProject lua require("projectmanager").openProject()
command! -nargs=0 PMAddToPinnedProjects lua require("projectmanager").addToPinnedProjects()
command! -nargs=0 PMRemoveFromPinnedProjects lua require("projectmanager").removeFromPinnedProjects()
command! -nargs=0 PMLoadTemplate lua require("projectmanager").loadTemplate()
