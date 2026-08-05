# Tuxedo.nvim

Open [Tuxedo](https://github.com/webstonehq/tuxedo) in a floating window.

## Installation

Install through your favourite package manager.

*todo*

## Configuration

This is the default configuration:

```lua
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

## Acknowledgements

- [Iogamaster](https://github.com/IogaMaster) for their [tuxedo.nvim](https://github.com/IogaMaster/tuxedo.nvim) which served as a learning reference making this plugin

## License

This plugin is licensed under [MIT](./LICENSE).
