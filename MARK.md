# Mark's local grepai fork

**GitHub:** https://github.com/hi-high/grepai  
**Upstream:** https://github.com/yoanbernabeu/grepai  

Fork is `ahead by 2` of upstream `main` with the harden commits. Local checkout: `~/Code/Labs/grepai-src`.

## Branch

`main` and `mark/local-harden` both point at the same tip (version `0.35.0-mark.1`).

Remotes:
- `origin` → `hi-high/grepai`
- `upstream` → `yoanbernabeu/grepai`

## Patches

1. **Atomic GOB persist** (`store/gob.go`) — temp + fsync + rename. Prevents truncate-in-place corruption.
2. **Corrupt index recovery** — undecodable `index.gob` → `index.gob.corrupt`, empty rebuild.
3. **Shutdown timeout** 2s → 90s (`cli/watch.go`).
4. **`--no-worktrees`** flag for bare (non-workspace) watches.

## Install

```bash
~/Code/Labs/grepai-src/scripts/install-local.sh
# installs to ~/.local/bin/grepai (ahead of Homebrew in interactive PATH)
```

## Always-on big projects

- SoT: `~/.grepai/big-projects.yaml`
- Ensure: `grepai-ensure` (LaunchAgent `com.markpinero.grepai-watchdog` every 10m + login)
- Doctor: `grepai-doctor`
- Add: `grepai-big-add <workspace> /abs/path`
- Stop: `grepai-stop-big`

Big projects use **Qdrant workspaces**, not GOB.
