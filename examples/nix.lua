-- Using vim.pack
vim.pack.add({
    "https://code.rvx.works/RVxLab/tuxedo.nvim",
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
    src = "https://code.rvx.works/RVxLab/tuxedo.nvim",
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
