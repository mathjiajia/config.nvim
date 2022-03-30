# config.nvim

<p>
    <a>
        <img alt="macOS" src="https://img.shields.io/badge/macOS-%23.svg?style=flat-square&logo=apple&color=000000&logoColor=white" />
    </a>
    <a href="https://github.com/neovim/neovim/releases/tag/nightly">
        <img src="https://img.shields.io/badge/Neovim-0.7-blueviolet.svg?style=flat-square&logo=Neovim&logoColor=green" alt="Neovim minimum version"/>
    </a>
    <a href="https://github.com/jdhao/nvim-config/blob/master/LICENSE">
        <img src="https://img.shields.io/github/license/mathjiajia/config.nvim?style=flat-square&logo=GNU&label=License" alt="License"/>
    </a>
</p>

My personal Neovim configuration files on &#63743; macOS.

This setup is mainly used for taking notes and writing documents in LaTeX.

Inspired by [How I'm able to take notes in mathematics lectures using LaTeX and Vim](https://castel.dev/post/lecture-notes-1/)
and [使用 Neovim 和 vimtex 高效撰写 LaTeX 学术论文](https://sspai.com/post/64080)

## Structure

```txt
├── after
│   └── ftplugin
│       ├── gitcommit.lua
│       ├── markdown.lua
│       ├── norg.lua
│       ├── qf.lua
│       └── tex.lua
├── colors
│   ├── catppuccin.lua
│   ├── edge.lua
│   ├── everforest.lua
│   ├── github.lua
│   ├── gruvbox.lua
│   ├── kanagawa.lua
│   ├── moon.lua
│   ├── onedark.lua
│   ├── sonokai.lua
│   ├── tokyonight.lua
│   └── vscode.lua
├── ginit.vim
├── init.lua
├── lua
│   ├── autocmds.lua
│   ├── configs
│   │   ├── cmp.lua
│   │   ├── copilot.lua
│   │   ├── gitsigns.lua
│   │   ├── hop.lua
│   │   ├── indentline.lua
│   │   ├── latex.lua
│   │   ├── luasnip.lua
│   │   ├── neorg.lua
│   │   ├── outline.lua
│   │   ├── pairs.lua
│   │   ├── search.lua
│   │   ├── session.lua
│   │   ├── telescope.lua
│   │   ├── terminal.lua
│   │   ├── tree.lua
│   │   └── treesitter.lua
│   ├── keymaps.lua
│   ├── lsp
│   │   ├── init.lua
│   │   ├── null-ls.lua
│   │   ├── pyright.lua
│   │   ├── sumneko_lua.lua
│   │   └── texlab.lua
│   ├── options.lua
│   ├── plugins.lua
│   └── ui
│       ├── buftabline.lua
│       ├── hsluv.lua
│       ├── prompt.lua
│       ├── statusline.lua
│       └── util.lua
├── luasnippets
│   ├── all.lua
│   ├── gitcommit.lua
│   ├── lua.lua
│   ├── markdown.lua
│   ├── norg.lua
│   └── tex.lua
├── spell
│   ├── en.utf-8.add
│   └── en.utf-8.add.spl
└── vscode.vim
```

- `keybinds.lua` -- Various keymaps
- `plugins.lua` -- Neovim plugins installed
- `options.lua` -- General settings and options
- `configs` -- A folder full of the configurations needed for each individual plugin,
  stored in the form `config/[pluginName].lua`
- `lsp` -- configurations for each language serves
