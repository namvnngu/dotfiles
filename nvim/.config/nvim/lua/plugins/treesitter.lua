return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdateSync" },
    main = "nvim-treesitter.configs",
    opts = {
      -- A list of parser names, or "all" (the five listed parsers should always be installed)
      ensure_installed = {},

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,

      -- List of parsers to ignore installing (or "all")
      ignore_install = {},

      highlight = {
        enable = true,

        disable = function(_, bufnr)
          return vim.api.nvim_buf_line_count(bufnr) >= 1000
        end,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },

      -- Indentation based on treesitter for the = operator
      indent = {
        enable = true,
      },

      autotag = {
        enable = true,
      },
    },
  },
}
