# tv-guide

Custom [television](https://github.com/alexpasmantier/television) channels for the tools we actually use — Linear, GitHub orgs, and (eventually) ghostctl.

Television is a fast, hackable fuzzy finder for the terminal. These channels wire it into our workflow.

## Channels

| Channel | Command | What it does |
|---|---|---|
| `repos` | `tv repos` | Browse a GitHub org's repos merged with your local clones. Tags each as `[local + github]`, `[local only]`, or `[github only]`. |
| `linear` | `tv linear` | Fuzzy search all Linear issues. Preview shows full detail. Enter opens in browser. |
| `my-issues` | `tv my-issues` | Same, filtered to issues assigned to you. |
| `ghostctl` | `tv ghostctl` | Placeholder for when ghostctl ships. |

## Install

```sh
brew install television
tv update-channels

git clone https://github.com/manzanita-research/tv-guide.git
cd tv-guide
./install.sh
```

The install script symlinks channels into `~/.config/television/cable/`.

## Configuration

The `repos` channel reads two environment variables. Add these to your `.zshrc` / `.bashrc`:

```sh
export TV_GH_ORG="manzanita-research"    # your github org or username
export TV_CODE_DIR="$HOME/code/manzanita-research"  # where you clone repos locally
# TV_CODE_DIR defaults to ~/code/$TV_GH_ORG if unset
```

## Requirements

- [television](https://github.com/alexpasmantier/television)
- [linctl](https://github.com/dorkitude/linctl) (for Linear channels)
- [gh](https://cli.github.com/) (for repos channel)
- `jq`

## Keybindings

**repos:**
- `enter` — cd into local clone
- `ctrl-o` — open on GitHub
- `ctrl-c` — clone repo locally

**linear / my-issues:**
- `enter` — open issue in browser
- `assign-me` action — assign issue to yourself

## Adding a channel

Drop a `.toml` file in `channels/`. The existing channels are good templates. See the [television docs](https://alexpasmantier.github.io/television/) for the full cable channel spec.
