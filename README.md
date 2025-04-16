# NVIM Configuration File
These are my current configurations for Neovim. You are more than welcome to copy if you would like but these configurations are constantly changing so copy at your own risk. I highly recommend learning on your own from the ground up for a better experience :D.

## Requirements
These will not be managed by [lazy.nvim](https://github.com/folke/lazy.nvim/tree/main)
- neovim >= 0.9.0 (personally I use snap but downloading from source works too)
- C compiler
- ripgrep
- nerd font (I prefer [JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads))

## Future Additions
- linter (nvim-lint)
- formatter (nvim-conform)
- rewrite lsp again 😭

## Unrelated Information
I currently use WSL2 Ubuntu on PowerShell. I find a block cursor makes the most sense for me on Vim which can be configured on PowerShell.

# How to get NerdFont
If you are on Linux then you probably won't need this but just in case here is a [tutorial](https://medium.com/@almatins/install-nerdfont-or-any-fonts-using-the-command-line-in-debian-or-other-linux-f3067918a88c).

Now if you are using Windows and WSL2 then you need to download a [Nerd Font](https://www.nerdfonts.com/font-downloads).
1. unzip
2. highlight all files ending in .ttf
3. right click and hit install
4. go to Command Prompt/Windows PowerShell appearance settings and enable set the font to the font you just downloaded
    - ideally you would change the Defaults profile setting to Nerd Font so that it applies across all terminal applications

## Regarding the Rust LSP
My Rust LSP configuration has had issues specificially with the error code `rust-analyzer: -32802: server cancelled the request`. In order to solve this I have:
1. Rewritten the LSP config multiple times
2. Executed `mv ~/.cargo/bin/rust-analyzer ~/.backup/rust-analyzer`

The second one seems to have actually solved the issue but only time will tell.

## Configs I Learned From
- [folke's dot files](https://github.com/folke/dot)
- [LazyVim (also folke)](https://github.com/LazyVim/LazyVim)
