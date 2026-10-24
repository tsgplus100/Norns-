-- conceptos
-- frases automáticas habladas
--
-- E1 tema
-- E2 tono de voz
-- E3 cada cuánto habla
--    (modo automático)
-- K2 decir una frase nueva
-- K3 modo automático on/off
--
-- más opciones en
-- PARAMETERS > CONCEPTOS
--
-- necesita espeak-ng y sox
-- (los instala el script
-- speech, o por ssh:
-- sudo apt install
--   espeak-ng sox)
--
-- las palabras están en
-- lib/temas.lua: ¡edítalas!

local temas = include("lib/temas")
local frases = include("lib/frases")

local DATA_DIR = _path.data .. "conceptos/"
local AUDIO_DIR = _path.audio .. "conceptos/"

local VOCES = { "es", "es-419" }
local VELOCIDAD_NOMBRES = { "reversa", "0.5x", "0.75x", "1x", "1.5x", "2x" }
local VELOCIDADES = { -1, 0.5, 0.75, 1, 1.5, 2 }
local INTERVALO_NOMBRES = { "1/2 tiempo", "1 tiempo", "2 tiempos", "1 compás",
  "2 compases", "4 compases" }
local INTERVALOS = { 0.5, 1, 2, 4, 8, 16 }   -- en tiempos (beats)

local frase = ""
local estado = "K2: frase nueva"
local ocupado = false     -- true mientras eSpeak está generando
local auto = false
local turno = 1           -- alterna entre dos archivos, para no
                          -- sobrescribir el que está sonando
local ultimo_wav = nil
local deps_ok = false

-- ---------------------------------------------------------------------------
-- sonido
-- ---------------------------------------------------------------------------

-- pone comillas seguras para la terminal alrededor de una ruta
local function comillas(s)
  return "'" .. (s:gsub("'", "'\\''")) .. "'"
end

local function hay_programa(nombre)
  return util.os_capture("command -v " .. nombre) ~= ""
end

-- convierte el texto en un .wav con eSpeak y lo pasa a 48 kHz con sox.
-- corre en segundo plano (norns.system_cmd) para que la pantalla y las
-- perillas no se congelen mientras tanto.
local function renderizar(texto, al_terminar)
  local base = DATA_DIR .. "frase" .. turno
  turno = 3 - turno
  local txt, crudo, wav = base .. ".txt", base .. ".raw.wav", base .. ".wav"

  local f = io.open(txt, "wb")
  if not f then
    al_terminar(nil, "no pude escribir el texto")
    return
  end
  -- "\1<n>R" le dice a eSpeak cuánta entonación usar (0 = robot plano)
  f:write(string.format("\1%dR", params:get("entonacion")) .. texto)
  f:close()
  os.remove(wav)

  local cmd = string.format(
    "espeak-ng -v %s -s %d -p %d -f %s -w %s && sox -G %s -r 48000 %s",
    params:string("voz"), params:get("rapidez"), params:get("tono"),
    comillas(txt), comillas(crudo), comillas(crudo), comillas(wav))

  norns.system_cmd(cmd .. " 2>&1", function()
    if util.file_exists(wav) then
      al_terminar(wav)
    else
      al_terminar(nil, "falló eSpeak")
    end
  end)
end

-- carga el .wav en el buffer de softcut y lo reproduce con la voz 1
local function sonar(wav)
  local _, muestras, sr = audio.file_info(wav)
  if not muestras or muestras == 0 then return end
  local dur = muestras / sr

  softcut.buffer_clear_region_channel(1, 0, dur + 1)
  softcut.buffer_read_mono(wav, 0, 0, -1, 1, 1)

  clock.run(function()
    clock.sleep(0.1)  -- tiempo para que el archivo termine de cargarse
    local rate = VELOCIDADES[params:get("velocidad")]
    softcut.loop_start(1, 0)
    softcut.loop_end(1, dur)
    softcut.loop(1, params:get("repetir") - 1)
    softcut.rate(1, rate)
    -- en reversa empieza desde el final
    softcut.position(1, rate < 0 and dur or 0)
    softcut.play(1, 1)
  end)
end

local function decir()
  if ocupado then return end
  if not deps_ok then
    estado = "falta espeak/sox"
    redraw()
    return
  end

  ocupado = true
  frase = frases.generar(temas, params:get("tema"), params:get("mezclar") == 2)
  estado = "pensando..."
  redraw()

  renderizar(frase, function(wav, problema)
    ocupado = false
    if wav then
      ultimo_wav = wav
      sonar(wav)
      estado = auto and "automático" or "K2: otra frase"
    else
      estado = problema
    end
    redraw()
  end)
end

local function guardar()
  if not ultimo_wav then return end
  local destino = AUDIO_DIR .. os.date("conceptos_%Y%m%d_%H%M%S") .. ".wav"
  os.execute("cp " .. comillas(ultimo_wav) .. " " .. comillas(destino))
  estado = "guardado"
  redraw()
end

-- ---------------------------------------------------------------------------
-- parámetros
-- ---------------------------------------------------------------------------

local function nombres_de_temas()
  local nombres = {}
  for i, t in ipairs(temas) do nombres[i] = t.nombre end
  return nombres
end

local function agregar_parametros()
  params:add_separator("conceptos", "CONCEPTOS")

  params:add_option("tema", "tema", nombres_de_temas(), 1)
  params:set_action("tema", function() redraw() end)
  params:add_option("mezclar", "mezclar temas", { "no", "sí" }, 1)
  params:add_option("intervalo", "automático cada", INTERVALO_NOMBRES, 4)

  params:add_option("voz", "voz", VOCES, 2)
  params:add_number("tono", "tono", 0, 99, 50)
  params:add_number("entonacion", "entonación", 0, 100, 50)
  params:add_number("rapidez", "rapidez (palabras/min)", 80, 300, 140)

  params:add_option("velocidad", "reproducción", VELOCIDAD_NOMBRES, 4)
  params:add_option("repetir", "repetir en loop", { "no", "sí" }, 1)
  params:set_action("repetir", function(x) softcut.loop(1, x - 1) end)
  params:add_control("volumen", "volumen",
    controlspec.new(0, 1, "lin", 0, 0.8, ""))
  params:set_action("volumen", function(x) softcut.level(1, x) end)

  params:add_trigger("guardar", "guardar última frase")
  params:set_action("guardar", guardar)
end

-- ---------------------------------------------------------------------------
-- norns
-- ---------------------------------------------------------------------------

function init()
  util.make_dir(DATA_DIR)
  util.make_dir(AUDIO_DIR)

  deps_ok = hay_programa("espeak-ng") and hay_programa("sox")
  if not deps_ok then estado = "falta espeak/sox" end

  softcut.reset()
  audio.level_cut(1)
  softcut.enable(1, 1)
  softcut.buffer(1, 1)
  softcut.level(1, 0.8)
  softcut.pan(1, 0)
  softcut.rec(1, 0)
  softcut.fade_time(1, 0.01)

  agregar_parametros()
  params:bang()

  -- modo automático: cada cierto número de tiempos dice una frase nueva
  clock.run(function()
    while true do
      clock.sync(INTERVALOS[params:get("intervalo")])
      if auto then decir() end
    end
  end)

  redraw()
end

function enc(n, d)
  if n == 1 then
    params:delta("tema", d)
  elseif n == 2 then
    params:delta("tono", d)
  elseif n == 3 then
    params:delta("intervalo", d)
  end
  redraw()
end

function key(n, z)
  if z == 0 then return end
  if n == 2 then
    decir()
  elseif n == 3 then
    auto = not auto
    estado = auto and "automático" or "K2: frase nueva"
    redraw()
  end
end

-- parte un texto en líneas que quepan en el ancho de la pantalla
local function partir(texto, ancho)
  local lineas, actual = {}, ""
  for palabra in texto:gmatch("%S+") do
    local prueba = actual == "" and palabra or (actual .. " " .. palabra)
    if screen.text_extents(prueba) > ancho and actual ~= "" then
      table.insert(lineas, actual)
      actual = palabra
    else
      actual = prueba
    end
  end
  if actual ~= "" then table.insert(lineas, actual) end
  return lineas
end

function redraw()
  screen.clear()
  screen.font_face(1)
  screen.font_size(8)

  -- arriba: tema, y si está en automático, cada cuánto
  screen.level(15)
  screen.move(0, 8)
  local tema = params:get("mezclar") == 2 and "mezcla" or params:string("tema")
  screen.text(tema)
  screen.move(128, 8)
  screen.level(auto and 15 or 3)
  screen.text_right(auto and params:string("intervalo") or "manual")

  -- en medio: la frase
  screen.level(12)
  for i, linea in ipairs(partir(frase, 124)) do
    if i > 4 then break end
    screen.move(2, 20 + (i - 1) * 10)
    screen.text(linea)
  end

  -- abajo: tono y estado
  screen.level(4)
  screen.move(0, 62)
  screen.text("tono " .. params:get("tono"))
  screen.move(128, 62)
  screen.text_right(estado)

  screen.update()
end

function cleanup()
  softcut.play(1, 0)
end
