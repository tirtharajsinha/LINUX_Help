#### Install arch linux - https://www.learnlinux.tv/how-to-install-arch-linux-a-comprehensive-step-by-step-guide/


## Pacman cheatsheet

### Common commands

| `pacman -Syu <pkg>`     | Install (and update package list) |
| ----------------------- | --------------------------------- |
| `pacman -S <pkg>`       | Install only                      |
| `pacman -Rsc <pkg>`     | Uninstall                         |
| `pacman -Ss <keywords>` | Search                            |
| `pacman -Syu`           | Upgrade everything                |

### Query

| `pacman -Qe`         | List explictly-installed packages      |
| -------------------- | -------------------------------------- |
| `pacman -Ql <pkg>`   | What files does this package have?     |
| `pacman -Qii <pkg>`  | List information on package            |
| `pacman -Qo <file>`  | Who owns this file?                    |
| `pacman -Qs <query>` | Search installed packages for keywords |

### Orphans

|                               |                             |
| ----------------------------- | --------------------------- |
| `pacman -Qdt`                 | List unneeded packages      |
| `pacman -Rns $(pacman -Qdtq)` | Uninstall unneeded packages |

Avoid orphans by using `pacman -Rsc` to remove packages, which will remove unneeded dependencies.

### Other

|                    |                            |
| ------------------ | -------------------------- |
| `pactree <pkg>`    | What does _pkg_ depend on? |
| `pactree -r <pkg>` | What depends on _pkg_?     |


### manjaro Error*
```error: failed to synchronize all databases (download library error)```

```
sudo pacman-mirrors -f5 && sudo pacman -Syyu
sudo pamac update --force-refresh
```