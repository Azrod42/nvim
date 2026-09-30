# tsorabel.nvim

Configuration Neovim basée sur [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) et gérée avec `lazy.nvim`.

## Inventaire

Cette documentation liste les **53 plugins actifs** résolus par `lazy.nvim` et présents dans `lazy-lock.json`.

- **Direct** : plugin déclaré pour une fonctionnalité de cette configuration.
- **Support** : dépendance installée pour un ou plusieurs plugins.
- **Actif** ne signifie pas nécessairement chargé au démarrage : plusieurs plugins utilisent le chargement différé de `lazy.nvim`.

## Gestion et dépendances

| Plugin | Type | Utilité |
| --- | --- | --- |
| `lazy.nvim` | Direct | Gestionnaire de plugins : installation, mises à jour, verrouillage et chargement différé. |
| `plenary.nvim` | Support | Bibliothèque Lua commune utilisée notamment par Telescope, Neogit, Harpoon et Spectre. |
| `nui.nvim` | Support | Composants d'interface réutilisables pour Noice et `package-info.nvim`. |
| `nvim-web-devicons` | Support | Ajoute les icônes de fichiers dans Telescope, Dashboard et Oil. |

## Interface et navigation

| Plugin | Type | Utilité |
| --- | --- | --- |
| `dashboard-nvim` | Direct | Affiche l'écran d'accueil avec des raccourcis vers Telescope, Harpoon et la création de buffers. |
| `telescope.nvim` | Direct | Recherche interactive de fichiers, buffers, diagnostics, aide, fichiers Git et résultats LSP. |
| `telescope-fzf-native.nvim` | Support | Accélère le tri flou de Telescope grâce à son extension native. |
| `telescope-ui-select.nvim` | Support | Utilise l'interface Telescope pour les sélections `vim.ui.select`. |
| `harpoon` | Direct | Enregistre une liste courte de fichiers fréquents : `<leader>a` ajoute, `<C-e>` ouvre le menu, `<leader>1`…`<leader>6` sélectionne, `<leader>h` ouvre la liste dans Telescope. |
| `leap.nvim` | Direct | Déplacement rapide vers une position visible avec `m`, `M` et `ms`. |
| `oil.nvim` | Direct | Édition du système de fichiers comme un buffer Neovim, ouverte avec `-`. |
| `vim-tmux-navigator` | Direct | Navigation cohérente entre les fenêtres Neovim et les panneaux tmux avec `<C-h/j/k/l>`. |
| `which-key.nvim` | Direct | Affiche les raccourcis disponibles après une combinaison partielle. |

## Édition et affichage

| Plugin | Type | Utilité |
| --- | --- | --- |
| `guess-indent.nvim` | Direct | Détecte automatiquement l'indentation d'un fichier. |
| `indent-blankline.nvim` | Direct | Affiche des guides verticaux d'indentation, y compris sur les lignes vides. |
| `mini.nvim` | Direct | Active `mini.ai`, `mini.surround` et `mini.statusline` pour les text objects, les entourages et la barre de statut. |
| `nvim-autopairs` | Direct | Insère automatiquement les parenthèses, crochets, accolades et guillemets fermants. |
| `nvim-treesitter` | Direct | Analyse syntaxique utilisée pour la coloration, l'indentation et plusieurs intégrations. |
| `todo-comments.nvim` | Direct | Met en évidence les annotations telles que `TODO`, `FIXME` et `NOTE`. |
| `vim-visual-multi` | Direct | Permet l'édition multi-curseurs et multi-sélections. |
| `nvim-spectre` | Direct | Recherche et remplacement multi-fichiers avec aperçu. |
| `carbon-now.nvim` | Direct | Génère une capture de code via Carbon depuis une sélection visuelle (`<leader>cs`). |
| `vim-wakatime` | Direct | Mesure automatiquement le temps passé à coder avec WakaTime. |
| `tokyonight.nvim` | Direct | Fournit le thème actif `tokyonight-night`. |
| `noice.nvim` | Direct | Remplace et enrichit l'affichage de la ligne de commande, des messages et de certaines fenêtres LSP. |
| `nvim-notify` | Support | Affiche les notifications utilisées par Noice. |

## Complétion et IA

| Plugin | Type | Utilité |
| --- | --- | --- |
| `blink.cmp` | Direct | Moteur principal de complétion : LSP, chemins, snippets, buffer, Lua, Nerd Fonts, emoji et Dadbod (SQL). |
| `LuaSnip` | Support | Moteur d'expansion de snippets utilisé par Blink. |
| `friendly-snippets` | Support | Collection de snippets prédéfinis pour de nombreux langages et frameworks. |
| `blink-emoji.nvim` | Support | Ajoute une source de complétion emoji dans Markdown et les commits Git. |
| `blink-nerdfont.nvim` | Support | Ajoute une source de complétion pour les icônes Nerd Fonts. |
| `copilot.lua` | Direct | Active les suggestions GitHub Copilot en ligne (acceptées avec `<Tab>`) et son panneau de propositions. |

## LSP, langages et qualité

| Plugin | Type | Utilité |
| --- | --- | --- |
| `nvim-lspconfig` | Direct | Configure les serveurs LSP pour la navigation, les diagnostics et les actions de code. |
| `mason.nvim` | Direct | Installe et gère les outils externes utilisés par Neovim. |
| `mason-lspconfig.nvim` | Support | Relie Mason à la configuration LSP native de Neovim. |
| `mason-tool-installer.nvim` | Support | Installe automatiquement les serveurs et outils déclarés, dont `stylua`, `biome` et `eslint_d`. |
| `fidget.nvim` | Support | Affiche la progression et l'état des serveurs LSP. |
| `lazydev.nvim` | Direct | Améliore le LSP Lua pour la configuration Neovim et les bibliothèques déclarées. |
| `luvit-meta` | Support | Fournit les types Lua de `vim.uv` à LazyDev. |
| `typescript-tools.nvim` | Direct | Ajoute une intégration TypeScript dédiée basée sur `tsserver`. |
| `nvim-ts-autotag` | Direct | Ferme et renomme automatiquement les balises HTML, JSX et TSX. |
| `zig.vim` | Direct | Ajoute le support de syntaxe et de fichiers pour Zig. |
| `conform.nvim` | Direct | Formate les buffers à la sauvegarde avec Biome, Stylua, Gofmt ou Rustfmt selon le type de fichier. |
| `nvim-lint` | Direct | Lance `eslint_d` sur JavaScript, TypeScript, JSX et TSX (ignoré tant que l'exécutable n'est pas installé). |
| `package-info.nvim` | Direct | Affiche les versions de dépendances dans les fichiers `package.json`. |

## Git

| Plugin | Type | Utilité |
| --- | --- | --- |
| `gitsigns.nvim` | Direct | Affiche les changements Git dans la marge et fournit staging, reset, aperçu, diff et blame par hunk. |
| `neogit` | Direct | Fournit une interface Git interactive dans Neovim. |
| `diffview.nvim` | Support | Ajoute la vue de diff utilisée par Neogit. |

## Bases de données et API

| Plugin | Type | Utilité |
| --- | --- | --- |
| `vim-dadbod` | Direct | Exécute des requêtes sur différentes bases de données depuis Vim et Neovim. |
| `vim-dadbod-ui` | Direct | Ajoute une interface de navigation et de gestion des connexions Dadbod. |
| `vim-dadbod-completion` | Support | Complète les schémas, tables et colonnes dans les buffers SQL. |
| `kulala.nvim` | Direct | Exécute les requêtes HTTP écrites dans les fichiers `.http` (`<leader>rr`). Épinglé en v6.31.1 : les versions suivantes exigent une licence payante. |
| `grpc-nvim` | Direct | Envoie des requêtes gRPC depuis Neovim. |

## Fonctionnalités locales

Certaines fonctionnalités ne reposent pas sur un plugin externe :

| Fonctionnalité | Emplacement | Utilité |
| --- | --- | --- |
| `Floaterminal` | `lua/plugins/floaterminal.lua` | Terminal flottant réutilisable, ouvert avec `<leader>tt`. |
| Détection `gotmpl` | `init.lua`, `ftplugin/` | Type de fichier Go templates (`go.work` est détecté nativement) et règles de commentaire locales. |
| Raccourcis de buffers et quickfix | `init.lua`, `lua/utils/buffer.lua` | Fermeture de buffers, splits et redimensionnement avec `<C-flèches>`. La navigation quickfix utilise `]q` / `[q` natifs. |

## Configurations désactivées

Ces plugins apparaissent dans des fichiers d'exemple ou dans des blocs commentés, mais ne font pas partie des 53 plugins actifs :

| Plugin ou module | État |
| --- | --- |
| `kickstart.plugins.debug` et ses plugins DAP | Module conservé mais non importé dans `init.lua`. |
| `kickstart.plugins.neo-tree` | Module conservé mais non importé dans `init.lua`. |
| `kickstart.plugins.gitsigns` | Variante Kickstart non importée ; `gitsigns.nvim` reste actif via `lua/plugins/gitsigns.lua`. |
| `catppuccin` | Thème alternatif commenté ; le thème actif est Tokyo Night. |
| `copilot.vim` et `copilot-cmp` | Alternatives commentées ; `copilot.lua` est actif. |

## Vérification

Pour contrôler la liste résolue par Lazy :

```sh
nvim --headless \
  "+lua local p=require('lazy.core.config').plugins; local n={}; for k in pairs(p) do table.insert(n,k) end; table.sort(n); print(#n); print(table.concat(n, '\n'))" \
  +qa
```

Le fichier `lazy-lock.json` verrouille les versions exactes installées ; il est versionné pour pouvoir reproduire l'installation (`:Lazy restore`).
