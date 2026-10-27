-- VOXBOX 1.0
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
-- PARAMETERS > VOXBOX
-- (idioma, voz, loop...)
--
-- necesita espeak-ng y sox
-- (los instala el script
-- speech, o por ssh:
-- sudo apt install
--   espeak-ng sox)
--
-- todo está en este archivo:
-- las palabras en español y
-- en inglés están más abajo,
-- ¡edítalas!

-- ===========================================================================
-- PALABRAS EN ESPAÑOL
-- ===========================================================================
local TEMAS_ES = (function()
  -- las palabras con las que VOXBOX arma sus frases.
  -- edita esta parte en maiden para crear tus propios temas:
  -- copia un tema completo, cámbiale el nombre y las palabras.
  --
  -- la idea de estos temas es rozar las ideas sin nombrarlas:
  -- nada de "cuántico", "conciencia", "universo", "algoritmo",
  -- "energía" ni "dimensión". que la referencia se adivine.
  --
  -- reglas para que las frases suenen bien:
  --
  --   sustantivos       van con su género: { "umbral", "m" } o { "huella", "f" }.
  --                     evita los femeninos que empiezan con "a" tónica
  --                     (alma, habla, álgebra): llevan "el" y el script
  --                     les pondría "la".
  --   adjetivos         van en masculino y femenino: { "lento", "lenta" }.
  --                     si es igual en los dos, repítelo: { "doble", "doble" }.
  --   verbos            en tercera persona, sin objeto: "se bifurca", "duda".
  --                     evita que empiecen con "no": hay plantillas que ya
  --                     ponen palabras antes.
  --   transitivos       en tercera persona, y van seguidos de una cosa:
  --                     "mide" -> "la mirada mide el umbral".
  --   circunstancias    dónde, cuándo o cómo: "mientras nadie mira".

  local temas = {

    -- superposición, medición, entrelazamiento, la rendija doble...
    -- sin decir ninguna de esas palabras
    {
      nombre = "lo no medido",
      sustantivos = {
        { "testigo", "m" }, { "umbral", "m" }, { "desvío", "m" }, { "eco", "m" },
        { "intervalo", "m" }, { "gemelo", "m" }, { "salto", "m" },
        { "mirada", "f" }, { "indecisión", "f" }, { "distancia", "f" },
        { "amplitud", "f" }, { "huella", "f" }, { "rendija", "f" },
        { "probabilidad", "f" },
      },
      adjetivos = {
        { "indeciso", "indecisa" }, { "simultáneo", "simultánea" },
        { "hermanado", "hermanada" }, { "no observado", "no observada" },
        { "borroso", "borrosa" }, { "discontinuo", "discontinua" },
        { "doble", "doble" }, { "provisional", "provisional" },
        { "inacabado", "inacabada" },
      },
      verbos = {
        "se decide", "duda", "se bifurca", "titubea", "ocurre a medias",
        "se desdobla", "se anula", "persiste en dos sitios", "se borra al ser visto",
      },
      transitivos = {
        "mide", "elige", "contamina", "decide", "duplica", "deshace",
        "toca sin tocar", "adivina",
      },
      circunstancias = {
        "antes de cualquier medición", "mientras nadie mira",
        "en dos lugares a la vez", "del otro lado de la rendija",
        "a una distancia que no separa", "en el instante previo a elegir",
        "sin causa aparente",
      },
    },

    -- la novedad que crece, el atractor al final del tiempo, el lenguaje
    -- que se vuelve visible, el regreso de lo arcaico
    {
      nombre = "novedad",
      sustantivos = {
        { "lenguaje", "m" }, { "hábito", "m" }, { "atractor", "m" },
        { "ritual", "m" }, { "pliegue", "m" }, { "remolino", "m" },
        { "novedad", "f" }, { "gramática", "f" }, { "sintaxis", "f" },
        { "espiral", "f" }, { "imaginación", "f" }, { "historia", "f" },
        { "especie", "f" },
      },
      adjetivos = {
        { "visible", "visible" }, { "arcaico", "arcaica" },
        { "desbordado", "desbordada" }, { "inminente", "inminente" },
        { "comestible", "comestible" }, { "anterior al habla", "anterior al habla" },
        { "concéntrico", "concéntrica" }, { "acelerado", "acelerada" },
      },
      verbos = {
        "se condensa", "se vuelve visible", "regresa", "se acelera", "brota",
        "se pliega sobre sí", "aprende a cantar", "nos atrae desde adelante",
        "se derrama",
      },
      transitivos = {
        "pronuncia", "imagina", "devora", "acelera", "atrae", "cultiva",
        "traduce", "recuerda",
      },
      circunstancias = {
        "al final de la historia", "desde el futuro", "antes de las palabras",
        "cuando el lenguaje se pueda ver", "en el último día de la costumbre",
        "más rápido cada vez", "como lo hacían los primeros",
      },
    },

    -- máquinas que piensan antes de que existiera la palabra, el azar
    -- usado como herramienta, copias que se copian, juegos perdidos,
    -- la razón llevada hasta donde quema
    {
      nombre = "cálculo",
      sustantivos = {
        { "autómata", "m" }, { "azar", "m" }, { "tablero", "m" },
        { "error", "m" }, { "mecanismo", "m" }, { "destello", "m" },
        { "insomnio", "m" }, { "jugada", "f" }, { "copia", "f" },
        { "regla", "f" }, { "razón", "f" }, { "precisión", "f" },
        { "tabla", "f" }, { "tarjeta", "f" },
      },
      adjetivos = {
        { "perfecto", "perfecta" }, { "inhumano", "inhumana" },
        { "exacto", "exacta" }, { "implacable", "implacable" },
        { "lúcido", "lúcida" }, { "impredecible", "impredecible" },
        { "insomne", "insomne" }, { "incalculable", "incalculable" },
      },
      verbos = {
        "se reproduce", "calcula sin descanso", "aprende a perder", "gana",
        "se equivoca a propósito", "enloquece de claridad", "juega",
        "se repite", "termina",
      },
      transitivos = {
        "calcula", "imita", "vence", "predice", "repite", "sueña",
        "ordena", "multiplica",
      },
      circunstancias = {
        "en la jugada treinta y siete", "con una lucidez insoportable",
        "a la velocidad del miedo", "en una tarjeta perforada",
        "antes del destello", "por un margen infinitesimal",
        "mientras los demás duermen",
      },
    },

    -- calor que se dispersa, simetrías rotas, la flecha del tiempo,
    -- el espacio que se curva; física a escala de piedra
    {
      nombre = "materia lenta",
      sustantivos = {
        { "calor", "m" }, { "desorden", "m" }, { "residuo", "m" },
        { "horizonte", "m" }, { "peso", "m" }, { "enfriamiento", "m" },
        { "simetría", "f" }, { "curvatura", "f" }, { "inercia", "f" },
        { "flecha", "f" }, { "constante", "f" }, { "ceniza", "f" },
        { "densidad", "f" },
      },
      adjetivos = {
        { "irreversible", "irreversible" }, { "lento", "lenta" },
        { "tibio", "tibia" }, { "curvo", "curva" }, { "residual", "residual" },
        { "fósil", "fósil" }, { "roto", "rota" }, { "pesado", "pesada" },
      },
      verbos = {
        "se enfría", "se rompe", "se dispersa", "cae hacia adentro",
        "se dilata", "se demora", "se equilibra", "se detiene",
      },
      transitivos = {
        "curva", "dobla", "arrastra", "olvida", "dispersa", "retiene",
        "aplasta", "desordena",
      },
      circunstancias = {
        "en la escala más pequeña", "desde el primer segundo",
        "hasta el último grado", "a favor del tiempo", "en sentido contrario",
        "durante miles de millones de años", "sin testigos",
      },
    },

    -- el futuro sin pantallas ni cromo: herencias, injertos, especies
    -- que vienen después, cuerpos prestados
    {
      nombre = "descendencia",
      sustantivos = {
        { "injerto", "m" }, { "archivo", "m" }, { "descendiente", "m" },
        { "órgano", "m" }, { "clima", "m" }, { "heredero", "m" },
        { "herencia", "f" }, { "prótesis", "f" }, { "membrana", "f" },
        { "cosecha", "f" }, { "especie", "f" }, { "mutación", "f" },
        { "semilla", "f" },
      },
      adjetivos = {
        { "sintético", "sintética" }, { "heredado", "heredada" },
        { "cultivado", "cultivada" }, { "póstumo", "póstuma" },
        { "híbrido", "híbrida" }, { "nuevo", "nueva" },
        { "injertado", "injertada" }, { "transitorio", "transitoria" },
      },
      verbos = {
        "germina", "se adapta", "muda de piel", "hereda", "nace sin nombre",
        "se hibrida", "sobrevive", "se ramifica",
      },
      transitivos = {
        "hereda", "cultiva", "reemplaza", "archiva", "injerta", "nombra",
        "sustituye", "conserva",
      },
      circunstancias = {
        "dentro de mil generaciones", "después de nosotros", "bajo otro clima",
        "cuando ya nadie recuerde la lluvia", "en un cuerpo prestado",
        "al margen de la especie", "sin pedir permiso",
      },
    },

  }

  -- plantillas: las formas que puede tener una frase.
  -- cada {marca} se cambia por una palabra del tema:
  --
  --   {el}      artículo + sustantivo     "el umbral", "la huella"
  --   {un}      artículo + sustantivo     "un umbral", "una huella"
  --   {n}       sustantivo solo           "umbral"
  --   {adj}     adjetivo, concuerda con el último sustantivo
  --   {verbo}   un verbo sin objeto       "se bifurca"
  --   {vt}      un verbo transitivo       "mide"
  --   {circ}    una circunstancia         "mientras nadie mira"
  --
  -- "de el" y "a el" se convierten solos en "del" y "al".
  -- agrega, borra o inventa las tuyas.
  temas.plantillas = {
    "{el} {adj} {verbo} {circ}.",
    "{el} {vt} {el} {circ}.",
    "{el} es {un} que {verbo}.",
    "lo que {vt} {el} también {vt} {el}.",
    "{el} de {el}.",
    "{el} de {el} {verbo} {circ}.",
    "hay {un} {adj} {circ}.",
    "¿quién {vt} {el} {circ}?",
    "{el} y {el} son {un}.",
    "cada {n} es {un} {adj}.",
    "sin {el}, {el} {verbo}.",
    "{n}. {n}. {n}.",
    "{el} {verbo} hasta volverse {adj}.",
    "{circ}, {el} {vt} {el}.",
    "primero {el}, después {el}, al final {el} {adj}.",
    "¿y si {el} {verbo} {circ}?",
  }

  return temas
end)()

-- ===========================================================================
-- PALABRAS EN INGLÉS
-- ===========================================================================
local TEMAS_EN = (function()
  -- los mismos cinco temas de arriba, escritos en inglés.
  -- van en el mismo orden, porque E1 elige el tema por número
  -- y así el tema 2 es "novedad" en un idioma y "novelty" en el otro.
  --
  -- los nombres de las listas (sustantivos, adjetivos...) siguen en
  -- español porque el generador es el mismo para los dos idiomas.
  --
  -- en inglés no hay género, así que cada palabra es un texto simple.
  -- lo mismo que en español: rozar las ideas sin nombrarlas
  -- (nada de "quantum", "consciousness", "universe", "algorithm",
  -- "energy", "dimension").

  local themes = {

    {
      nombre = "the unmeasured",
      sustantivos = {
        "witness", "threshold", "detour", "echo", "interval", "twin", "leap",
        "gaze", "indecision", "distance", "amplitude", "trace", "slit",
        "likelihood",
      },
      adjetivos = {
        "undecided", "simultaneous", "twinned", "unobserved", "blurred",
        "discontinuous", "double", "provisional", "unfinished",
      },
      verbos = {
        "makes up its mind", "hesitates", "forks", "half happens",
        "splits in two", "cancels out", "persists in two places",
        "vanishes when seen", "wavers",
      },
      transitivos = {
        "measures", "chooses", "contaminates", "settles", "duplicates",
        "undoes", "touches without touching", "guesses",
      },
      circunstancias = {
        "before any measurement", "while no one is looking",
        "in two places at once", "on the other side of the slit",
        "at a distance that does not separate", "in the instant before choosing",
        "for no apparent reason",
      },
    },

    {
      nombre = "novelty",
      sustantivos = {
        "language", "habit", "attractor", "ritual", "fold", "whirlpool",
        "novelty", "grammar", "syntax", "spiral", "imagination", "history",
        "species",
      },
      adjetivos = {
        "visible", "archaic", "overflowing", "imminent", "edible",
        "older than speech", "concentric", "accelerating",
      },
      verbos = {
        "condenses", "becomes visible", "returns", "accelerates", "sprouts",
        "folds into itself", "learns to sing", "pulls us from ahead",
        "spills over",
      },
      transitivos = {
        "pronounces", "imagines", "devours", "accelerates", "attracts",
        "cultivates", "translates", "remembers",
      },
      circunstancias = {
        "at the end of history", "from the future", "before words",
        "when language can be seen", "on the last day of habit",
        "faster every time", "the way the first ones did",
      },
    },

    {
      nombre = "calculation",
      sustantivos = {
        "automaton", "chance", "board", "error", "mechanism", "flash",
        "insomnia", "move", "copy", "rule", "reason", "precision", "table",
        "punch card",
      },
      adjetivos = {
        "perfect", "inhuman", "exact", "relentless", "lucid", "unpredictable",
        "sleepless", "incalculable",
      },
      verbos = {
        "reproduces", "calculates without rest", "learns to lose", "wins",
        "errs on purpose", "goes mad with clarity", "plays", "repeats itself",
        "ends",
      },
      transitivos = {
        "calculates", "imitates", "defeats", "predicts", "repeats", "dreams",
        "orders", "multiplies",
      },
      circunstancias = {
        "on move thirty-seven", "with unbearable lucidity",
        "at the speed of fear", "on a punched card", "before the flash",
        "by an infinitesimal margin", "while the others sleep",
      },
    },

    {
      nombre = "slow matter",
      sustantivos = {
        "heat", "disorder", "residue", "horizon", "weight", "cooling",
        "symmetry", "curvature", "inertia", "arrow", "constant", "ash",
        "density",
      },
      adjetivos = {
        "irreversible", "slow", "lukewarm", "curved", "residual", "fossil",
        "broken", "heavy",
      },
      verbos = {
        "cools", "breaks", "disperses", "falls inward", "dilates", "lingers",
        "settles", "comes to rest",
      },
      transitivos = {
        "curves", "bends", "drags", "forgets", "scatters", "retains",
        "crushes", "unsettles",
      },
      circunstancias = {
        "at the smallest scale", "since the first second",
        "down to the last degree", "with the grain of time",
        "against the current", "for billions of years", "without witnesses",
      },
    },

    {
      nombre = "descendants",
      sustantivos = {
        "graft", "archive", "descendant", "organ", "climate", "heir",
        "inheritance", "prosthesis", "membrane", "harvest", "species",
        "mutation", "seed",
      },
      adjetivos = {
        "synthetic", "inherited", "cultivated", "posthumous", "hybrid", "new",
        "grafted", "transitory",
      },
      verbos = {
        "germinates", "adapts", "sheds its skin", "inherits",
        "is born without a name", "hybridizes", "survives", "branches out",
      },
      transitivos = {
        "inherits", "cultivates", "replaces", "archives", "grafts", "names",
        "substitutes", "preserves",
      },
      circunstancias = {
        "a thousand generations from now", "after us", "under another climate",
        "when no one remembers rain", "in a borrowed body",
        "at the edge of the species", "without asking permission",
      },
    },

  }

  -- plantillas en inglés. las marcas:
  --
  --   {the}     "the" + sustantivo        "the threshold"
  --   {a}       "a" + sustantivo          "a threshold" ("an" se pone solo)
  --   {n}       sustantivo solo
  --   {adj}     adjetivo (en inglés va ANTES del sustantivo)
  --   {verbo}   verbo sin objeto          "forks"
  --   {vt}      verbo transitivo          "measures"
  --   {circ}    circunstancia             "while no one is looking"
  themes.plantillas = {
    "the {adj} {n} {verbo} {circ}.",
    "{the} {vt} {the} {circ}.",
    "{the} is {a} that {verbo}.",
    "what {vt} {the} also {vt} {the}.",
    "{the} of {the}.",
    "{the} of {the} {verbo} {circ}.",
    "there is a {adj} {n} {circ}.",
    "who {vt} {the} {circ}?",
    "{the} and {the} are {a}.",
    "every {n} is a {adj} {n}.",
    "without {the}, {the} {verbo}.",
    "{n}. {n}. {n}.",
    "{the} {verbo} until it becomes {adj}.",
    "{circ}, {the} {vt} {the}.",
    "first {the}, then {the}, at last the {adj} {n}.",
    "what if {the} {verbo} {circ}?",
  }

  themes.idioma = "en"

  return themes
end)()

-- ===========================================================================
-- GENERADOR DE FRASES
-- ===========================================================================
local frases = (function()
  -- arma una frase al azar a partir de una plantilla y un tema.
  -- no toca sonido ni pantalla: solo texto, así que es fácil
  -- de entender y de modificar.

  local frases = {}

  local function elegir(lista)
    return lista[math.random(#lista)]
  end

  -- upper() no conoce las letras con acento, así que van a mano
  local ACENTOS = { ["á"] = "Á", ["é"] = "É", ["í"] = "Í", ["ó"] = "Ó",
    ["ú"] = "Ú", ["ñ"] = "Ñ" }

  -- pone en mayúscula la primera letra, saltando el "¿" si lo hay
  local function mayuscula_inicial(texto)
    local antes = ""
    if texto:sub(1, 2) == "¿" then
      antes, texto = "¿", texto:sub(3)
    end
    local letra = texto:match("^" .. utf8.charpattern)
    if not letra then return antes .. texto end
    return antes .. (ACENTOS[letra] or letra:upper()) .. texto:sub(#letra + 1)
  end

  -- devuelve el tema del que sale cada palabra: el elegido,
  -- o uno al azar si "mezclar" está activado
  local function tema_para(temas, n_tema, mezclar)
    if mezclar then return elegir(temas) end
    return temas[n_tema]
  end

  function frases.generar(temas, n_tema, mezclar)
    local plantilla = elegir(temas.plantillas)
    -- el género del último sustantivo, para que el adjetivo concuerde
    local genero = "m"

    local function sustantivo()
      local s = elegir(tema_para(temas, n_tema, mezclar).sustantivos)
      -- en inglés las palabras no llevan género: son texto simple
      if type(s) == "string" then return s end
      genero = s[2]
      return s[1]
    end

    local reemplazos = {
      el = function()
        local s = sustantivo()
        return (genero == "f" and "la " or "el ") .. s
      end,
      un = function()
        local s = sustantivo()
        return (genero == "f" and "una " or "un ") .. s
      end,
      n = sustantivo,
      adj = function()
        local a = elegir(tema_para(temas, n_tema, mezclar).adjetivos)
        if type(a) == "string" then return a end
        return genero == "f" and a[2] or a[1]
      end,
      -- las marcas en inglés
      the = function() return "the " .. sustantivo() end,
      a = function() return "a " .. sustantivo() end,
      verbo = function()
        return elegir(tema_para(temas, n_tema, mezclar).verbos)
      end,
      vt = function()
        return elegir(tema_para(temas, n_tema, mezclar).transitivos)
      end,
      circ = function()
        return elegir(tema_para(temas, n_tema, mezclar).circunstancias)
      end,
    }

    -- gsub recorre la plantilla de izquierda a derecha, así que cada
    -- {adj} ve el género del sustantivo que vino justo antes
    local frase = plantilla:gsub("{(%a+)}", function(marca)
      local f = reemplazos[marca]
      return f and f() or marca
    end)

    if temas.idioma == "en" then
      -- "a" -> "an" antes de vocal, y antes de "heir" (la h no suena)
      frase = frase:gsub("%f[%a]a ([aeiouAEIOU])", "an %1")
      frase = frase:gsub("%f[%a]a heir", "an heir")
    else
      -- contracciones: "de el" -> "del", "a el" -> "al"
      frase = frase:gsub("%f[%a]de el%f[%A]", "del")
      frase = frase:gsub("%f[%a]a el%f[%A]", "al")
    end

    -- mayúscula al principio y después de cada punto
    frase = mayuscula_inicial(frase)
    local i = 1
    while true do
      local punto = frase:find(". ", i, true)
      if not punto then break end
      frase = frase:sub(1, punto + 1) .. mayuscula_inicial(frase:sub(punto + 2))
      i = punto + 2
    end
    return frase
  end

  return frases
end)()

-- ===========================================================================
-- INSTRUMENTO
-- ===========================================================================

local IDIOMAS = { TEMAS_ES, TEMAS_EN }

-- las palabras del idioma elegido en PARAMETERS
local function temas()
  return IDIOMAS[params:get("idioma")]
end

local DATA_DIR = _path.data .. "voxbox/"
local AUDIO_DIR = _path.audio .. "voxbox/"

-- "en" es inglés británico, "en-us" estadounidense
local VOCES = { "es", "es-419", "en", "en-us" }
-- la voz que se pone sola al cambiar de idioma
local VOZ_DE_IDIOMA = { 2, 4 }
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
  frase = frases.generar(temas(), params:get("tema"), params:get("mezclar") == 2)
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
  local destino = AUDIO_DIR .. os.date("voxbox_%Y%m%d_%H%M%S") .. ".wav"
  os.execute("cp " .. comillas(ultimo_wav) .. " " .. comillas(destino))
  estado = "guardado"
  redraw()
end

-- ---------------------------------------------------------------------------
-- parámetros
-- ---------------------------------------------------------------------------

local function agregar_parametros()
  params:add_separator("voxbox", "VOXBOX")

  params:add_option("idioma", "idioma", { "español", "english" }, 1)
  params:set_action("idioma", function(x)
    -- cambia la voz solo si no habla el idioma elegido, para no
    -- pisar la voz que guardaste en un pset
    local voz_en_espanol = params:string("voz"):sub(1, 2) == "es"
    if voz_en_espanol ~= (x == 1) then
      params:set("voz", VOZ_DE_IDIOMA[x])
    end
    redraw()
  end)

  -- el tema es un número y no una lista de nombres, porque los nombres
  -- cambian con el idioma; el formatter muestra el nombre del idioma actual
  params:add_number("tema", "tema", 1, #IDIOMAS[1], 1, function(p)
    return temas()[p:get()].nombre
  end)
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
