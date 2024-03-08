<div align="center">
<h1>nvim-projectmanager</h1>
<img height="280" src="./assets/logo.jpg" />
</div>

---

![screenshot](./assets/screenshot-2024-03-08-16-32-36.png)

## Features

- Create, open, and manage projects

- Load templates

- Telescope integration

## Commands

- ### PMCreateProject

  Creates a new project in the default_project_dir and changes the working directory.

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
    keybinds = { -- Telescope binds
        addToPinnedProjects = "<c-p>",
        removeFromPinnedProjects = "<c-r>",
    },
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

- Write doc
- Make it possible to have Projects outside of default_project_dir
- add feature to delete Projects
- improve telescope integration
