# nvim-projectmanager

small plugin for project management in neovim.

!!! THIS IS STILL IN DEVELOPMENT AND NOT READY FOR USE YET. NOT ALL FEATURES ARE IMPLEMENTED. !!!

## Features

- ### PMCreateProject

  Creates a new project in the project directory and opens it in a new buffer.

- ### PMOpenProject

  Opens a project in a new buffer.

- ### PMAddToPinnedProjects

  Adds a project to the pinned projects list.

- ### PMRemoveFromPinnedProjects

  Removes a project from the pinned projects list.

- ### PMLoadTemplate

  Loads a template into the current working directory.
  You can get some templates from my [templates](https://github.com/raphaelladinig/templates).

## Installation

### Lazy

```lua
{
  "raphaelladinig/nvim-projectmanager",
  config = function()
      require("projectmanager").setup({
          default_project_dir = "/home/username/Projects",
          template_dir = "/home/username/Projects/templates",
      })
  end,
}
```

## Config

You need to set default_project_dir and template_dir in the setup function, or it won't work.

```lua
{
    default_project_dir = nil, -- absolute Path !!!
    number_of_recent_projects = 5,
    template_dir = nil, -- absolute Path !!!
}
```

## ToDo

- Rework openProject to use Telescope
