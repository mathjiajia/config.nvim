<p>
    <a>
        <img alt="macOS" src="https://img.shields.io/badge/macOS-%23.svg?style=flat-square&logo=apple&color=grey&logoColor=white" />
    </a>
    <a href="https://github.com/neovim/neovim/releases/tag/nightly">
        <img src="https://img.shields.io/badge/Neovim-0.9-blueviolet.svg?style=flat-square&logo=Neovim&logoColor=green" alt="Neovim minimum version"/>
    </a>
    <a href="https://github.com/mathjiajia/config.nvim/search?l=lua">
      <img src="https://img.shields.io/github/languages/top/mathjiajia/config.nvim" alt="Top languages"/>
    </a>
    <a href="https://github.com/mathjiajia/config.nvim/graphs/commit-activity">
      <img src="https://img.shields.io/github/commit-activity/m/mathjiajia/config.nvim?style=flat-square" />
    </a>
    <a href="https://github.com/mathjiajia/config.nvim/graphs/contributors">
      <img src="https://img.shields.io/github/contributors/mathjiajia/config.nvim?style=flat-square" />
    </a>
    <a>
      <img src="https://img.shields.io/github/repo-size/mathjiajia/config.nvim?style=flat-square" />
    </a>
    <a href="https://github.com/mathjiajia/config.nvim/blob/master/LICENSE">
        <img src="https://img.shields.io/github/license/mathjiajia/config.nvim?style=flat-square&logo=GNU&label=License" alt="License"/>
    </a>
</p>

# config.nvim

My personal Neovim configuration files on &#63743; macOS.

This setup is mainly used for taking notes and writing documents in LaTeX.

Inspired by [How I'm able to take notes in mathematics lectures using LaTeX and Vim](https://castel.dev/post/lecture-notes-1/)
and [使用 Neovim 和 vimtex 高效撰写 LaTeX 学术论文](https://sspai.com/post/64080)

## Structure

```txt
├── LICENSE
├── LuaSnips
│   ├── all.lua
│   ├── gitcommit.lua
│   ├── lua.lua
│   ├── markdown.lua
│   ├── norg.lua
│   └── tex
├── README.md
├── after
│   ├── ftplugin
│   └── plugin
├── colors
├── ginit.vim
├── init.lua
├── lua
│   ├── configs
│   ├── plugins.lua
│   └── snips
├── plugin
│   ├── autocmds.lua
│   ├── keymaps.lua
│   ├── options.lua
│   └── packer_compiled.lua
└── spell
```

- `lua/plugins.lua` -- Neovim plugins installed
- `after/plugin` -- A folder full of the configurations needed for each individual plugin,
  stored in the form `[pluginName].lua`
- `after/plugin/lsp.lua` -- The configuration for language serves
- `plugin/keymaps.lua` -- Various keymaps
- `plugin/options.lua` -- General settings and options
- `LuaSnips` -- Useful snippets for different languages
