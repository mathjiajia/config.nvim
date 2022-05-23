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
├── LICENSE
├── README.md
├── after
│   └── ftplugin
│       ├── gitcommit.lua
│       ├── markdown.lua
│       ├── python.lua
│       ├── qf.lua
│       └── tex.lua
├── colors
├── ginit.vim
├── init.lua
├── lua
│   ├── configs
│   │   ├── cmp.lua
│   │   ├── comment.lua
│   │   ├── copilot.lua
│   │   ├── fidget.lua
│   │   ├── gitsigns.lua
│   │   ├── heirline.lua
│   │   ├── indentline.lua
│   │   ├── latex.lua
│   │   ├── luasnip.lua
│   │   ├── neorg.lua
│   │   ├── outline.lua
│   │   ├── pairs.lua
│   │   ├── session.lua
│   │   ├── surround.lua
│   │   ├── telescope.lua
│   │   ├── terminal.lua
│   │   ├── tree.lua
│   │   └── treesitter.lua
│   ├── lsp
│   ├── plugins.lua
│   └── utils
│       ├── colors.lua
│       ├── hsluv.lua
│       └── latex.lua
├── luasnippets
│   ├── all.lua
│   ├── gitcommit.lua
│   ├── lua.lua
│   ├── markdown.lua
│   ├── norg.lua
│   └── tex
├── plugin
│   ├── autocmds.lua
│   ├── keymaps.lua
│   ├── options.lua
│   └── packer_compiled.lua
└── spell
```

- `keybinds.lua` -- Various keymaps
- `plugins.lua` -- Neovim plugins installed
- `options.lua` -- General settings and options
- `configs` -- A folder full of the configurations needed for each individual plugin,
  stored in the form `config/[pluginName].lua`
- `lsp` -- configurations for each language serves
