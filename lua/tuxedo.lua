---@type Tuxedo
---@diagnostic disable-next-line: missing-fields
local M = {}

M.config = {
    tuxedo_cmd = "tuxedo",
    command = "Tuxedo",
    terminal = {
        width = 0.85,
        height = 0.7,
    },
}

local win_id
local buf_id

---Wrapper around notify
---@param msg string The message to send
---@param level ?integer The log level, see `vim.log.levels`
---@param opts ?table Options for the notification. Not related to vim.notify's opts
local function notify(msg, level, opts)
    msg = "[tuxedo.nvim]: " .. msg

    opts = opts or {}

    if opts.once == true then
        vim.notify_once(msg, level)
    else
        vim.notify(msg, level)
    end
end

---Resolve the tuxedo command
---@param command Tuxedo.TuxedoCommand
---@return string|string[]|nil
local function resolve_tuxedo_command(command)
    if type(command) == "function" then
        return command()
    end

    return command
end

function M.tuxedo()
    local uis = vim.api.nvim_list_uis()

    if #uis == 0 then
        return
    end

    local width = uis[1].width
    local height = uis[1].height

    local win_width = math.ceil(width * M.config.terminal.width)
    local win_height = math.ceil(height * math.ceil(M.config.terminal.height))

    local row = math.ceil((height - win_height) / 2) - 1
    local col = math.ceil((width - win_width) / 2)

    local command = resolve_tuxedo_command(M.config.tuxedo_cmd)

    if command == nil then
        notify("No `tuxedo` command given", vim.log.levels.ERROR)

        return
    end

    buf_id = vim.api.nvim_create_buf(false, true)

    win_id = vim.api.nvim_open_win(buf_id, true, {
        relative = "editor",
        width = win_width,
        height = win_height,
        row = row,
        col = col,
        style = "minimal",
        border = "rounded",
        title = "Tuxedo",
        title_pos = "left",
    })

    vim.fn.jobstart(command, {
        term = true,
        on_exit = function()
            if win_id and vim.api.nvim_win_is_valid(win_id) then
                vim.api.nvim_win_close(win_id, true)
                win_id = nil
                buf_id = nil
            end
        end,
    })

    vim.api.nvim_set_option_value("winfixbuf", true, {
        win = win_id,
    })

    vim.api.nvim_set_option_value("bufhidden", "wipe", {
        buf = buf_id,
    })

    vim.api.nvim_set_option_value("filetype", "todo", {
        buf = buf_id,
    })

    vim.cmd("startinsert")
end

---Set up the Tuxedo plugin
---@param opts ?Tuxedo.Config
function M.setup(opts)
    if vim.fn.has("nvim-0.11") == 0 then
        notify("tuxedo.nvim requires Neovim 0.11+", vim.log.levels.ERROR, {
            once = true,
        })

        return
    end

    ---@type Tuxedo.Config
    local options = opts or {}

    M.config = vim.tbl_deep_extend("force", {}, M.config or {}, options)

    if M.config.command ~= nil then
        vim.api.nvim_create_user_command(M.config.command, function()
            M.tuxedo()
        end, {})
    end
end

return M
