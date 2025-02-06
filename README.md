# Catppuccin Urn
[Catppuccin](https://github.com/catppuccin) Line of themes for [Urn.](https://github.com/paoloose/urn)
| Mocha | Macchiato | Frappé | Latte |
|---------|---------|---------|---------|
| ![](assets/mocha.png) | ![](assets/macchiato.png) | ![](assets/frappe.png) | ![](assets/latte.png) |

---
## Installation
- **Clone Git repo**
```
git clone https://gitlab.com/AsahiNyan/Catppuccin-Urn-Gtk
cd Catppuccin-Urn-Gtk
```

- **Make install script executable**
```
chmod +x install.sh
```

- **Clean Urn default CSS**
cleaning the CSS means to remove all contents from the default `urn-gtk.css` theme in Urn's source code and recompile the app. The step is **Mandatory** for the themes to display properly.
You can either do this manually or by using the `--clean-css` argument with the install script.
```
./install.sh --clean-css
```

- **Install theme/s (`-h` for help)**
```
./install.sh --[variant/all]
```

## -wr?
Each theme has a normal variant and a WR variant. The WR variants only diffrence is that it will display the WR element if its specified in the split file, however if this is not specified using a WR variant will lead to potentionally having a undesired look. If you use the normal variant with a theme that has the WR element specified it will simply not display and behave as usual.

---
### Note
This is **NOT** a official Catppuccin theme, and is simply a thing i enjoyed making.
