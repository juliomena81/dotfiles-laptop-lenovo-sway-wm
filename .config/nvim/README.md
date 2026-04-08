# 🌙 Neovim: Native Lua & Modular IDE

Configuración de alto rendimiento centrada en la modularidad estricta y el aprovechamiento de las capacidades nativas de *Neovim 0.11+*. Optimizada para flujos de trabajo en *Arch Linux/Sway*, eliminando dependencias redundantes y priorizando la velocidad de ejecución.

<br />

## 📸 Visual Insights


<table>
  <tr>
    <td align="center" width="33%"><b>Dashboard (Alpha)</b></td>
    <td align="center" width="33%"><b>Lualine & Code</b></td>
    <td align="center" width="33%"><b>NEOTREE</b></td>
  </tr>
  <tr valign="top">
    <td><img src=".assets/alpha.jpg" width="100%"></td>
    <td><img src=".assets/lualine.jpg" width="100%"></td>
    <td><img src=".assets/neotree.jpg" width="100%"></td>
  </tr>
  <tr>
    <td align="center"><b>FZF</b></td>
    <td align="center"><b>SPLIT</b></td>
    <td align="center"><b>TERMINAL</b></td>
  </tr>
  <tr valign="top">
    <td><img src=".assets/fzf-lua.jpg" width="100%"></td>
    <td><img src=".assets/fzf-lua_split_v.jpg" width="100%"></td>
    <td><img src=".assets/toggle_term.jpg" width="100%"></td>
  </tr>
</table>

<br />

## 🚀 Componentes Principales

* **Gestor**: ``lazy.nvim`` para una carga rápida y gestión de dependencias.
* **Buscador**: ``fzf-lua`` con previsualización vía ``bat`` e integración de diffs con ``delta``.
* **Explorador**: ``Neo-tree`` (v3.x) con monitorización de archivos vía ``libuv``.
* **LSP & Sintaxis**: ``nvim-treesitter`` para análisis sintáctico incremental.
* **Estética**: Tema ``Catppuccin Mocha`` con ``lualine`` optimizada y minimalista.
* **Terminal**: ``ToggleTerm`` configurado para ergonomía de teclado español (``Ctrl + t``).
* **Documentación**: Preview de Markdown en tiempo real sincronizado con el navegador.

<br />

## 🛠️ Requisitos del Sistema

Esta configuración depende de varias herramientas externas para ofrecer funcionalidades avanzadas:

| Herramienta | Función | Relevancia |
| :--- | :---: | :---: |
| ``fzf, ripgrep, fd`` | Búsqueda de archivos y texto | **Crítico** |
| ``bat`` | Resaltado de sintaxis en previews | **Recomendado** |
| ``wl-clipboard`` | Sincronización con el portapapeles | **Crítico** |
| ``Nerd Fonts`` | Iconos en la interfaz y barra de estado | **Estético** |
| ``gcc / base-devel`` | Compilación de parsers de Treesitter | **Crítico** |
| ``nodejs / npm`` | Servidor de Markdown y motor de LSPs | **Crítico** |

<br />

## 🖥️ Core Interface

Dashboard personalizado vía **Alpha-nvim** y barra de estado **Lualine** optimizada.

<br />

## 🔭 Búsqueda Avanzada

Integración de Fzf-lua con previsualización dinámica mediante Bat.

<br />

## 📂 Estructura del Proyecto

```text
~/.config/nvim/
├── init.lua              # Punto de entrada principal
├── .gitignore            # Exclusión de archivos temporales
└── lua/
    └── usr/
        ├── core/
        │   └── setup.lua # Configuración base (Clipboard, Swaps)
        ├── plugins/
        │   ├── alpha.lua      # Dashboard de inicio
        │   ├── cmp.lua        # Motor de autocompletado
        │   ├── colorscheme.lua # Tema estético (Catppuccin)
        │   ├── format.lua     # Formateo automático de código
        │   ├── fzf.lua        # Buscador y previews
        │   ├── lint.lua       # Linter para errores de código
        │   ├── lsp.lua        # Configuración de servidores de lenguaje
        │   ├── lualine.lua    # Estética de la barra de estado
        │   ├── luasnip.lua    # Motor de snippets
        │   ├── markdown.lua   # Preview de Markdown en navegador
        │   ├── neotree.lua    # Configuración del explorador
        │   ├── toggleterm.lua # Terminal flotante (Ctrl+t)
        │   └── treesitter.lua # Motor de resaltado de sintaxis
        └── lazy.lua           # Inicialización de plugins y Leader key
```

<br />

## 🚀 Arquitectura (``lua/usr/``)

A diferencia de las configuraciones planas, este sistema separa la lógica de negocio del editor en capas desacopladas:

* ``init.lua``: Orquestador principal. Carga el core antes que el gestor de plugins.
* ``core/setup.lua``: El "motor". Contiene opciones de sistema, inyección de filetypes (Zsh/ERB) y lógica de persistencia de buffers.
* ``lazy.lua``: Bootstrap de ``lazy.nvim`` con carga perezosa (lazy-loading) agresiva.
* ``plugins/``: Micro-configuraciones atómicas. Cada plugin es un módulo independiente, facilitando el debugging y la escalabilidad.

<br />

## 🛠️ Stack Tecnológico

| Componente | Implementación | Diferencial Técnico |
| :--- | :---: | :--- |
| **LSP Engine** | ``vim.lsp.enable`` | Implementación nativa (Neovim 0.11+) sin intermediarios pesados. |
| **Fuzzy Finder** | ``fzf-lua`` | Rendimiento superior y previsualización con ``bat`` y ``delta``. |
| **Auto-completion** | ``nvim-cmp`` | Priorización de fuentes (LSP > Snippets > Path > Buffer). |
| **Formatting** | ``conform.nvim`` | Formateo asíncrono con ``lsp_fallback`` y soporte multi-lenguaje. |
| **Linting** | ``nvim-lint`` | Ejecución en ``InsertLeave`` y ``BufWritePost`` para feedback instantáneo. |

<br />

## ⚙️ Automatización y Lógica Interna

Este setup incluye optimizaciones de bajo nivel para mantener el código limpio de forma invisible:

* **Inyección de Tipos**: Forzado de reconocimiento de archivos ``.zsh`` como ``sh`` para habilitar el soporte completo de ``shellcheck`` y ``bashls``.
* **Buffer Sanitization**: Implementación de un ``augroup`` que limpia automáticamente espacios en blanco al final de línea (``\s\+$``) mediante sustitución de regex antes de cada guardado, preservando la posición exacta del cursor.
* **Native Clipboard**: Integración total con ``unnamedplus`` para una sincronización fluida con el portapapeles de Wayland/X11.

<br />

## ⌨️ Workflow Estratégico (Keymaps)

| Categoría | Atajo | Acción |
| :--- | :---: | :--- |
| Navegación | ``<leader>ff`` | Búsqueda difusa de archivos (``fzf-lua``) |
| Contexto | ``<leader>fg`` | Live Grep con soporte de ``ripgrep`` |
| LSP |  ``gd`` | Go to Definition (Nativo) |
| LSP |	``K`` |	Hover Documentation |
| AI/Tools | ``<leader>ca`` | Code Actions dinámicas |

<br />

## 📦 Despliegue

Diseñado para ser gestionado mediante el método de Bare Repository.

### 1. Instalar dependencias del sistema
```bash
sudo pacman -S --needed git base-devel fzf ripgrep fd bat ttf-jetbrains-mono-nerd wl-clipboard nodejs npm
```

### 2. Respaldo de configuración previa

```bash
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null
```

### 3. Clonado

```bash
git clone https://github.com/tu-usuario/nvim-config.git ~/.config/nvim

# El bootstrapping de lazy.nvim se encarga de la autoinstalación
# de Mason y los servidores LSP definidos en lsp.lua.
```

<br />

## 🛠️ Troubleshooting

* **Iconos rotos**: Asegúrate de que tu terminal use una `Nerd Font` (ej. JetBrainsMono Nerd Font).
* **Error de Treesitter**: Ejecuta `:TSUpdate` dentro de Neovim para reinstalar los parsers.
* **Clipboard**: Si usas X11 en lugar de Wayland, instala `xclip` en lugar de `wl-clipboard`.
* **Terminal**: En modo terminal, usa Ctrl+h/j/k/l para moverte entre ventanas.
