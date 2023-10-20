# config.nvim

My personal NeoVim configuration files on macOS (apple silicon).

This setup is mainly used for taking notes and writing documents in LaTeX.
For the useful snippets (for mathematics, especially algebraic geometry)
see [mysnippets]

## Structure

```txt
├── LICENSE
├── README.md
├── after
│   ├── ftplugin
│   │   ├── c.lua
│   │   ├── dap-repl.lua
│   │   ├── help.lua
│   │   ├── man.lua
│   │   ├── markdown.lua
│   │   ├── norg.lua
│   │   ├── qf.lua
│   │   └── tex.lua
│   ├── plugin
│   │   ├── autocmds.lua
│   │   ├── keymaps.lua
│   │   └── lastplace.lua
│   └── queries
│       ├── latex
│       │   └── highlights.scm
│       └── swift
│           └── rainbow-delimiters.scm
├── colors
├── ginit.vim
├── init.lua
├── lazy-lock.json
├── lua
│   ├── config
│   │   ├── init.lua
│   │   ├── lazyinit.lua
│   │   └── options.lua
│   ├── plugins
│   │   ├── coding.lua
│   │   ├── dap.lua
│   │   ├── editor.lua
│   │   ├── lang.lua
│   │   ├── lsp.lua
│   │   ├── treesitter.lua
│   │   ├── ui.lua
│   │   └── util.lua
│   └── util
│       ├── heirline.lua
│       └── init.lua
├── spell
│   ├── en.utf-8.add
│   └── en.utf-8.add.spl
└── stylua.toml
```

- `init.lua` -- entrance of the configuration
- `lua/config` -- configuration files
- `lua/plugins` -- submodules for different plugins
- `lua/snips` -- a folder of utility functions for snippets
- `after/ftplugin` -- individual file type settings
- `after/plugin` -- some plugins no need to load early

[mysnippets]: https://github.com/mathjiajia/mySnippets

## Acknowledgements

Thanks to
[folke](https://github.com/folke) and his [LazyVim](https://github.com/LazyVim) project
where I copied a lot of code.
