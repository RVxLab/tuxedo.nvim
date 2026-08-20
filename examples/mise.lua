-- Using vim.pack
vim.pack.add({
    "https://github.com/RVxLab/tuxedo.nvim",
    ...,
})

require("tuxedo")
    .setup({
        tuxedo_cmd = {
            "mise",
            "x",
            "github:webstonehq/tuxedo",
            "--",
            "tuxedo",
        },
    })

-- Using ZPack or Lazy
{
    "RVxLab/tuxedo.nvim",
    ---@module "tuxedo"
    ---@type Tuxedo.Config
    opts = {
        tuxedo_cmd = {
            "mise",
            "x",
            "github:webstonehq/tuxedo",
            "--",
            "tuxedo",
        },
    },
}
