# Sasha's Dotfiles

🚧 Work in progress

---

For myself:

## Installation

### New Machine

To set up a new machine, run:

```bash
chezmoi init --apply kossnocorp
```

### Dev Container

In VS Code, add this to the Remote settings:

```json
{
  "dotfiles.repository": "kossnocorp/dotfiles",
  "dotfiles.targetPath": "~/.local/share/chezmoi",
  "dotfiles.installCommand": "install.sh"
}
```
