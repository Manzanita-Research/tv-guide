# tv-guide

Custom [television](https://github.com/alexpasmantier/television) channels for Manzanita Research.

Television is a fast, hackable fuzzy finder for the terminal. These channels wire it up to our tools — Linear, GitHub, and (eventually) ghostctl.

## Channels

| Channel | Command | What it does |
|---|---|---|
| `linear` | `tv linear` | Fuzzy search all Linear issues. Preview shows full detail. Enter opens in browser. |
| `my-issues` | `tv my-issues` | Same, filtered to issues assigned to you. |
| `manzanita` | `tv manzanita` | All Manzanita projects — merges local `~/code/manzanita-research/` with GitHub. Tags each as `[local + github]`, `[local only]`, or `[github only]`. |
| `ghostctl` | `tv ghostctl` | Placeholder for when ghostctl ships. |

## Install

First, install television:

```sh
brew install television
tv update-channels
```

Then symlink (or copy) the channels into your tv cable directory:

```sh
for f in channels/*.toml; do
  ln -sf "$(pwd)/$f" ~/.config/television/cable/
done
```

Verify they're registered:

```sh
tv list-channels | grep -E "linear|manzanita|my-issues|ghostctl"
```

## Requirements

- [television](https://github.com/alexpasmantier/television)
- [linctl](https://github.com/dorkitude/linctl) (for Linear channels)
- [gh](https://cli.github.com/) (for manzanita channel)
- `jq`

## Keybindings

**linear / my-issues:**
- `enter` — open issue in browser
- `assign-me` action — assign issue to yourself

**manzanita:**
- `enter` — cd into local clone
- `ctrl-o` — open on GitHub
- `ctrl-c` — clone repo locally

## Adding a channel

Drop a `.toml` file in `channels/`. See the [television cable channel docs](https://alexpasmantier.github.io/television/) for the format. The existing channels are good templates.
