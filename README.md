## Dotfiles

The most amazing dotfiles you'll ever come across.

### Dependencies

- `rg (ripgrep)`
- `fzf`
- `oh-my-posh`
- `i3`
- `feh`
- `polybar`
- `neovim`
- `packer.nvim`
- `npm`
- `go`
- `rust`
- `tmux`
- `compton`
- `alacritty`

### Neovim

Install packer. Run `PackerSync`.

### tmux

Install tmux. Run `prefix + I` to install plugins.


### Ssh-agent activation

To avoid running `ssh-add ...` every time to add the key to the agent.

Run this command:

`echo 'AddKeysToAgent  yes' >> ~/.ssh/config`
