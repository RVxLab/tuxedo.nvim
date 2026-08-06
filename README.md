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
