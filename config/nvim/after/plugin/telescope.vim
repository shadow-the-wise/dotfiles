" mru
nnoremap <leader>m <cmd>Telescope oldfiles<cr>

" find files
nnoremap <leader>ff <cmd>Telescope find_files<cr>

" help tags
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" file browser
nnoremap <leader>fb <cmd>Telescope file_browser<cr>

" nnoremap <leader>ll <cmd>:lua require("telescope.builtin").find_files({ prompt_title = "< Notes >", cwd = "$HOME/.notes", })<cr>

lua << EOF

local actions = require "telescope.actions"

require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    path_display={"smart"},
    shorten_path = true,
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",
    entry_prefix = "  ",
    initial_mode = "normal",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "vertical",
    layout_config = {
      horizontal = {
        mirror = false,
        height = 0.9,
        preview_cutoff = 120,
        prompt_position = "bottom",
        width = 0.8
      },
      vertical = {
        mirror = false,
        height = 0.9,
        preview_cutoff = 40,
        prompt_position = "bottom",
        width = 0.8

      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {"node_modules", ".git", "%.dll", "%.mkv", "%.rar", "%.zip", "%.7z", "%.tar", "%.flac", "%.tar.gz", "%.jar",  },
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = false,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  },
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
    },
  },
}

-- File Browser Extension

require("telescope").load_extension "file_browser"

-- Personal Functions

local M = {} -- Assign an empty table to the local variable M

-- Search Notes

function M.search_notes()
  require("telescope.builtin").find_files {
    cwd = "$HOME/.notes",
    prompt_title = "< Notes >",
    prompt_prefix = "❯",
    results_title = "Found Files",
    path_display = { "smart" },
  }
end

-- Since the M table is scoped, it has to be returned for usage elsewhere

return M

EOF
