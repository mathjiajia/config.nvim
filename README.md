#

My personal Neovim configuration files on &#63743; macOS.

This setup is mainly used for taking notes and writing documents in LaTeX.

Inspired by [How I'm able to take notes in mathematics lectures using LaTeX and Vim](https://castel.dev/post/lecture-notes-1/)
and [使用 Neovim 和 vimtex 高效撰写 LaTeX 学术论文](https://sspai.com/post/64080)

## Structure

```txt
── README.md
├── after
│   └── ftplugin
│       ├── gitcommit.lua
│       ├── markdown.lua
│       ├── norg.lua
│       ├── qf.lua
│       └── tex.lua
├── colors
│   └── moon.lua
├── doc
│   ├── mydoc.txt
│   └── tags
├── ginit.vim
├── init.lua
├── lua
│   ├── autocmds.lua
│   ├── autosnippets
│   │   ├── markdown.lua
│   │   ├── norg.lua
│   │   └── tex.lua
│   ├── configs
│   │   ├── aerial.lua
│   │   ├── alpha.lua
│   │   ├── autopairs.lua
│   │   ├── bufferline.lua
│   │   ├── cmp.lua
│   │   ├── copilot.lua
│   │   ├── devicons.lua
│   │   ├── fidget.lua
│   │   ├── fterm.lua
│   │   ├── gitsigns.lua
│   │   ├── hlslens.lua
│   │   ├── hop.lua
│   │   ├── indentline.lua
│   │   ├── lualine.lua
│   │   ├── luasnip.lua
│   │   ├── neorg.lua
│   │   ├── notify.lua
│   │   ├── nvimtree.lua
│   │   ├── outline.lua
│   │   ├── session.lua
│   │   ├── surround.lua
│   │   ├── telescope.lua
│   │   ├── treesitter.lua
│   │   └── vimtex.lua
│   ├── keybinds.lua
│   ├── lsp
│   │   ├── init.lua
│   │   ├── null-ls.lua
│   │   ├── pyright.lua
│   │   ├── sumneko_lua.lua
│   │   └── texlab.lua
│   ├── options.lua
│   ├── plugins.lua
│   └── snippets
│       ├── all.lua
│       ├── gitcommit.lua
│       ├── lua.lua
│       ├── markdown.lua
│       ├── norg.lua
│       └── tex.lua
├── plugin
│   └── packer_compiled.lua
└── spell
    ├── en.utf-8.add
    └── en.utf-8.add.spl
```

- `keybinds.lua` -- Various keymaps
- `plugins.lua` -- Neovim plugins installed
- `options.lua` -- General settings and options
- `configs` -- A folder full of the configurations needed for each individual plugin, stored in the form `config/[pluginName].lua`
- `lsp` -- configurations for each language serves
