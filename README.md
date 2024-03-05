# nvim-projectmanager

small plugin for project management in neovim.

## Features

- PMCreateProject
- PMOpenProject
- PMAddToPinnedProjects
- PMRemoveFromPinnedProjects
- LoadTemplate

## Installation
### Lazy
```lua
{
  "raphaelladinig/nvim-projectmanager",
  config = function()
      require("projectmanager").setup({
          default_project_dir = "/home/username/Projects",
      })
  end,
}
```

## Config
```lua
{
    default_project_dir = nil, -- absolute Path !!!
    number_of_recent_projects = 5,
    templates = nil,
}
```

## ToDo

- finish README
- finish doc
- add load Template feature
