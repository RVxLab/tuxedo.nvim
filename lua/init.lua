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

    vim.fn.jobstart(M.config.tuxedo_cmd, {
        term = true,
        on_exit = function()
            if win_id and vim.api.nvim_win_is_valid(win_id) then
                vim.api.nvim_win_close(win_id, true)
                win_id = nil
                buf_id = nil
            end
        end,
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
    ---@type Tuxedo.Config
    local options = opts or {}

    M.config = vim.tbl_deep_extend("force", {}, M.config or {}, options)

    vim.api.nvim_create_user_command(M.config.command, function()
        M.tuxedo()
    end, {})
end

return M
