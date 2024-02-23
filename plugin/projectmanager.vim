command! -nargs=0 CreateProject lua require("projectmanager").createProject()
command! -nargs=0 OpenProject lua require("projectmanager").openProject()
