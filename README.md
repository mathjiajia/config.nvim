# NOTE:

Move to [nix-darwin]

# config.nvim

My personal Neovim configuration files on macOS (apple silicon).

This setup is mainly used for taking notes and writing documents in LaTeX.
For the useful snippets (for mathematics, especially algebraic geometry)
see [mysnippets]

## Structure

```txt
├── LICENSE
├── README.md
├── ginit.vim
├── init.lua
├── lazy-lock.json
├── lua
│   └── plugins
│       ├── coding.lua
│       ├── dap.lua
│       ├── editor.lua
│       ├── lang.lua
│       ├── lsp.lua
│       ├── treesitter.lua
│       ├── ui.lua
│       └── util.lua
├── neovim.cat
├── plugin
│   ├── autocmds.lua
│   ├── keymaps.lua
│   └── options.lua
└── spell
    ├── en.utf-8.add
    └── en.utf-8.add.spl
```

- `init.lua` -- entrance of the configuration
- `lua/plugins` -- submodules for different plugins
- `plugin` -- autocmds, keymaps, options

[mysnippets]: https://github.com/mathjiajia/mySnippets
[nix-darwin]: https://github.com/mathjiajia/nix-darwin

## Acknowledgements

Thanks to [folke](https://github.com/folke) and his [LazyVim](https://github.com/LazyVim) project
where I copied a lot of code.
