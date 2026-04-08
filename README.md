# 📁 Dotfiles: Arch Linux on Lenovo 💻


Configuración minimalista y de alto rendimiento optimizada para hardware AMD Mendocino. El entorno se basa en Sway con una arquitectura modular, automatización en Lua y un esquema de almacenamiento avanzado.

<br>

## 📸 Galería del Setup

<details>
  <summary>Click para ver capturas de pantalla</summary>

  ### 🖥️ Escritorio (Waybar Bottom)
  *Configuración minimalista con el panel en la parte inferior para maximizar el área de trabajo.*
  ![Desktop Setup](.config/screenshots/desktop_bottom_bar.png)

  ### 🎧 Bluetooth Dashboard (Lua), FZF & Yazi
  *Script personalizado en Lua para el control y estado de los auriculares ALE-HOP, Yazi y fzf.*
  ![Bluetooth Dash](.config/screenshots/terminales_autotiling.png)

  ### 🛠️ Lanzador de Aplicaciones
  *Wofi*
  ![Workflow](.config/screenshots/wofi.png)

</details>

<br>

## 🛠️ Stack Tecnológico & Hardware


* **Laptop:** Lenovo (AMD Ryzen con **Radeon 610M** Graphics).

* **OS:** [Arch Linux](https://archlinux.org) (Repos: Core, Extra, [**Chaotic-AUR**](https://github.com/chaotic-aur)).

* **AUR Helper:** `paru`.

* **WM:** [Sway](https://github.com/swaywm/sway) + **Autotiling** (gestión dinámica de ventanas).

* **Shell:** `zsh` + `starship` + `JetBrainsMono NF`.

* **File Manager:** `yazi` (CLI).

* **Audio:** `mpd` + `ncmpcpp` + `pipewire`.

<br>

## 🏗️ Sistema de Archivos & Seguridad

Instalación profesional orientada a la resiliencia de datos y seguridad:

* **Cifrado:** **LUKS** (Full Disk Encryption).

* **Memoria:** **ZRAM** para compresión de RAM + **Swapfile** de respaldo.

* **FS: BTRFS** con una estructura de subvolúmenes optimizada para snapshots:

 * `@` (root) y `@home` (datos de usuario).

 * `@log` y `@cache` (excluidos de snapshots para ahorrar espacio).

 * `@libvirt` (aislamiento para VMs).
# 📁 Dotfiles: Arch Linux on Lenovo (AMD Mendocino)

**Sway WM | Btrfs + LUKS | Lua Automation**

Entorno minimalista de alto rendimiento optimizado para la Radeon 610M. Una arquitectura modular diseñada para la movilidad, la resiliencia de datos y la automatización mediante scripts nativos en Lua.

## 📸 Visuals

<details>
  <summary>Click para ver capturas de pantalla</summary>

  ### 🖥️ Escritorio (Waybar Bottom)
  *Configuración minimalista con el panel en la parte inferior para maximizar el área de trabajo.*
  ![Desktop Setup](.config/screenshots/desktop_bottom_bar.png)

  ### 🎧 Bluetooth Dashboard (Lua), FZF & Yazi
  *Script personalizado en Lua para el control y estado de los auriculares ALE-HOP, Yazi y fzf.*
  ![Bluetooth Dash](.config/screenshots/terminales_autotiling.png)
</details>

<br />

## ⚙️ Core Stack

| Componente | Herramienta | Nota |
| :--- | :---: | :--- |
| **WM** | [Sway](https://github.com/swaywm/sway) | Wayland nativo con Autotiling dinámico. |
| **Shell** | ``zsh`` + ``starship`` | Integración con ``zoxide`` y ``fzf``. |
| **File Manager** | ``yazi`` | Gestión de archivos vía CLI con preview de imágenes.|
| **Audio** | ``pipewire`` + ``mpd``	| Control asíncrono mediante servicios de usuario. |
| **AUR Helper** | ``paru`` | Escrito en Rust, rápido y seguro. |

<br />

## 🏗️ Storage & Resilience (Btrfs + LUKS)

Esquema de particionado profesional orientado a snapshots y seguridad:

* **Cifrado:** Full Disk Encryption vía **LUKS**.

* **Estructura de Subvolúmenes:**

  * ``@`` & ``@home``: Sistema y datos.

  * ``@snapshots``: Recuperación inmediata del sistema.

  * ``@log``, ``@cache``, ``@tmp``: Excluidos de snapshots para optimizar el espacio.

  * ``@libvirt``: Aislamiento para virtualización.

  * **Optimización: ZRAM** activa para gestión eficiente de memoria en el Ryzen 5.

<br />

## 🚀 Automation & Logic (Lua + Systemd)

He sustituido la fragilidad de los scripts en Bash por lógica robusta en Lua integrada en el ciclo de vida del sistema:

* ``volume-adjust.lua``: Ajuste automático de ganancia al detectar auriculares **ALE-HOP**.
* ``network-aware.lua``: Monitorización de bajo nivel de la **MediaTek MT7921** (``/proc/net/dev``).
* ``bt-mpd-handler.service``: Servicio de Systemd que orquestra la música y la configuración de hardware al vuelo.

<br />

## 📂 Modular Config (.config/)

Estructura fragmentada para un mantenimiento atómico:

* ``sway/``: Dividido en módulos (``binds``, ``appearance``, ``hardware``).
* ``chromium-flags.conf``: Forzado de **VA-API** y Wayland nativo para la iGPU Radeon.
* ``systemd/user/``: Gestión de servicios en espacio de usuario sin privilegios de root.

<br />

## 🔄 Deployment (Bare Repo)

Gestión de dotfiles sin ensuciar el ``$HOME`` mediante el método de repositorio desnudo.

```bash
# Setup inicial
git clone --bare https://github.com/juliomena81/dotfiles-laptop-lenovo-sway-wm.git $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout
config config --local status.showUntrackedFiles no
```
 
