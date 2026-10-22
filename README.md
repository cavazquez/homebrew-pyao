# PyAO: Homebrew y APT

Cliente y servidor de Argentum Online, versión **1.0.0rc5**. Instalar ambos de la misma versión. Es una candidata de pruebas publicada en el canal edge.

## macOS: Homebrew

```sh
brew tap cavazquez/pyao
brew install cavazquez/pyao/pyao-server
brew install --cask cavazquez/pyao/pyao-client
```

Soporta Apple Silicon e Intel. Los paquetes incluyen sus recursos y el servidor incluye Python privado. El cliente tiene firma ad hoc y no está notarizado; macOS puede solicitar intervención al abrir una descarga de Internet.

```sh
brew update
brew upgrade cavazquez/pyao/pyao-server
brew upgrade --cask cavazquez/pyao/pyao-client
```

## Debian y Ubuntu: APT firmado

AMD64 y ARM64; probado en Ubuntu 24.04 y Debian Trixie. La versión del paquete Debian es `1.0.0~rc5` y la versión del juego es `1.0.0rc5`.

```sh
sudo apt update
sudo apt install ca-certificates curl gpg
sudo install -d -m 755 /etc/apt/keyrings
curl --fail --location https://github.com/cavazquez/homebrew-pyao/releases/download/apt-edge/pyao-archive-key.asc | sudo tee /etc/apt/keyrings/pyao-archive-key.asc >/dev/null
printf '%s\n' 'deb [signed-by=/etc/apt/keyrings/pyao-archive-key.asc] https://github.com/cavazquez/homebrew-pyao/releases/download/apt-edge/ ./' | sudo tee /etc/apt/sources.list.d/pyao.list
sudo apt update
sudo apt install pyao-server pyao-client
```

Huella de la clave del archivo: `F4BE701E0BFCD34A5DC9DE620C074FDBDF9C1646`.

Para comprobarla antes de añadir el repositorio:

```sh
gpg --show-keys --with-fingerprint /etc/apt/keyrings/pyao-archive-key.asc
```

Los ejecutables se instalan bajo `/opt`, con lanzadores bajo `/usr`. Al desinstalar se conservan la configuración y las preferencias del usuario. La instalación no inicia el servidor ni habilita su unidad systemd de usuario.

## Redis y datos

El servidor necesita un Redis externo configurado por su operador para ejecutar partidas. Estos paquetes no instalan, inician ni reemplazan Redis. Los comandos informativos `pyao-server --version`, `--help` y `--check-resources` funcionan sin Redis. Preparar TLS y la configuración Redis antes de iniciar un servidor de juego.

## Windows: WinGet

Propuestas en revisión: [Cavazquez.PyAOServer](https://github.com/microsoft/winget-pkgs/pull/458433) y [Cavazquez.PyAOClient](https://github.com/microsoft/winget-pkgs/pull/458434). Todavía no están disponibles en el catálogo público de WinGet.

## Integridad y promoción

Las recetas y los paquetes provienen de los mismos commits y archivos aprobados en la campaña conjunta. Las descargas de producto de `v1.0.0rc5` son inmutables y sus hashes quedan en `channel-manifest.json` y `SHA256SUMS`. El índice `apt-edge` permite promover próximas candidatas tras probar el par. La clave privada APT se conserva fuera de este repositorio.

También se conserva el repositorio APT firmado completo de esta versión bajo `https://github.com/cavazquez/homebrew-pyao/releases/download/v1.0.0rc5/`. Esa URL puede reemplazar `apt-edge/` en la fuente APT para fijar la candidata; `apt-edge/` sigue el canal de pruebas. Los índices firmados y paquetes de la versión quedan disponibles aunque cambie el canal.

Proyectos: [servidor](https://github.com/cavazquez/pyao-server) y [cliente](https://github.com/cavazquez/ArgentumOnlineGodot). Microsoft Store y las botas visibles están aplazadas.

Descargas nativas manuales: [servidor 1.0.0rc5](https://github.com/cavazquez/homebrew-pyao/releases/tag/v1.0.0rc5) y [cliente 1.0.0rc5](https://github.com/cavazquez/ArgentumOnlineGodot/releases/tag/v1.0.0rc5). Los archivos de integridad son los assets `channel-manifest.json` y `SHA256SUMS` adjuntos a la release. Snapshot de los metadatos corregidos: [v1.0.0rc5-metadata.1](https://github.com/cavazquez/homebrew-pyao/tree/v1.0.0rc5-metadata.1).
