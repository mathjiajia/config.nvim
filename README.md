# config.nvim

My personal NeoVim configuration files on &#63743; macOS (apple silicon).

This setup is mainly used for taking notes and writing documents in LaTeX.

## Structure

```txt
├── LICENSE
├── LuaSnips
├── README.md
├── after
│   ├── ftplugin
│   └── plugin
├── colors
├── ginit.vim
├── init.lua
├── lazy-lock.json
├── lua
│   ├── plugins
│   ├── plugins.lua
│   └── snips
├── plugin
│   ├── 1-options.lua
│   └── 2-lazy.lua
└── spell
```

- `init.lua` -- entrance of the configuration
- `lua/plugins.lua` -- main plugin config module
- `lua/plugins` -- submodules for different plugins
- `lua/snips` -- a folder of utility functions for snippets
- `after/ftplugin` -- individual file type settings
- `after/plugin` -- some plugins no need to load early
- `plugin/1-options.lua` -- general settings and options
- `plugin/2-lazy.lua` -- setup `lazy.nvim`
- `LuaSnips` -- useful snippets for different languages
