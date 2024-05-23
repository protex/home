# Setup
## Install Nix
* Recommended install using [determinate nix-installer](https://github.com/DeterminateSystems/nix-installer)

## Clone and install
* Clone the repo into a config directory
* Install using the following command
```
$ nix run nix-darwin -- switch --flake .
```

## Secrets
I do not wish to store my personal information in these files. So, I've configured some "secret" files in a few different places. These files will need to be manually created.

| Secret location                  | Where it's set up | example                |
|----------------------------------|-------------------|------------------------|
| ~/.config/git/.secret/.gitconfig | git/git.nix       | git/.gitconfig.example |
