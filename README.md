# Ithadev's environment files

My dotfiles for macOS (with a few Linux extras), kept as plain files under
`configs/` and symlinked into place by one small script, `ithactl`.
Everything shares a single colour palette, **Silver Point Accent**: Rex's
neutral greys plus a periwinkle accent (`#b1b9f9`).

> [!WARNING]
> These are my personal settings. Read them before you apply them, and use at
> your own risk.

## Preview

![tmux with neofetch, lazydocker and btop](./assets/ss_3.png)

|                                       |                                                   |
| ------------------------------------- | ------------------------------------------------- |
| ![nvim in ghostty](./assets/ss_2.png) | ![starship prompt and ithactl](./assets/ss_1.png) |

> [!NOTE]
> These screenshots are from June 2025 and predate the Silver Point Accent
> palette and the `links.conf` version of `ithactl`.

## What's inside

| Area        | Tools                                                                                                                                                                                                                    |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Terminal    | [ghostty](https://github.com/ghostty-org/ghostty) · [wezterm](https://github.com/wez/wezterm) · [rex](https://www.superlogical.com/rex) · [tmux](https://github.com/tmux/tmux)                                           |
| Shell       | [zsh](https://github.com/zsh-users/zsh) + [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) · [starship](https://github.com/starship/starship) · [television](https://github.com/alexpasmantier/television)                |
| Editor      | [nvim](https://github.com/neovim/neovim) (LazyVim, with claudecode)                                                                                                                                                      |
| Git         | `gitconfig` with [hunk](https://github.com/modem-dev/hunk) pager and [delta](https://github.com/dandavison/delta) · [gh-dash](https://github.com/dlvhdr/gh-dash) · jgit                                                  |
| CLI         | [bat](https://github.com/sharkdp/bat) · [yazi](https://github.com/sxyazi/yazi) · [btop](https://github.com/aristocratos/btop) · [neofetch](https://github.com/dylanaraps/neofetch) · [mise](https://github.com/jdx/mise) |
| Kubernetes  | [k9s](https://github.com/derailed/k9s)                                                                                                                                                                                   |
| AI / notes  | [fabric](https://github.com/danielmiessler/fabric) · [ccstatusline](https://github.com/sirmalloc/ccstatusline) · [to-obsidian-note](https://github.com/ithaquaKr/to-obsidian-note)                                       |
| Window mgmt | [aerospace](https://github.com/nikitabobko/AeroSpace) (macOS) · i3 and picom (Linux)                                                                                                                                     |

## Quick start

```sh
git clone https://github.com/ithaquaKr/dev-environment-files.git ~/dev-environment-files
cd ~/dev-environment-files

./ithactl list          # see what is linked and what is not
./ithactl apply -n      # dry run
./ithactl apply         # link everything, never touching existing files
```

Install the tools themselves first (Homebrew, mise, and so on); this repo only
holds their configuration. `ithactl` needs nothing but bash, and 3.2 is fine.

## ithactl

`ithactl` reads [`links.conf`](./links.conf), where each line is
`name | source | destination | os`, and manages the symlinks.

| Command                    | What it does                                                                                          |
| -------------------------- | ----------------------------------------------------------------------------------------------------- |
| `ithactl list [-q]`        | Status of every config: `ok`, `missing`, `wrong`, `file`, `nosrc` or `n/a`. `-q` shows only problems. |
| `ithactl apply [NAME...]`  | Link configs (default: all for this OS). Leaves existing files alone.                                 |
| `ithactl apply -b`         | Move existing files aside as `NAME.backup-<time>`, then link.                                         |
| `ithactl apply -w`         | Overwrite existing files.                                                                             |
| `ithactl apply -n`         | Dry run.                                                                                              |
| `ithactl remove [NAME...]` | Remove symlinks that point into this repo; never deletes real files.                                  |
| `ithactl adopt NAME`       | Move an existing config into the repo and link it back.                                               |

`list` exits non-zero when something needs attention, so it doubles as a drift
check.

### Adding a tool

1. Add a line to `links.conf`, for example
   `lazygit | configs/lazygit/config.yml | ~/.config/lazygit/config.yml | any`.
2. Run `./ithactl adopt lazygit` to move the live config into the repo, or put
   the files under `configs/` yourself and run `./ithactl apply lazygit`.
3. Check the files for secrets before you commit.

## Layout

```text
.
├── configs/       # one directory per tool
├── links.conf     # source -> destination manifest
├── ithactl        # symlink manager (plain bash)
├── assets/        # screenshots
└── fonts/         # Nerd Fonts used by the terminals
```

## Secrets

Credentials never go in this repo. `zshrc` sources `~/.config/zsh/secrets.zsh`
when it exists; keep tokens and passwords there as `export` lines. The file is
not tracked. `.gitignore` also excludes `*.env`, `k9s` cluster configs and
Rex's generated type stubs.

## Contributing

Fork it and send a pull request if you find something worth improving. For
bugs or ideas, open an issue on the
[issue tracker](https://github.com/ithaquaKr/dev-environment-files/issues).

## License

MIT. See [LICENSE](./LICENSE).

---

Made with ❤️ by ithaquaKr
