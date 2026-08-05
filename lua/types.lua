---@module "tuxedo"

---@class Tuxedo
---@field config ?Tuxedo.Resolved.Config
---@field setup fun(opts?: Tuxedo.Config): nil
---@field tuxedo fun(): nil

---@class Tuxedo.Resolved.TerminalConfig
---@field width number
---@field height number

---@class Tuxedo.Resolved.Config
---@field terminal Tuxedo.TerminalConfig
---@field tuxedo_cmd string|string[]
---@field command ?string

---@class Tuxedo.TerminalConfig : Tuxedo.Resolved.TerminalConfig
---@field width ?number
---@field height ?number

---@class Tuxedo.Config : Tuxedo.Resolved.Config
---@field terminal ?Tuxedo.TerminalConfig
---@field tuxedo_cmd ?(string|string[])
---@field command ?string
