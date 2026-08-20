# Tuxedo.nvim

Open [Tuxedo](https://github.com/webstonehq/tuxedo) in a floating window.

Supports Neovim 0.11+

## Installation

Install through your favourite package manager.

## vim.pack (0.12+)

```lua
vim.pack.add({
    -- Using `main` branch
    "https://github.com/RVxLab/tuxedo.nvim",

    -- If you wish to pin the version
    {
        src = "https://github.com/RVxLab/tuxedo.nvim",
        version = vim.version.range("^1.0.0"),
    },
    ...


})

require("tuxedo").setup()

-- Optional: set up a keymap
vim.keymap.set("n", "<leader>T", function ()
    require("tuxedo").tuxedo()
end, {
    desc = "Open Tuxedo",
})
```

## ZPack (0.12+)

```lua
{
    "RVxLab/tuxedo.nvim",
    
    -- Optional: If you wish to pin the version
    sem_version = "^1.0.0",

    -- Set up lazy loading with the user command
    cmd = "Tuxedo",

    -- Set up lazy loading with a keymap
    keys = {
        {
            "<leader>T",
            function () require("tuxedo").tuxedo() end,
            mode = "n",
            desc = "Open Tuxedo",
        },
    },

    ---@module "tuxedo"
    ---@type Tuxedo.Config
    opts = {},
}
```

## Lazy.nvim
```lua
{
    "RVxLab/tuxedo.nvim",
    
    -- Optional: If you wish to pin the version
    version = "^1.0.0",

    -- Set up lazy loading with the user command
    cmd = "Tuxedo",

    -- Set up lazy loading with a keymap
    keys = {
        {
            "<leader>T",
            function () require("tuxedo").tuxedo() end,
            mode = "n",
            desc = "Open Tuxedo",
        },
    },

    ---@module "tuxedo"
    ---@type Tuxedo.Config
    opts = {},
}
```

## Using my mirror

If you wish to use my [mirrored git repo](https://code.rvx.works/RVxLab/tuxedo.nvim) you need to make a couple of small changes:

### vim.pack

```diff
vim.pack.add({
    -- Using `main` branch
-   "https://github.com/RVxLab/tuxedo.nvim",
+   "https://code.rvx.works/RVxLab/tuxedo.nvim",

    -- If you wish to pin the version
    { 
-       src = "https://github.com/RVxLab/tuxedo.nvim",
+       src = "https://code.rvx.works/RVxLab/tuxedo.nvim",
        version = vim.version.range("^1.0.0"),
    },
    ...

    
})
```

### ZPack

```diff
{
-   "RVxLab/tuxedo.nvim",
+   src = "https://github.com/RVxLab/tuxedo.nvim",
    
    -- Optional: If you wish to pin the version
    sem_version = "^1.0.0",

    -- Set up lazy loading with the user command
    cmd = "Tuxedo",

    -- Set up lazy loading with a keymap
    keys = {
        {
            "<leader>T",
            function () require("tuxedo").tuxedo() end,
            mode = "n",
            desc = "Open Tuxedo",
        },
    },

    ---@module "tuxedo"
    ---@type Tuxedo.Config
    opts = {},
}
```

### Lazy.nvim

```diff
{
-   "RVxLab/tuxedo.nvim",
+   url = "https://github.com/RVxLab/tuxedo.nvim",
    
    -- Optional: If you wish to pin the version
    version = "^1.0.0",

    -- Set up lazy loading with the user command
    cmd = "Tuxedo",

    -- Set up lazy loading with a keymap
    keys = {
        {
            "<leader>T",
            function () require("tuxedo").tuxedo() end,
            mode = "n",
            desc = "Open Tuxedo",
        },
    },

    ---@module "tuxedo"
    ---@type Tuxedo.Config
    opts = {},
}
```

## Configuration

This is the default configuration:

```lua
---@module "tuxedo"
---@type Tuxedo.Config
{
    -- The command to run Tuxedo, passed to `vim.jobstart`. May be a string, string[], a function returning one of either, or `nil`
    tuxedo_cmd = "tuxedo",

    -- The size ratios for the terminal between 0 and 1
    terminal = {
        width = 0.85,
        height = 0.7,
    },

    -- The user command by which to invoke Tuxedo. Set to `nil` to disable
    command = "Tuxedo",
}
```

### Adjusting the `tuxedo_cmd` option

If you have more complex checks into determining which `tuxedo` binary to use, such as when you use [Nix](./examples/nix.lua) or [Mise](./examples/mise.lua), you can pass a function to the `tuxedo_cmd` option.

This function must return a `string`, `string[]` or `nil`.

In the case of `nil`, no floating window will be created and an error will be shown.

For an example how this is used in a config, see [tuxedo.lua in my config](https://code.rvx.works/RVxLab/rvx.nvim/src/branch/main/lua/plugins/tuxedo.lua).

### Changing the user command

You can change the user command by overriding the `command` option:

```lua
---@module "tuxedo"
---@type Tuxedo.Config
{
    command = "MyTuxedo",
}
```

*Note: If you do this when using Zpack or Lazy, make sure you also set this command in `cmd`*

## Examples

Check the [examples/](./examples) folder for some examples on how you can use this plugin.

## Acknowledgements

- [Iogamaster](https://github.com/IogaMaster) for their [tuxedo.nvim](https://github.com/IogaMaster/tuxedo.nvim) which served as a learning reference making this plugin

## License

This plugin is licensed under [MIT](./LICENSE).
