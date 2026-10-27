#!/bin/bash
# instalar_voces.sh
#
# instala los motores de voz que usa VOXBOX en el norns:
#   eSpeak NG (+ variantes Klatt), MBROLA, flite, SVOX Pico, Festival,
#   SAM (Commodore 64) y DECtalk.
#
# cada motor se instala por separado: si uno falla, los demás siguen.
# al final muestra un resumen. se puede correr varias veces sin problema.
#
# DECtalk se compila desde el código y puede tardar más de media hora
# en la Raspberry Pi. para saltarlo: bash instalar_voces.sh sin-dectalk

set -u

instalados=()
fallidos=()

paso() {
  local nombre="$1"
  shift
  echo
  echo "=== $nombre"
  if "$@"; then
    instalados+=("$nombre")
  else
    fallidos+=("$nombre")
  fi
}

apt_instalar() {
  sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends "$@"
}

instalar_sam() {
  local dir
  dir=$(mktemp -d)
  git clone --depth 1 https://github.com/s-macke/SAM.git "$dir/SAM" &&
    # sin SDL: el norns no la necesita, SAM solo tiene que escribir .wav
    make -C "$dir/SAM" CFLAGS="-Wall -Os" LFLAGS="" &&
    sudo install -m 0755 "$dir/SAM/sam" /usr/local/bin/sam
  local resultado=$?
  rm -rf "$dir"
  return $resultado
}

instalar_dectalk() {
  local dir=/home/we/dectalk
  rm -rf "$dir"
  git clone --depth 1 -b develop https://github.com/dectalk/dectalk.git "$dir" || return 1
  (cd "$dir/src" && ./autogen.sh && ./configure --disable-audio && make) || return 1
  [ -x "$dir/dist/say" ] || return 1
  # "say" busca sus diccionarios junto a él, así que el comando
  # "dectalk" entra a esa carpeta antes de llamarlo
  sudo tee /usr/local/bin/dectalk > /dev/null <<EOF
#!/bin/sh
cd "$dir/dist" && exec ./say "\$@"
EOF
  sudo chmod 755 /usr/local/bin/dectalk
}

echo "instalando voces para VOXBOX. esto puede tardar un rato."
sudo apt-get update

paso "sox"      apt_instalar sox
paso "eSpeak"   apt_instalar espeak-ng
paso "flite"    apt_instalar flite
paso "MBROLA"   apt_instalar mbrola
for voz in es1 es2 mx1 mx2 us1 us2 en1; do
  paso "MBROLA $voz" apt_instalar "mbrola-$voz"
done
paso "Pico"     apt_instalar libttspico-utils
paso "Festival" apt_instalar festival festvox-kallpc16k
paso "Festival español" apt_instalar festvox-ellpc11k
paso "herramientas para compilar" \
  apt_instalar build-essential git autoconf automake libtool pkg-config
paso "SAM" instalar_sam
if [ "${1:-}" != "sin-dectalk" ]; then
  paso "DECtalk" instalar_dectalk
fi

echo
echo "================================================"
echo "instalados: ${instalados[*]:-ninguno}"
echo "fallaron:   ${fallidos[*]:-ninguno}"
echo "================================================"
echo "listo. vuelve a cargar VOXBOX para que encuentre los motores nuevos."
