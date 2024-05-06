# config.nvim

My personal Neovim configuration files on macOS (apple silicon).

This setup is mainly used for taking notes and writing documents in LaTeX.
For the useful snippets (for mathematics, especially algebraic geometry)
see [mysnippets]

## Structure

```txt
├── LICENSE
├── README.md
├── after
│   ├── ftplugin
│   │   ├── lua.lua
│   │   └── tex.lua
│   └── plugin
│       ├── autocmds.lua
│       └── keymaps.lua
├── ginit.vim
├── init.lua
├── lazy-lock.json
├── lua
│   ├── config
│   │   ├── lazyinit.lua
│   │   └── options.lua
│   └── plugins
│       ├── coding.lua
│       ├── editor.lua
│       ├── formatting.lua
│       ├── lang.lua
│       ├── linting.lua
│       ├── lsp.lua
│       ├── ui.lua
│       └── util.lua
├── neovim.cat
├── spell
│   ├── en.utf-8.add
│   └── en.utf-8.add.spl
└── stylua.toml
```

- `init.lua` -- entrance of the configuration
- `lua/config` -- configuration files
- `lua/plugins` -- submodules for different plugins
- `after/ftplugin` -- individual file type settings
- `after/plugin` -- some plugins no need to load early

[mysnippets]: https://github.com/mathjiajia/mySnippets

## Acknowledgements

Thanks to
[folke](https://github.com/folke) and his [LazyVim](https://github.com/LazyVim) project
where I copied a lot of code.
