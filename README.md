# My dotfiles

I use GNU stow to manage my dotfiles, following [this guide](https://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html).

Example:

```bash
# To install tmux config
stow tmux

# To install neovim config
stow nvim

# To install helper scripts (target is ~/.local/bin)
stow scripts
```
