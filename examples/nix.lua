-- Using vim.pack
vim.pack.add({
    "https://github.com/RVxLab/tuxedo.nvim",
    ...,
})

require("tuxedo")
    .setup({
        tuxedo_cmd = {
            "nix",
            "run",
            "nixpkgs#tuxedo",
        },
    })

-- Using ZPack or Lazy
{
    src = "RVxLab/tuxedo.nvim",
    ---@module "tuxedo"
    ---@type Tuxedo.Config
    opts = {
        tuxedo_cmd = {
            "nix",
            "run",
            "nixpkgs#tuxedo",
        },
    },
}
