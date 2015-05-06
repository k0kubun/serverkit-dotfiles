# serverkit-dotfiles

[Serverkit](https://github.com/r7kamura/serverkit) plug-in for dotfiles.

## Install

```rb
gem "serverkit-dotfiles"
```

## Resource

### dotfiles

Make sure all files in a specified directory are symlinked to home.

#### Attributes

- directory - a directory having dotfiles

#### Example

```yaml
resources:
  - type: dotfiles
    direcotry: ~/src/github.com/k0kubun/dotfiles/linked
```
