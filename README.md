# Waybar

[Russian README](README.ru.md)

Minimal Waybar configuration written in Nix.

![Minimal Waybar preview](assets/waybar-preview.png)

Workspaces are on the left, the clock is centered, and system indicators are on the right.

## Run

On GNOME, Waybar runs inside a nested Sway window:

```bash
nix run path:.
```

Close the window with `Super+Shift+E`.

On Sway, Niri, or another compatible compositor:

```bash
nix run path:.#native
```

## Files

- `default.nix`: bar layout and compositor selection
- `modules/default.nix`: module list
- `modules/*.nix`: individual module settings
- `style.css`: bar appearance
- `preview.nix`: local preview
- `flake.nix`: Nix entry points

Select the compositor in `default.nix`:

```nix
compositor = "niri"; # or "sway"
```

Restart Waybar after making changes.

## Home Manager

```nix
imports = [ inputs.my-waybar.homeManagerModules.default ];
```

`Symbols Nerd Font` must be installed for icons to display correctly.
