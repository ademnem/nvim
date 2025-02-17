# NVIM Configuration File
These are my current configurations for Neovim. You are more than welcome to copy if you would like but these configurations are constantly changing so copy at your own risk. I highly recommend learning on your own from the ground up for a better experience :D.

## Requirements
These will not be managed by [lazy.nvim](https://github.com/folke/lazy.nvim/tree/main)
- neovim >= 0.9.0 (recommend to download from source)
- C compiler
- ripgrep

## Future Additions
- nerd font (for my terminal)
- linter (nvim-lint)
- formatter (nvim-conform)
- rewrite lsp again 😭

## Unrelated Information
I currently use WSL2 Ubuntu on PowerShell. I find a block cursor makes the most sense for me on Vim which can be configured on PowerShell.

## Regarding the Rust LSP
My Rust LSP configuration has had issues specificially with the error code `rust-analyzer: -32802: server cancelled the request`. In order to solve this I have:
1. Rewritten the LSP config multiple times
2. Executed `mv ~/.cargo/bin/rust-analyzer ~/.backup/rust-analyzer`

The second one seems to have actually solved the issue but only time will tell.

## Configs I Learned From
- [folke's dot files](https://github.com/folke/dot)
- [LazyVim (also folke)](https://github.com/LazyVim/LazyVim)
