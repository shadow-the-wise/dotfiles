lua << EOF

require'telescope'.load_extension('project')

vim.api.nvim_set_keymap(
        'n',
        '<leader>b',
        ":lua require'telescope'.extensions.project.project{}<CR>",
        {noremap = true, silent = true}
)

EOF
