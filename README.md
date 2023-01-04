# config.nvim

My personal NeoVim configuration files on &#63743; macOS (apple silicon).

This setup is mainly used for taking notes and writing documents in LaTeX.

## Structure

```txt
├── LICENSE
├── LuaSnips
│   ├── all.lua
│   ├── gitcommit.lua
│   ├── lua.lua
│   ├── markdown.lua
│   ├── norg.lua
│   ├── python.lua
│   └── tex
│       ├── arrows.lua
│       ├── beamer.lua
│       ├── brackets.lua
│       ├── environments.lua
│       ├── misc.lua
│       ├── operators.lua
│       ├── phrases.lua
│       ├── sectioning.lua
│       ├── style.lua
│       └── symbols.lua
├── README.md
├── after
│   ├── ftplugin
│   │   ├── dap-repl.lua
│   │   ├── help.lua
│   │   ├── man.lua
│   │   ├── markdown.lua
│   │   ├── norg.lua
│   │   ├── qf.lua
│   │   └── tex.lua
│   └── plugin
│       ├── autocmds.lua
│       ├── keymaps.lua
│       └── lastplace.lua
├── colors
├── ginit.vim
├── init.lua
├── lazy-lock.json
├── lua
│   ├── config
│   │   ├── heirline.lua
│   │   ├── lazyinit.lua
│   │   ├── options.lua
│   │   ├── settings.lua
│   │   └── util.lua
│   ├── plugins
│   │   ├── coding.lua
│   │   ├── dap.lua
│   │   ├── editor.lua
│   │   ├── lang.lua
│   │   ├── lsp
│   │   │   ├── codelens.lua
│   │   │   ├── diagnostic.lua
│   │   │   ├── format.lua
│   │   │   ├── highlight.lua
│   │   │   ├── init.lua
│   │   │   ├── keymaps.lua
│   │   │   └── servers.lua
│   │   ├── treesitter.lua
│   │   ├── ui.lua
│   │   └── util.lua
│   └── snips
├── spell
└── stylua.toml
```

- `init.lua` -- entrance of the configuration
- `lua/config` -- configuration files
- `lua/plugins` -- submodules for different plugins
- `lua/snips` -- a folder of utility functions for snippets
- `after/ftplugin` -- individual file type settings
- `after/plugin` -- some plugins no need to load early
- `LuaSnips` -- useful snippets for different languages
