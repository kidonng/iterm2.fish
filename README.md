# ℹ️🐟 iTerm2.fish

[Fish](https://fishshell.com/) plugin for [iTerm2 Shell Integration](https://iterm2.com/documentation-shell-integration.html).

Advantages over plain `source ~/.iterm2_shell_integration.fish`:

- Functions are lazily loaded
- External programs replaced with faster Fish built-ins
- Managed as a plugin, can be installed or disabled via plugin managers
- No global `$iterm2_hostname` (cache variable for `hostname`) unless manually set

## Installation

- [plug.fish](https://github.com/kidonng/plug.fish)

  ```sh
  plug install kidonng/iterm2.fish
  ```

- [Fisher](https://github.com/jorgebucaran/fisher)

  ```sh
  fisher install kidonng/iterm2.fish
  ```
