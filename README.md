# My neovim config

based on https://astronvim.com/

## Usage

### Linux / Macos

```
# cleanup old
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak

# clone the repo
git clone https://github.com/gavxin/nvim ~/.config/nvim

# Done! open neovim
nvim
```

### Windows

```
# cleanup old
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak

# clone the repo
git clone https://github.com/gavxin/nvim $env:LOCALAPPDATA\nvim

# Done! open neovim
nvim
```
