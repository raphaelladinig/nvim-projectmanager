# nvim-projectmanager

small plugin for project management in neovim.

## Features

- ### PMCreateProject
- ### PMOpenProject
- ### PMAddToPinnedProjects
- ### PMRemoveFromPinnedProjects
- ### PMLoadTemplate

## Installation
### Lazy
```lua
{
  "raphaelladinig/nvim-projectmanager",
  config = function()
      require("projectmanager").setup({
          project_dir = "/home/username/Projects",
          template_dir = "/home/username/Projects/templates",
      })
  end,
}
```

## Config
```lua
{
    project_dir = nil, -- absolute Path !!!
    number_of_recent_projects = 5,
    template_dir = nil, -- absolute Path !!!

}
```

## ToDo

- finish doc
- add load Template feature
