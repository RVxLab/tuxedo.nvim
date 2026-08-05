# Tuxedo.nvim

Open [Tuxedo](https://github.com/webstonehq/tuxedo) in a floating window.

Supports Neovim 0.11+

## Installation

Install through your favourite package manager.

## vim.pack (0.12+)

```lua
vim.pack.add({
    "https://code.rvx.works/RVxLab/tuxedo.nvim",
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

## ZPack / Lazy

*Note: ZPack requires Neovim 0.12+*

```lua
{
    -- `url` is required since it's not hosted on Github
    url = "https://code.rvx.works/RVxLab/tuxedo.nvim",

    -- Optional: If using ZPack you can use `src` instead
    -- src = "https://code.rvx.works/RVxLab/tuxedo.nvim",
    
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
    -- The command to run Tuxedo. This can be a string for a normal invocation or a table of strings if more arguments are involved.
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
