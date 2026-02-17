# iB-theme for CotEditor

IBM-inspired themes for CotEditor (macOS) based on the IBM Carbon Design System. This package provides both dark and light variants.

## Requirements

- **CotEditor 2.0+** (macOS)
- Themes use the `.cottheme` format (JSON)

## Installation

### Method 1: Import via CotEditor

1. Open **CotEditor**
2. Go to **CotEditor > Settings** (or **Preferences**)
3. Open the **Appearance** pane
4. Under the theme list, click the **gear icon** and choose **Import…**
5. Select `ib-theme-dark.cottheme` and/or `ib-theme-light.cottheme` from the `coteditor` directory of the cloned repository
6. The themes will appear in the theme list; select one to use it

### Method 2: Install script (macOS)

Copy the theme files into CotEditor’s application support directory:

```bash
cd coteditor
chmod +x install-coteditor.sh
./install-coteditor.sh
```

Then in CotEditor, open **Settings** (or **Preferences**) **> Appearance** and choose **iB-theme Dark** or **iB-theme Light** from the theme list.

### Method 3: Manual copy

Copy the `.cottheme` files into CotEditor’s theme folder (if your CotEditor version uses it):

- **macOS**: `~/Library/Application Support/CotEditor/Themes/`

Create the `Themes` directory if it does not exist. Restart CotEditor if the new themes do not appear.

## Files

- `ib-theme-dark.cottheme` – Dark theme (IBM Carbon)
- `ib-theme-light.cottheme` – Light theme (IBM Carbon)

## Color palette

Aligned with the main iB-theme palette (see the project [README](../README.md)): IBM Gray 100/90 for backgrounds, IBM White/Gray 100 for text, IBM Blue 60 for accent, and Carbon colors for syntax (strings, keywords, functions, types, numbers, etc.).

## License

GPL v3+. See the [LICENSE](../LICENSE) file in the project root.

## Project

Part of [iB-theme](https://github.com/JohnThre/iB-theme) – IBM-inspired themes for multiple editors.
