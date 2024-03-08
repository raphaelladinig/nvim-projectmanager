# nvim-projectmanager

!!! WORK IN PROGRESS !!!

## Features

- Create, open, and manage projects

- Load templates

- Telescope integration

## Commands

- ### PMCreateProject

  Creates a new project in the project directory and opens it in a new buffer.

- ### PMAddToPinnedProjects

  Adds a project to the pinned projects list.

- ### PMProjects

  Opens a telescope window with all projects.

- ### PMTemplates

  Opens a telescope window with all templates.
  You can get some templates from my [templates](https://github.com/raphaelladinig/templates), or make your own.

- ### PMClearRecentProjects

  Clears the recent projects list.

## Installation

### Lazy

```lua
{
  "raphaelladinig/nvim-projectmanager",
  dependencies = {
      "nvim-telescope/telescope.nvim",
  },
  config = function()
      require("projectmanager").setup({
          default_project_dir = "/home/username/Projects",
          template_dir = "/home/username/Projects/templates",
      })
      require("telescope").load_extension("projectmanager")
  end,
}
```

## Config

You need to set default_project_dir and template_dir in the setup function, or it won't work.

```lua
{
    default_project_dir = nil, -- absolute Path !!!
    template_dir = nil, -- absolute Path !!!
    number_of_recent_projects = 5,
}
```

## API

- ### getPinnedProjects()

  Returns a list of the pinned projects.

- ### getRecentProjects()

  Returns a list of the most recent projects.

- ### getTemplates()

  Returns a list of all templates.

## ToDo

- Write doc & fix README
- Optimizations & bug fixes
- Make it possible to have Projects outside of default_project_dir
- add feature to delete Projects
- improve telescope integration
