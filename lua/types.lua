---@module "tuxedo"

---@alias Tuxedo.TuxedoCommand string|string[]|nil|(fun(): string|string[]|nil)

---@class Tuxedo
---@field config ?Tuxedo.Resolved.Config
---@field setup fun(opts?: Tuxedo.Config): nil
---@field tuxedo fun(): nil

---@class Tuxedo.Resolved.TerminalConfig
---@field width number
---@field height number

---@class Tuxedo.Resolved.Config
---@field terminal Tuxedo.TerminalConfig
---@field tuxedo_cmd Tuxedo.TuxedoCommand
---@field command ?string
---@field todo_file Tuxedo.Resolved.TodoFile

---@class Tuxedo.Resolved.TodoFile
---@field create_if_not_exists boolean
---@field file_name string

---@class Tuxedo.TerminalConfig : Tuxedo.Resolved.TerminalConfig
---@field width ?number
---@field height ?number

---@class Tuxedo.Config : Tuxedo.Resolved.Config
---@field terminal ?Tuxedo.TerminalConfig
---@field tuxedo_cmd ?(string|string[])
---@field command ?string
---@field todo_file Tuxedo.TodoFile

---@class Tuxedo.TodoFile : Tuxedo.Resolved.TodoFile
---@field create_if_not_exists ?boolean
---@field file_name ?string
