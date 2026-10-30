-- VOXBOX 2.0
-- frases automáticas habladas
-- con filtro, granos y LFO,
-- y un granulador de samples
-- de voz que suena a la vez
--
-- E1 cambia de página
-- E2 / E3 los dos parámetros
--   de esa página
-- K2 mantenido + K3
--   cambia de pestaña:
--   SÍNTESIS <-> SAMPLES
--
-- pestaña SÍNTESIS:
-- K2 decir una frase nueva
-- K3 modo automático on/off
--
-- pestaña SAMPLES:
-- K2 cargar un sample
-- K3 escuchar el sample
--
-- páginas de SÍNTESIS:
-- VOZ     tema / tono
-- MODO    frases, caracteres
--         o mezcla / cantidad
-- MOTOR   motor / su voz
-- TIMBRE  siseo / entonación
-- HABLA   rapidez / silencios
-- AZAR    azar rapidez /
--         azar silencios
-- ECO     eco / repeticiones
-- ECO 2   espacio / azar eco
-- FILTRO  corte / resonancia
-- MEZCLA  voz / granos
-- GRANOS  densidad / tamaño
-- MOVIM.  avance / dispersión
-- TONO G  tono / variación
-- LFO     velocidad / profundidad
-- AUTO    cada cuánto / pausas
--
-- páginas de SAMPLES:
-- SAMPLE  cuál / elección
-- CARGA   archivo o carpeta /
--         trocear en pausas
-- NIVEL   volumen / cuándo suena
-- GRANO   densidad / tamaño
-- MOVIM.  avance / dispersión
-- SÍLABA  sílabas / saltar
--         silencios
-- TONO    tono / variación
-- ESPACIO estéreo / reversa
--
-- los samples: cualquier .wav,
-- .aif o .flac cortado a la
-- rápida. VOXBOX lo normaliza,
-- le quita el silencio de los
-- bordes y busca sus sílabas.
-- con "trocear en pausas" una
-- grabación larga se parte en
-- un sample por frase o palabra.
-- quedan guardados y vuelven
-- solos al abrir el script.
--
-- más opciones en
-- PARAMETERS > VOXBOX
-- (idioma, motor de voz,
-- tipo de filtro, destino
-- del LFO...)
--
-- los granos y el eco empiezan
-- en 0: súbelos en MEZCLA y ECO
--
-- motores: eSpeak, MBROLA,
-- flite, Piper, Pico, Festival,
-- SAM y DECtalk. instálalos
-- con instalar_voces.sh
-- (junto a este script en
-- GitHub)
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
  -- el registro es científico: frases de cuaderno de laboratorio,
  -- hipótesis y resultados, no metáforas. vocabulario técnico sí,
  -- palabras gastadas de divulgación no ("cuántico", "conciencia",
  -- "universo", "energía", "vibración", "dimensión").
  --
  -- reglas para que las frases suenen bien:
  --
  --   sustantivos       van con su género: { "estado", "m" } o { "fase", "f" }.
  --                     evita los femeninos que empiezan con "a" tónica
  --                     (alma, habla, álgebra): llevan "el" y el script
  --                     les pondría "la".
  --   adjetivos         van en masculino y femenino: { "estable", "estable" },
  --                     { "discreto", "discreta" }.
  --   verbos            en tercera persona, sin objeto: "decae", "fluctúa".
  --   transitivos       en tercera persona, y van seguidos de una cosa:
  --                     "mide" -> "el detector mide la fase".
  --   circunstancias    dónde, cuándo o cómo: "a temperatura constante".

  local temas = {

    -- mecánica cuántica, sin decirlo: medición, coherencia, correlaciones
    {
      nombre = "medición",
      sustantivos = {
        { "observable", "m" }, { "estado", "m" }, { "detector", "m" },
        { "resultado", "m" }, { "sistema", "m" }, { "acoplamiento", "m" },
        { "fase", "f" }, { "coherencia", "f" }, { "amplitud", "f" },
        { "correlación", "f" }, { "interferencia", "f" },
        { "incertidumbre", "f" }, { "medición", "f" },
      },
      adjetivos = {
        { "no local", "no local" }, { "coherente", "coherente" },
        { "correlacionado", "correlacionada" },
        { "indeterminado", "indeterminada" }, { "discreto", "discreta" },
        { "aleatorio", "aleatoria" }, { "reversible", "reversible" },
        { "estable", "estable" },
      },
      verbos = {
        "pierde coherencia", "fluctúa", "colapsa", "oscila",
        "permanece indefinido", "se estabiliza", "decae", "interfiere consigo",
      },
      transitivos = {
        "mide", "perturba", "determina", "registra", "anula",
        "se correlaciona con", "amplifica", "predice",
      },
      circunstancias = {
        "en ausencia de observación", "en aislamiento completo",
        "a baja temperatura", "dentro del margen de error",
        "tras mediciones repetidas", "entre dos detectores separados",
        "durante el intervalo medido",
      },
    },

    -- de McKenna a la ciencia de la complejidad: novedad, emergencia,
    -- autoorganización, atractores
    {
      nombre = "complejidad",
      sustantivos = {
        { "lenguaje", "m" }, { "patrón", "m" }, { "atractor", "m" },
        { "umbral", "m" }, { "ritmo", "m" }, { "novedad", "f" },
        { "complejidad", "f" }, { "información", "f" },
        { "autoorganización", "f" }, { "emergencia", "f" }, { "red", "f" },
        { "señal", "f" },
      },
      adjetivos = {
        { "emergente", "emergente" }, { "no lineal", "no lineal" },
        { "recursivo", "recursiva" }, { "autosimilar", "autosimilar" },
        { "fractal", "fractal" }, { "adaptativo", "adaptativa" },
        { "creciente", "creciente" }, { "caótico", "caótica" },
      },
      verbos = {
        "emerge", "se autoorganiza", "se acelera", "converge hacia un atractor",
        "aumenta en complejidad", "se ramifica", "se sincroniza",
      },
      transitivos = {
        "codifica", "comprime", "amplifica", "retroalimenta", "organiza",
        "transmite", "predice", "acelera",
      },
      circunstancias = {
        "lejos del equilibrio", "en cada iteración", "en escala logarítmica",
        "a lo largo de la historia evolutiva", "cerca del punto crítico",
        "de forma exponencial", "en el borde del caos",
      },
    },

    -- MANIAC: autómatas, Monte Carlo, juegos, la máquina que aprende
    {
      nombre = "computación",
      sustantivos = {
        { "autómata", "m" }, { "procesador", "m" }, { "programa", "m" },
        { "modelo", "m" }, { "error", "m" }, { "cálculo", "m" },
        { "método", "m" }, { "juego", "m" }, { "estrategia", "f" },
        { "simulación", "f" }, { "probabilidad", "f" }, { "regla", "f" },
        { "memoria", "f" }, { "iteración", "f" },
      },
      adjetivos = {
        { "determinista", "determinista" }, { "estocástico", "estocástica" },
        { "óptimo", "óptima" }, { "autorreplicante", "autorreplicante" },
        { "programable", "programable" }, { "finito", "finita" },
        { "exacto", "exacta" }, { "aproximado", "aproximada" },
      },
      verbos = {
        "converge", "se autorreplica", "termina", "falla", "se optimiza",
        "aprende", "diverge", "se detiene",
      },
      transitivos = {
        "calcula", "simula", "optimiza", "ejecuta", "aproxima", "minimiza",
        "evalúa", "reproduce",
      },
      circunstancias = {
        "por el método de Monte Carlo", "en tiempo polinómico",
        "tras diez mil simulaciones", "con una precisión de seis decimales",
        "en la jugada treinta y siete", "con memoria finita",
        "sin intervención humana",
      },
    },

    -- termodinámica y relatividad: entropía, equilibrio, simetría, curvatura
    {
      nombre = "termodinámica",
      sustantivos = {
        { "calor", "m" }, { "equilibrio", "m" }, { "gradiente", "m" },
        { "campo", "m" }, { "flujo", "m" }, { "horizonte", "m" },
        { "entropía", "f" }, { "temperatura", "f" }, { "presión", "f" },
        { "simetría", "f" }, { "curvatura", "f" }, { "masa", "f" },
        { "densidad", "f" },
      },
      adjetivos = {
        { "irreversible", "irreversible" }, { "adiabático", "adiabática" },
        { "isotrópico", "isotrópica" }, { "homogéneo", "homogénea" },
        { "inestable", "inestable" }, { "constante", "constante" },
        { "macroscópico", "macroscópica" }, { "cerrado", "cerrada" },
      },
      verbos = {
        "se disipa", "alcanza el equilibrio", "se expande", "se contrae",
        "aumenta", "disminuye", "se conserva", "se rompe espontáneamente",
      },
      transitivos = {
        "transfiere", "curva", "disipa", "comprime", "conserva", "desplaza",
        "rompe", "equilibra",
      },
      circunstancias = {
        "en un sistema cerrado", "a temperatura constante",
        "cerca del cero absoluto", "a escala macroscópica",
        "en la dirección del tiempo", "durante miles de millones de años",
        "sin intercambio de calor",
      },
    },

    -- el futuro como biología: genomas editados, linajes, especies nuevas
    {
      nombre = "biotecnología",
      sustantivos = {
        { "genoma", "m" }, { "injerto", "m" }, { "organismo", "m" },
        { "tejido", "m" }, { "linaje", "m" }, { "fenotipo", "m" },
        { "mutación", "f" }, { "proteína", "f" }, { "célula", "f" },
        { "especie", "f" }, { "secuencia", "f" }, { "membrana", "f" },
        { "población", "f" },
      },
      adjetivos = {
        { "sintético", "sintética" }, { "transgénico", "transgénica" },
        { "heredable", "heredable" }, { "híbrido", "híbrida" },
        { "modificado", "modificada" }, { "recombinante", "recombinante" },
        { "viable", "viable" }, { "adaptativo", "adaptativa" },
      },
      verbos = {
        "muta", "se replica", "se diferencia", "se adapta", "se expresa",
        "sobrevive", "evoluciona", "se extingue",
      },
      transitivos = {
        "edita", "expresa", "hereda", "sintetiza", "secuencia", "modifica",
        "replica", "cultiva",
      },
      circunstancias = {
        "in vitro", "en la siguiente generación", "bajo presión selectiva",
        "en condiciones de laboratorio", "a lo largo de mil generaciones",
        "en un medio de cultivo", "sin selección natural",
      },
    },

  }

  -- plantillas: las formas que puede tener una frase.
  -- cada {marca} se cambia por una palabra del tema:
  --
  --   {el}      artículo + sustantivo     "el estado", "la fase"
  --   {un}      artículo + sustantivo     "un estado", "una fase"
  --   {n}       sustantivo solo           "estado"
  --   {adj}     adjetivo, concuerda con el último sustantivo
  --   {verbo}   un verbo sin objeto       "decae"
  --   {vt}      un verbo transitivo       "mide"
  --   {circ}    una circunstancia         "a temperatura constante"
  --   {prob}    una probabilidad          "0,37"
  --   {pct}     un porcentaje             "4,2"
  --
  -- "de el" y "a el" se convierten solos en "del" y "al".
  -- agrega, borra o inventa las tuyas.
  temas.plantillas = {
    "se observa que {el} {verbo} {circ}.",
    "{el} es proporcional a {el}.",
    "hipótesis: {el} {verbo} {circ}.",
    "a mayor {n}, menor {n}.",
    "{el} depende de {el}.",
    "los datos sugieren que {el} {vt} {el}.",
    "si {el} aumenta, {el} {verbo}.",
    "{el} se comporta como {un} {adj}.",
    "resultado: {el} {verbo} {circ}.",
    "conclusión: {el} {vt} {el} {circ}.",
    "variable independiente: {n}. variable dependiente: {n}.",
    "{el} {adj} {vt} {el} con una probabilidad de {prob}.",
    "error estimado: {pct} por ciento.",
    "sin evidencia concluyente: {el} {verbo} {circ}.",
    "pregunta abierta: si {el} {verbo} {circ}.",
  }

  return temas
end)()

-- ===========================================================================
-- PALABRAS EN INGLÉS
-- ===========================================================================
local TEMAS_EN = (function()
  -- los mismos cinco temas de arriba, escritos en inglés.
  -- van en el mismo orden, porque el tema se elige por número
  -- y así el tema 2 es "complejidad" en un idioma y "complexity" en el otro.
  --
  -- los nombres de las listas (sustantivos, adjetivos...) siguen en
  -- español porque el generador es el mismo para los dos idiomas.
  -- en inglés no hay género, así que cada palabra es un texto simple.

  local themes = {

    {
      nombre = "measurement",
      sustantivos = {
        "observable", "state", "detector", "outcome", "system", "coupling",
        "phase", "coherence", "amplitude", "correlation", "interference",
        "uncertainty", "measurement",
      },
      adjetivos = {
        "nonlocal", "coherent", "correlated", "indeterminate", "discrete",
        "random", "reversible", "stable",
      },
      verbos = {
        "decoheres", "fluctuates", "collapses", "oscillates",
        "remains undefined", "stabilizes", "decays", "interferes with itself",
      },
      transitivos = {
        "measures", "perturbs", "determines", "records", "cancels",
        "correlates with", "amplifies", "predicts",
      },
      circunstancias = {
        "in the absence of observation", "under complete isolation",
        "at low temperature", "within the margin of error",
        "after repeated measurement", "between two separated detectors",
        "during the measured interval",
      },
    },

    {
      nombre = "complexity",
      sustantivos = {
        "language", "pattern", "attractor", "threshold", "rhythm", "novelty",
        "complexity", "information", "self-organization", "emergence",
        "network", "signal",
      },
      adjetivos = {
        "emergent", "nonlinear", "recursive", "self-similar", "fractal",
        "adaptive", "increasing", "chaotic",
      },
      verbos = {
        "emerges", "self-organizes", "accelerates", "converges on an attractor",
        "grows in complexity", "branches", "synchronizes",
      },
      transitivos = {
        "encodes", "compresses", "amplifies", "feeds back into", "organizes",
        "transmits", "predicts", "accelerates",
      },
      circunstancias = {
        "far from equilibrium", "at every iteration", "on a logarithmic scale",
        "across evolutionary time", "near the critical point", "exponentially",
        "at the edge of chaos",
      },
    },

    {
      nombre = "computation",
      sustantivos = {
        "automaton", "processor", "program", "model", "error", "calculation",
        "method", "game", "strategy", "simulation", "probability", "rule",
        "memory", "iteration",
      },
      adjetivos = {
        "deterministic", "stochastic", "optimal", "self-replicating",
        "programmable", "finite", "exact", "approximate",
      },
      verbos = {
        "converges", "self-replicates", "halts", "fails", "optimizes",
        "learns", "diverges", "terminates",
      },
      transitivos = {
        "calculates", "simulates", "optimizes", "executes", "approximates",
        "minimizes", "evaluates", "reproduces",
      },
      circunstancias = {
        "by the Monte Carlo method", "in polynomial time",
        "after ten thousand simulations", "to six decimal places",
        "on move thirty-seven", "with finite memory",
        "without human intervention",
      },
    },

    {
      nombre = "thermodynamics",
      sustantivos = {
        "heat", "equilibrium", "gradient", "field", "flow", "horizon",
        "entropy", "temperature", "pressure", "symmetry", "curvature", "mass",
        "density",
      },
      adjetivos = {
        "irreversible", "adiabatic", "isotropic", "homogeneous", "unstable",
        "constant", "macroscopic", "closed",
      },
      verbos = {
        "dissipates", "reaches equilibrium", "expands", "contracts",
        "increases", "decreases", "is conserved", "breaks spontaneously",
      },
      transitivos = {
        "transfers", "curves", "dissipates", "compresses", "conserves",
        "displaces", "breaks", "balances",
      },
      circunstancias = {
        "in a closed system", "at constant temperature", "near absolute zero",
        "at macroscopic scale", "in the direction of time",
        "over billions of years", "without heat exchange",
      },
    },

    {
      nombre = "biotechnology",
      sustantivos = {
        "genome", "graft", "organism", "tissue", "lineage", "phenotype",
        "mutation", "protein", "cell", "species", "sequence", "membrane",
        "population",
      },
      adjetivos = {
        "synthetic", "transgenic", "heritable", "hybrid", "modified",
        "recombinant", "viable", "adaptive",
      },
      verbos = {
        "mutates", "replicates", "differentiates", "adapts", "is expressed",
        "survives", "evolves", "goes extinct",
      },
      transitivos = {
        "edits", "expresses", "inherits", "synthesizes", "sequences",
        "modifies", "replicates", "cultivates",
      },
      circunstancias = {
        "in vitro", "in the next generation", "under selective pressure",
        "under laboratory conditions", "over a thousand generations",
        "in a culture medium", "without natural selection",
      },
    },

  }

  -- plantillas en inglés. las marcas:
  --
  --   {the}     "the" + sustantivo        "the state"
  --   {a}       "a" + sustantivo          "a state" ("an" se pone solo)
  --   {n}       sustantivo solo
  --   {adj}     adjetivo (en inglés va ANTES del sustantivo)
  --   {verbo}   verbo sin objeto          "decays"
  --   {vt}      verbo transitivo          "measures"
  --   {circ}    circunstancia             "at constant temperature"
  --   {prob}    una probabilidad          "0.37"
  --   {pct}     un porcentaje             "4.2"
  themes.plantillas = {
    "it is observed that {the} {verbo} {circ}.",
    "{the} is proportional to {the}.",
    "hypothesis: {the} {verbo} {circ}.",
    "the greater the {n}, the lower the {n}.",
    "{the} depends on {the}.",
    "the data suggest that {the} {vt} {the}.",
    "if {the} increases, {the} {verbo}.",
    "{the} behaves like a {adj} {n}.",
    "result: {the} {verbo} {circ}.",
    "conclusion: {the} {vt} {the} {circ}.",
    "independent variable: {n}. dependent variable: {n}.",
    "the {adj} {n} {vt} {the} with a probability of {prob}.",
    "estimated error: {pct} percent.",
    "no conclusive evidence: {the} {verbo} {circ}.",
    "open question: whether {the} {verbo} {circ}.",
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
      -- cifras: una probabilidad (0.01 a 0.99) o un porcentaje (0.5 a 25.0).
    -- en español el decimal va con coma
    prob = function()
      local cifra = string.format("0.%02d", math.random(1, 99))
      return temas.idioma == "en" and cifra or (cifra:gsub("%.", ","))
    end,
    pct = function()
      local cifra = string.format("%.1f", math.random(5, 250) / 10)
      return temas.idioma == "en" and cifra or (cifra:gsub("%.", ","))
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
local FILTROS = { "abierto", "pasa bajos", "pasa banda", "pasa altos" }
-- motores de voz. flite solo habla inglés; Piper necesita una voz
-- (.onnx y su .onnx.json) en ~/.local/share/piper/voices/
-- MOTORES DE VOZ. los que no vienen con el norns se instalan con
-- instalar_voces.sh (está junto a este script en GitHub)
local MOTORES = { "eSpeak", "MBROLA", "flite", "Piper", "Pico", "Festival",
  "SAM", "DECtalk" }
local PROGRAMA_DE_MOTOR = { "espeak-ng", "mbrola", "flite", "piper",
  "pico2wave", "text2wave", "sam", "dectalk" }
-- el parámetro que cambia E3 en la página MOTOR, según el motor
local VOZ_DE_MOTOR = { "variante", "voz_mbrola", "voz_flite", "voz_piper",
  "voz_pico", "voz_festival", "voz_sam", "voz_dectalk" }

-- eSpeak: las variantes Klatt usan el sintetizador de Dennis Klatt (1980),
-- el mismo modelo que DECtalk; croak es una voz ronca
local VARIANTES = { "normal", "klatt", "klatt2", "klatt3", "klatt4", "klatt5",
  "klatt6", "croak" }
-- flite solo habla inglés
local VOCES_FLITE = { "kal", "slt", "rms", "awb" }
local DIR_PIPER = "/home/we/.local/share/piper/voices/"
local DIR_MBROLA = "/usr/share/mbrola/"
-- Pico (el TTS de los primeros Android): "auto" sigue al idioma; los demás
-- leen el texto con el acento de otro idioma
local VOCES_PICO = { "auto", "es-ES", "en-US", "en-GB", "fr-FR", "de-DE", "it-IT" }
local VOCES_FESTIVAL = { "auto", "el (español)", "kal (inglés)" }
-- SAM (Commodore 64, 1982), con los valores de su manual original:
-- { nombre, speed, pitch, throat, mouth }. solo habla inglés
local VOCES_SAM = {
  { "SAM", 72, 64, 128, 128 },
  { "Elf", 72, 64, 110, 160 },
  { "Little Robot", 92, 60, 190, 190 },
  { "Stuffy Guy", 82, 72, 110, 105 },
  { "Little Old Lady", 82, 32, 145, 145 },
  { "Extra-Terrestrial", 100, 64, 150, 200 },
}
-- DECtalk (1984): Paul es la voz de Stephen Hawking
local VOCES_DECTALK = { "Paul", "Betty", "Harry", "Frank", "Dennis", "Kit",
  "Ursula", "Rita", "Wendy" }
local LFO_DESTINOS = { "corte", "tamaño", "densidad", "tono granos", "rapidez",
  "siseo", "eco", "tono samples" }

-- voces de softcut: la 1 dice la frase tal cual,
-- de la 2 a la 5 disparan los granos por turnos
local VOZ_SECA = 1
local GRANOS = { 2, 3, 4, 5 }
-- y la 6 repite la última palabra (el eco)
local VOZ_ECO = 6
local VOCES_SC = { 1, 2, 3, 4, 5, 6 }
-- el eco vive en el segundo 100 del buffer, lejos de la frase
local ECO_INICIO = 100

-- los samples viven en el buffer 2, uno detrás de otro.
-- los granos de samples usan las mismas voces 2 a 5 que los de la frase,
-- y la voz 6 (la del eco) sirve para escuchar un sample entero
local BUFFER_SAMPLES = 2
local BUFFER_MAX = 340      -- segundos que caben en el buffer
local MAX_SAMPLES = 32
local MAX_DUR = 30          -- un sample más largo se corta aquí
local FRAME = 0.01          -- el análisis mide la energía cada 10 ms
local SAMPLES_DIR = _path.data .. "voxbox/samples/"
local CORTE_DIR = _path.data .. "voxbox/corte/"
local EXTENSIONES = { "wav", "aif", "aiff", "flac" }

local PESTANAS = { "SÍNTESIS", "SAMPLES" }

-- E1 elige la página; E2 y E3 cambian sus dos parámetros.
-- las páginas sin "pestana" son de SÍNTESIS
local PAGINAS = {
  { nombre = "VOZ",    e2 = "tema",      e3 = "tono" },
  { nombre = "MODO",   e2 = "modo",      e3 = "cantidad" },
  -- E3 cambia la voz del motor que esté elegido
  { nombre = "MOTOR",  e2 = "motor",
    e3 = function() return VOZ_DE_MOTOR[params:get("motor")] end },
  { nombre = "TIMBRE", e2 = "siseo",     e3 = "entonacion" },
  { nombre = "HABLA",  e2 = "rapidez",   e3 = "silencios" },
  { nombre = "AZAR",   e2 = "azar_rapidez", e3 = "azar_silencios" },
  { nombre = "ECO",    e2 = "eco",       e3 = "repeticiones" },
  { nombre = "ECO 2",  e2 = "espacio_eco", e3 = "azar_eco" },
  { nombre = "FILTRO", e2 = "corte",     e3 = "resonancia" },
  { nombre = "MEZCLA", e2 = "volumen",   e3 = "granos" },
  { nombre = "GRANOS", e2 = "densidad",  e3 = "tamano" },
  { nombre = "MOVIM.", e2 = "avance",    e3 = "dispersion" },
  { nombre = "TONO G", e2 = "tono_granos", e3 = "variacion" },
  { nombre = "LFO",    e2 = "lfo_vel",   e3 = "lfo_prof" },
  { nombre = "AUTO",   e2 = "intervalo", e3 = "pausas" },

  { nombre = "SAMPLE",  e2 = "sample",     e3 = "s_eleccion", pestana = 2 },
  { nombre = "CARGA",   e2 = "s_cargar",   e3 = "s_trocear",  pestana = 2 },
  { nombre = "NIVEL",   e2 = "s_volumen",  e3 = "s_cuando",   pestana = 2 },
  { nombre = "GRANO",   e2 = "s_densidad", e3 = "s_tamano",   pestana = 2 },
  { nombre = "MOVIM.",  e2 = "s_avance",   e3 = "s_dispersion", pestana = 2 },
  { nombre = "SÍLABA",  e2 = "s_silabas",  e3 = "s_saltar",   pestana = 2 },
  { nombre = "TONO",    e2 = "s_tono",     e3 = "s_variacion", pestana = 2 },
  { nombre = "ESPACIO", e2 = "s_estereo",  e3 = "s_reversa",  pestana = 2 },
}
for _, pg in ipairs(PAGINAS) do pg.pestana = pg.pestana or 1 end
-- nombres cortos para que quepan abajo en la pantalla
local ETIQUETAS = {
  tema = "", tono = "tono", corte = "corte", resonancia = "reso",
  granos = "granos", densidad = "dens", tamano = "tam", dispersion = "disp",
  avance = "avance", tono_granos = "tono", lfo_vel = "vel", lfo_prof = "prof",
  intervalo = "", entonacion = "enton", rapidez = "rap", siseo = "siseo",
  modo = "", cantidad = "cant", motor = "", variante = "", voz_mbrola = "",
  voz_flite = "", voz_piper = "", voz_pico = "", voz_festival = "",
  voz_sam = "", voz_dectalk = "", volumen = "voz", eco = "eco", repeticiones = "rep", pausas = "pausas",
  espacio_eco = "esp", azar_eco = "azar",
  variacion = "var",
  silencios = "sil", azar_rapidez = "azar r", azar_silencios = "azar s",
  sample = "", s_eleccion = "", s_cargar = "", s_trocear = "",
  s_volumen = "vol", s_cuando = "", s_densidad = "dens", s_tamano = "tam",
  s_avance = "avance", s_dispersion = "disp", s_silabas = "síl",
  s_saltar = "saltar", s_tono = "tono", s_variacion = "var",
  s_estereo = "estéreo", s_reversa = "rev",
}

local fileselect = require "fileselect"

local pagina = 1
-- la última página visitada de cada pestaña, para volver a ella
local pagina_de = { 1, nil }
for i, pg in ipairs(PAGINAS) do
  if pg.pestana == 2 and not pagina_de[2] then pagina_de[2] = i end
end
local k2_abajo = false    -- K2 mantenido, esperando un K3
local k2_combo = false    -- ese K2 ya se usó para cambiar de pestaña
local frase = ""
local estado = "K2: frase nueva"
local ocupado = false     -- true mientras eSpeak está generando
local auto = false
local turno = 1           -- alterna entre dos archivos, para no
                          -- sobrescribir el que está sonando
local ultimo_wav = nil
local hay = {}            -- qué programas están instalados
local voces_piper = { "-" }
local voces_mbrola = { "-" }

local dur_frase = 0       -- duración de la frase cargada, en segundos
local cabeza = 0          -- por dónde van leyendo los granos, en segundos
local siguiente_grano = 1
local marcas = {}         -- los últimos granos, para dibujarlos
local lfo_fase = 0
local lfo_valor = 0       -- de -1 a 1, ya multiplicado por la profundidad
local reloj_eco = nil     -- el reloj que está repitiendo la última palabra
-- cuándo suena la frase, para que los samples la sigan o la esquiven
local frase_desde, frase_hasta = 0, 0

-- los samples cargados: { nombre, base, inicio, dur, forma, activo, silabas }
local samples = {}
local fin_buffer = 0      -- dónde empieza el próximo sample en el buffer 2
local siguiente_id = 1    -- el número del próximo archivo guardado
local cargando = false
local estado_s = "K2: cargar sample"
local cabeza_s = 0        -- por dónde van leyendo los granos del sample
local slot_ciclo = 1      -- el sample que suena en elección "ciclo"
local marcas_s = {}

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

-- cuánto mueve el LFO a este destino ahora mismo (0 si apunta a otro)
local function lfo(destino)
  if LFO_DESTINOS[params:get("lfo_destino")] ~= destino then return 0 end
  return lfo_valor
end

-- un número al azar entre -1 y 1
local function azar()
  return math.random() * 2 - 1
end

-- mete pausas entre palabras: una coma es una pausa corta y unos puntos
-- suspensivos una larga. los tres motores las respetan.
local function con_silencios(texto, probabilidad)
  local palabras = {}
  for palabra in texto:gmatch("%S+") do table.insert(palabras, palabra) end
  for i = 1, #palabras - 1 do
    -- donde ya hay puntuación no hace falta otra pausa
    if not palabras[i]:match("%p$") and math.random() < probabilidad then
      palabras[i] = palabras[i] .. (math.random() < 0.6 and "," or "...")
    end
  end
  return table.concat(palabras, " ")
end

-- la última palabra de una frase, sin la puntuación de los bordes
local function ultima_palabra(texto)
  local palabra = texto:match("(%S+)%s*$") or ""
  palabra = palabra:gsub("^%p+", "")
  palabra = palabra:gsub("%p+$", "")
  return palabra
end

-- convierte el texto en un .wav con eSpeak y lo pasa a 48 kHz con sox.
-- corre en segundo plano (norns.system_cmd) para que la pantalla y las
-- perillas no se congelen mientras tanto.
local function renderizar(texto, al_terminar)
  local base = DATA_DIR .. "frase" .. turno
  turno = 3 - turno
  local motor = params:get("motor")

  -- cada frase sale con su propia rapidez y sus propios silencios:
  -- el azar los mueve alrededor del valor que pusiste
  local rapidez = params:get("rapidez")
    * 2 ^ (azar() * params:get("azar_rapidez") + lfo("rapidez"))
  rapidez = util.clamp(math.floor(rapidez), 80, 450)
  local silencios = util.clamp(
    params:get("silencios") + azar() * params:get("azar_silencios"), 0, 1)

  -- tono y rapidez valen para los tres motores: 50 de tono y 140
  -- palabras por minuto son "normal", y cada motor lo traduce a lo suyo
  local tono = 2 ^ ((params:get("tono") - 50) / 50)   -- 0.5x .. 2x
  local lentitud = 140 / rapidez                       -- >1 = más lento
  local siseo = util.clamp(params:get("siseo") + lfo("siseo") * 0.5, 0, 1)

  -- escribe un texto en <nombre>.txt y devuelve el comando que lo
  -- convierte en <nombre>.wav, más la ruta de ese .wav
  local function comando(texto, nombre)
    local txt, crudo, wav = nombre .. ".txt", nombre .. ".raw.wav", nombre .. ".wav"
    local f = io.open(txt, "wb")
    if not f then return nil end
    if motor <= 2 then
      -- "\1<n>R" le dice a eSpeak cuánta entonación usar (0 = robot plano)
      texto = string.format("\1%dR", params:get("entonacion")) .. texto
    end
    f:write(texto)
    f:close()
    os.remove(wav)

    -- Festival y DECtalk leen el texto en latin-1, y SAM solo entiende
    -- ASCII; iconv lo convierte (las letras con acento pierden el acento
    -- donde no hay forma de escribirlas)
    local latin1 = nombre .. ".latin1.txt"
    local a_latin1 = string.format("iconv -f UTF-8 -t ISO-8859-1//TRANSLIT %s > %s",
      comillas(txt), comillas(latin1))
    local ascii = string.format("$(iconv -f UTF-8 -t ASCII//TRANSLIT %s)",
      comillas(txt))
    -- lo que sox le hace después a los motores que no saben cambiar
    -- solos su tono o su rapidez
    local con_tono = string.format(" pitch %d", math.floor(
      (params:get("tono") - 50) / 50 * 1200))
    local con_rapidez = string.format(" tempo -s %.2f", rapidez / 140)
    local efectos = ""

    local cmd
    if motor == 1 then
      -- SISEO: eSpeak tiene una variante "whisper" que cambia la vibración
      -- de las cuerdas vocales por aire. para poder ir de a poco, el texto
      -- se genera dos veces (normal y susurrado) y sox los mezcla.
      local function espeak(variante, salida)
        return string.format("espeak-ng -v %s%s -s %d -p %d -f %s -w %s",
          params:string("voz"), variante, rapidez, params:get("tono"),
          comillas(txt), comillas(salida))
      end
      local variante = params:get("variante") == 1 and ""
        or ("+" .. params:string("variante"))
      if siseo < 0.02 then
        cmd = espeak(variante, crudo)
      elseif siseo > 0.98 then
        cmd = espeak("+whisper", crudo)
      else
        local normal, susurro = nombre .. ".normal.wav", nombre .. ".susurro.wav"
        -- el susurro suena más bajo, así que entra con más ganancia
        cmd = espeak(variante, normal) .. " && " .. espeak("+whisper", susurro)
          .. string.format(" && sox -m -v %.2f %s -v %.2f %s %s",
            1 - siseo, comillas(normal), siseo * 2, comillas(susurro),
            comillas(crudo))
      end
    elseif motor == 2 then
      -- MBROLA usa eSpeak para leer el texto y sus voces para sonar
      cmd = string.format("espeak-ng -v mb-%s -s %d -p %d -f %s -w %s",
        params:string("voz_mbrola"), rapidez, params:get("tono"),
        comillas(txt), comillas(crudo))
    elseif motor == 3 then
      cmd = string.format(
        "flite -voice %s --setf duration_stretch=%.2f --setf f0_shift=%.2f"
          .. " -f %s -o %s",
        params:string("voz_flite"), lentitud, tono, comillas(txt), comillas(crudo))
    elseif motor == 4 then
      local modelo = DIR_PIPER .. params:string("voz_piper")
      cmd = string.format("piper --model %s --length_scale %.2f --output_file %s < %s",
        comillas(modelo), lentitud, comillas(crudo), comillas(txt))
      efectos = con_tono
    elseif motor == 5 then
      local voz = params:string("voz_pico")
      if voz == "auto" then
        voz = params:get("idioma") == 1 and "es-ES" or "en-US"
      end
      cmd = string.format("pico2wave -l %s -w %s \"$(cat %s)\"",
        voz, comillas(crudo), comillas(txt))
      efectos = con_tono .. con_rapidez
    elseif motor == 6 then
      local voz = params:get("voz_festival")
      if voz == 1 then voz = params:get("idioma") == 1 and 2 or 3 end
      cmd = a_latin1 .. string.format(" && text2wave -eval %s %s -o %s",
        comillas(voz == 2 and "(voice_el_diphone)" or "(voice_kal_diphone)"),
        comillas(latin1), comillas(crudo))
      efectos = con_tono .. con_rapidez
    elseif motor == 7 then
      -- en SAM un número de speed más alto es más lento, y uno de pitch
      -- más alto es más grave
      local v = VOCES_SAM[params:get("voz_sam")]
      cmd = string.format(
        "sam -wav %s -speed %d -pitch %d -throat %d -mouth %d \"%s\"",
        comillas(crudo), util.clamp(math.floor(v[2] * lentitud), 20, 255),
        util.clamp(math.floor(v[3] / tono), 1, 255), v[4], v[5], ascii)
    else
      -- DECtalk: "sp" es español de España, "la" latinoamericano
      local idioma = params:get("idioma") == 2 and "us"
        or (params:string("voz") == "es" and "sp" or "la")
      cmd = a_latin1 .. string.format(" && dectalk -l %s -s %d -r %d -fi %s -fo %s",
        idioma, params:get("voz_dectalk") - 1, rapidez, comillas(latin1),
        comillas(crudo))
      efectos = con_tono
    end
    -- 48 kHz para softcut, y "norm" para que todo suene igual de fuerte,
    -- sea cual sea el motor
    cmd = cmd .. string.format(" && sox -G %s -r 48000 -c 1 %s%s norm -3",
      comillas(crudo), comillas(wav), efectos)
    return cmd, wav
  end

  local cmd, wav = comando(con_silencios(texto, silencios), base)
  if not cmd then
    al_terminar(nil, "no pude escribir el texto")
    return
  end

  -- el eco: la última palabra sola, con la misma voz, en su propio .wav
  local wav_eco = nil
  local palabra = ultima_palabra(texto)
  if params:get("eco") > 0 and palabra ~= "" then
    local cmd_eco
    cmd_eco, wav_eco = comando(palabra, base .. ".eco")
    if cmd_eco then cmd = cmd .. " && " .. cmd_eco end
  end

  norns.system_cmd(cmd .. " 2>&1", function()
    if not util.file_exists(wav) then
      al_terminar(nil, "falló " .. MOTORES[motor])
      return
    end
    if wav_eco and not util.file_exists(wav_eco) then wav_eco = nil end
    al_terminar(wav, nil, wav_eco)
  end)
end

-- el tipo de filtro y la resonancia, iguales en todas las voces
local function aplicar_filtro()
  local tipo = params:get("filtro")
  -- resonancia 0..1 -> rq de 2 (suave) a 0.1 (silba)
  local rq = util.linlin(0, 1, 2, 0.1, params:get("resonancia"))
  for _, v in ipairs(VOCES_SC) do
    softcut.post_filter_dry(v, tipo == 1 and 1 or 0)
    softcut.post_filter_lp(v, tipo == 2 and 1 or 0)
    softcut.post_filter_bp(v, tipo == 3 and 1 or 0)
    softcut.post_filter_hp(v, tipo == 4 and 1 or 0)
    softcut.post_filter_rq(v, rq)
  end
end

-- la frecuencia de corte; el LFO la mueve hasta 3 octavas arriba o abajo
local function aplicar_corte()
  local fc = util.clamp(params:get("corte") * 2 ^ (lfo("corte") * 3), 20, 18000)
  for _, v in ipairs(VOCES_SC) do softcut.post_filter_fc(v, fc) end
end

-- repite la última palabra después de que termina la frase,
-- cada vez un poco más bajo
local function ecos(espera, dur_eco)
  local espacio = params:get("espacio_eco")
  clock.sleep(espera + espacio)
  -- la intensidad del eco cambia en cada frase con el azar...
  local nivel = params:get("eco") * (1 + azar() * params:get("azar_eco"))
  for i = 1, params:get("repeticiones") do
    -- ...y en cada repetición con el LFO
    local este = util.clamp(nivel * (1 + lfo("eco")), 0, 1)
    -- la voz del eco también sirve para escuchar samples (buffer 2)
    softcut.buffer(VOZ_ECO, 1)
    softcut.rate(VOZ_ECO, 1)
    softcut.level(VOZ_ECO, este * 0.6 ^ (i - 1))
    softcut.loop_start(VOZ_ECO, ECO_INICIO)
    softcut.loop_end(VOZ_ECO, ECO_INICIO + dur_eco)
    softcut.position(VOZ_ECO, ECO_INICIO)
    softcut.play(VOZ_ECO, 1)
    clock.sleep(dur_eco + espacio)
  end
  reloj_eco = nil
end

-- carga el .wav en el buffer de softcut y lo reproduce con la voz seca;
-- si hay eco, lo carga aparte y lo programa para cuando termine la frase
local function sonar(wav, wav_eco)
  local _, muestras, sr = audio.file_info(wav)
  if not muestras or muestras == 0 then return end
  local dur = muestras / sr

  softcut.buffer_clear_region_channel(1, 0, math.max(dur, dur_frase) + 1)
  softcut.buffer_read_mono(wav, 0, 0, -1, 1, 1)

  -- una frase nueva corta el eco de la anterior
  if reloj_eco then
    clock.cancel(reloj_eco)
    reloj_eco = nil
  end
  local dur_eco = 0
  if wav_eco then
    local _, m, r = audio.file_info(wav_eco)
    if m and m > 0 then
      dur_eco = m / r
      softcut.buffer_clear_region_channel(1, ECO_INICIO, 10)
      softcut.buffer_read_mono(wav_eco, 0, ECO_INICIO, -1, 1, 1)
    end
  end

  clock.run(function()
    clock.sleep(0.1)  -- tiempo para que el archivo termine de cargarse
    dur_frase = dur
    cabeza = 0
    local rate = VELOCIDADES[params:get("velocidad")]
    softcut.loop_start(VOZ_SECA, 0)
    softcut.loop_end(VOZ_SECA, dur)
    softcut.loop(VOZ_SECA, params:get("repetir") - 1)
    softcut.rate(VOZ_SECA, rate)
    -- en reversa empieza desde el final
    softcut.position(VOZ_SECA, rate < 0 and dur or 0)
    softcut.play(VOZ_SECA, 1)
    frase_desde = util.time()
    frase_hasta = params:get("repetir") == 2 and math.huge
      or frase_desde + dur / math.abs(rate)
    if dur_eco > 0 then
      reloj_eco = clock.run(ecos, dur / math.abs(rate), dur_eco)
    end
  end)
end

-- un grano: un pedacito de la frase que suena una sola vez,
-- con su propio tono y su propio lugar en el estéreo
local function disparar_grano()
  local v = GRANOS[siguiente_grano]
  siguiente_grano = siguiente_grano % #GRANOS + 1

  local tam = params:get("tamano") * 2 ^ (lfo("tamaño") * 2)
  tam = util.clamp(tam, 0.01, dur_frase)
  -- el grano sale de donde va la cabeza, más un desvío al azar
  local desvio = (math.random() * 2 - 1) * params:get("dispersion") * dur_frase
  local inicio = util.clamp((cabeza + desvio) % dur_frase, 0, dur_frase - tam)
  local semi = params:get("tono_granos") + lfo("tono granos") * 12
    + (math.random() * 2 - 1) * params:get("variacion")

  -- el fade de softcut hace de envolvente: el grano entra y sale suave
  softcut.fade_time(v, math.min(tam * 0.3, 0.1))
  -- la misma voz puede haber tocado antes un grano de sample
  softcut.buffer(v, 1)
  softcut.level(v, params:get("granos"))
  softcut.loop_start(v, inicio)
  softcut.loop_end(v, inicio + tam)
  softcut.rate(v, 2 ^ (semi / 12))
  softcut.pan(v, (math.random() * 2 - 1) * params:get("estereo"))
  softcut.position(v, inicio)
  softcut.play(v, 1)

  table.insert(marcas, { x = inicio / dur_frase, vida = 1 })
  if #marcas > 16 then table.remove(marcas, 1) end
end

-- ---------------------------------------------------------------------------
-- samples de voz
-- ---------------------------------------------------------------------------

-- lee la energía de un sample (el .env que hace sox: audio a 4 kHz,
-- 16 bits) y encuentra dónde hay voz y dónde empieza cada sílaba
local function analizar(ruta_env, dur)
  local frames = math.max(1, math.floor(dur / FRAME))
  local env = {}
  local f = io.open(ruta_env, "rb")
  if f then
    local datos = f:read("a")
    f:close()
    local n = 40                       -- 10 ms a 4 kHz
    local formato_frame = "<" .. string.rep("i2", n)
    local pos = 1
    while #env < frames and pos + n * 2 - 1 <= #datos do
      local valores = { string.unpack(formato_frame, datos, pos) }
      pos = table.remove(valores)      -- string.unpack devuelve al final
      local suma = 0                   -- la posición siguiente
      for _, x in ipairs(valores) do suma = suma + x * x end
      table.insert(env, math.sqrt(suma / n))
    end
  end
  -- sin análisis, todo cuenta como voz y no hay sílabas
  if #env == 0 then
    for i = 1, frames do env[i] = 1 end
  end

  local maximo = 0
  for _, x in ipairs(env) do maximo = math.max(maximo, x) end
  if maximo > 0 then
    for i, x in ipairs(env) do env[i] = x / maximo end
  end

  -- la energía suavizada (50 ms), para que las sílabas no salgan dobles
  local suave = {}
  for i = 1, #env do
    local suma, cuantos = 0, 0
    for k = i - 2, i + 2 do
      if env[k] then suma, cuantos = suma + env[k], cuantos + 1 end
    end
    suave[i] = suma / cuantos
  end

  -- dónde hay voz: lo que no es silencio ni respiración muy suave
  local activo = {}
  for i, x in ipairs(suave) do activo[i] = x > 0.06 end

  -- una sílaba es un pico de energía (su vocal), con al menos 80 ms
  -- desde la anterior. empieza donde la energía empieza a subir hacia ese pico
  local silabas = {}
  local ultimo_pico = -100
  for i = 2, #suave - 1 do
    local x = suave[i]
    if x > 0.2 and i - ultimo_pico >= 8 then
      local es_pico = true
      for k = i - 6, i + 6 do
        if suave[k] and suave[k] > x then
          es_pico = false
          break
        end
      end
      if es_pico then
        local inicio = i
        while inicio > 1 and suave[inicio - 1] <= suave[inicio]
          and suave[inicio - 1] > x * 0.3 do
          inicio = inicio - 1
        end
        table.insert(silabas, (inicio - 1) * FRAME)
        ultimo_pico = i
      end
    end
  end

  -- la forma de onda para la pantalla: 128 columnas
  local forma = {}
  for c = 1, 128 do
    local desde = math.floor((c - 1) / 128 * #env) + 1
    local hasta = math.max(desde, math.floor(c / 128 * #env))
    local alto = 0
    for i = desde, hasta do alto = math.max(alto, env[i] or 0) end
    forma[c] = alto
  end

  return { forma = forma, activo = activo, silabas = silabas }
end

-- pone en el buffer 2 un sample ya preparado (base.wav y base.env)
local function agregar_sample(base)
  if #samples >= MAX_SAMPLES then return false end
  local _, muestras, sr = audio.file_info(base .. ".wav")
  if not muestras or muestras == 0 then return false end
  local dur = math.min(muestras / sr, MAX_DUR)
  if fin_buffer + dur > BUFFER_MAX then return false end

  softcut.buffer_read_mono(base .. ".wav", 0, fin_buffer, dur, 1, BUFFER_SAMPLES)
  local s = analizar(base .. ".env", dur)
  s.base = base
  s.nombre = (base:match("[^/]+$"):gsub("^%d+%-", ""))
  s.inicio = fin_buffer
  s.dur = dur
  table.insert(samples, s)
  -- medio segundo de silencio entre uno y otro, para que los granos
  -- y su fade no se metan en el sample vecino
  fin_buffer = fin_buffer + dur + 0.5
  return true
end

-- vuelve a cargar todos los samples guardados, en orden
local function recargar_samples()
  samples = {}
  fin_buffer = 0
  softcut.buffer_clear_channel(BUFFER_SAMPLES)
  local lista = util.os_capture("ls " .. comillas(SAMPLES_DIR) .. " 2>/dev/null", true)
  siguiente_id = 1
  for nombre in lista:gmatch("[^\n]+") do
    local base = nombre:match("^(.+)%.wav$")
    if base then
      agregar_sample(SAMPLES_DIR .. base)
      local id = tonumber(base:match("^(%d+)%-"))
      if id then siguiente_id = math.max(siguiente_id, id + 1) end
    end
  end
  slot_ciclo = util.clamp(slot_ciclo, 1, math.max(1, #samples))
end

-- convierte un archivo cualquiera en uno o varios samples listos:
-- 48 kHz mono, normalizado y sin silencio en los bordes. con "trocear",
-- sox lo parte cada vez que encuentra una pausa
local function preparar(ruta, al_terminar)
  local todo = CORTE_DIR .. "todo.wav"
  local sin_bordes = " norm -3 silence 1 0.02 -45d reverse silence 1 0.02 -45d reverse"
  local cmd = "rm -rf " .. comillas(CORTE_DIR) .. " && mkdir -p " .. comillas(CORTE_DIR)
    .. " && sox " .. comillas(ruta) .. " -r 48000 -c 1 -b 16 " .. comillas(todo)
    .. sin_bordes
  local trocear = params:get("s_trocear") == 2
  if trocear then
    cmd = cmd .. string.format(
      " && sox %s %s silence 1 0.02 -45d 1 %.2f -45d : newfile : restart && rm %s",
      comillas(todo), comillas(CORTE_DIR .. "p.wav"), params:get("s_pausa"),
      comillas(todo))
  else
    cmd = cmd .. " && mv " .. comillas(todo) .. " " .. comillas(CORTE_DIR .. "p001.wav")
  end
  -- la energía de cada pedazo, para encontrar sus sílabas
  cmd = cmd .. " && for f in " .. comillas(CORTE_DIR) .. "p*.wav; do"
    .. " sox \"$f\" -t raw -r 4000 -e signed -b 16 -c 1 \"${f%.wav}.env\"; done"

  -- el nombre del sample: el del archivo, sin extensión ni caracteres raros
  local nombre = ruta:match("([^/]+)$"):gsub("%.[^.]*$", ""):gsub("[^%w_-]", "_"):sub(1, 20)

  norns.system_cmd(cmd .. " 2>&1", function()
    local lista = util.os_capture("ls " .. comillas(CORTE_DIR) .. " 2>/dev/null", true)
    local pedazos = {}
    for archivo in lista:gmatch("[^\n]+") do
      local base = archivo:match("^(p%d+)%.wav$")
      if base then table.insert(pedazos, CORTE_DIR .. base) end
    end
    local nuevos = 0
    for i, pedazo in ipairs(pedazos) do
      local _, muestras, sr = audio.file_info(pedazo .. ".wav")
      -- los pedacitos de menos de 60 ms son ruido, no voz
      if muestras and sr and muestras / sr >= 0.06 then
        local base = SAMPLES_DIR .. string.format("%03d-%s", siguiente_id,
          #pedazos > 1 and (nombre .. "-" .. i) or nombre)
        os.rename(pedazo .. ".wav", base .. ".wav")
        os.rename(pedazo .. ".env", base .. ".env")
        if agregar_sample(base) then
          siguiente_id = siguiente_id + 1
          nuevos = nuevos + 1
        else
          os.remove(base .. ".wav")
          os.remove(base .. ".env")
        end
      end
    end
    al_terminar(nuevos)
  end)
end

-- carga uno o varios archivos, uno detrás de otro
local function cargar(rutas)
  if cargando then return end
  if not hay.sox then
    estado_s = "falta sox"
    return
  end
  cargando = true
  local total, i = 0, 0
  local function siguiente(nuevos)
    total = total + (nuevos or 0)
    i = i + 1
    if i > #rutas or #samples >= MAX_SAMPLES then
      cargando = false
      if total == 0 then
        estado_s = #samples >= MAX_SAMPLES and "no caben más" or "no cargó nada"
      else
        estado_s = total == 1 and "1 sample nuevo" or (total .. " samples nuevos")
        -- muestra el último que llegó, y que suene si estaba en 0
        params:set("sample", #samples)
        if params:get("s_volumen") == 0 then params:set("s_volumen", 0.6) end
      end
      return
    end
    estado_s = #rutas > 1 and string.format("cargando %d/%d", i, #rutas)
      or "cargando..."
    preparar(rutas[i], siguiente)
  end
  siguiente()
end

-- K2 en la pestaña SAMPLES: elegir un archivo (o una carpeta)
local function elegir_archivo()
  if cargando then return end
  fileselect.enter(_path.audio, function(ruta)
    if not ruta or ruta == "cancel" then return end
    if params:get("s_cargar") == 1 then
      cargar({ ruta })
      return
    end
    -- carpeta: todos los archivos de audio que estén junto al elegido
    local carpeta = ruta:match("^(.*/)")
    local rutas = {}
    local lista = util.os_capture("ls " .. comillas(carpeta) .. " 2>/dev/null", true)
    for archivo in lista:gmatch("[^\n]+") do
      local ext = (archivo:match("%.(%w+)$") or ""):lower()
      for _, e in ipairs(EXTENSIONES) do
        if ext == e then table.insert(rutas, carpeta .. archivo) end
      end
    end
    cargar(rutas)
  end)
end

-- borra el sample elegido, o todos, y reacomoda el buffer
local function quitar_samples(todos)
  if cargando or #samples == 0 then return end
  local elegidos = todos and samples
    or { samples[util.clamp(params:get("sample"), 1, #samples)] }
  for _, s in ipairs(elegidos) do
    os.remove(s.base .. ".wav")
    os.remove(s.base .. ".env")
  end
  recargar_samples()
  params:set("sample", util.clamp(params:get("sample"), 1, math.max(1, #samples)))
  estado_s = #samples == 0 and "K2: cargar sample" or "quitado"
end

-- el sample que se ve en pantalla y que sigue la cabeza
local function sample_actual()
  if #samples == 0 then return nil end
  if params:get("s_eleccion") == 3 then
    return util.clamp(slot_ciclo, 1, #samples)
  end
  return util.clamp(params:get("sample"), 1, #samples)
end

-- ¿toca que suenen los granos de samples ahora? pueden sonar siempre,
-- solo mientras habla la síntesis, o solo en sus silencios
local function toca_samples()
  local cuando = params:get("s_cuando")
  if cuando == 1 then return true end
  local ahora = util.time()
  local hablando = ahora >= frase_desde and ahora < frase_hasta
  return (cuando == 2) == hablando
end

-- la sílaba que está sonando en el momento t, o una al azar cerca de t
local function silaba_cerca(s, t, ventana)
  local previa = s.silabas[#s.silabas]
  local opciones = {}
  for _, x in ipairs(s.silabas) do
    if x <= t then previa = x end
    if math.abs(x - t) <= ventana then table.insert(opciones, x) end
  end
  if ventana > 0 and #opciones > 0 then return opciones[math.random(#opciones)] end
  return previa
end

-- desde t, el primer momento en que hay voz (da la vuelta si hace falta)
local function siguiente_voz(s, t)
  local frames = #s.activo
  local i = math.floor(t / FRAME) + 1
  for k = 0, frames - 1 do
    local j = (i - 1 + k) % frames + 1
    if s.activo[j] then return (j - 1) * FRAME end
  end
  return t
end

-- un grano de sample: igual que los de la frase, pero desde el buffer 2,
-- y pensado para voz: puede caer justo al principio de una sílaba,
-- saltarse los silencios y sonar al revés
local function disparar_grano_sample()
  local n = params:get("s_eleccion") == 2 and math.random(#samples) or sample_actual()
  local s = samples[n]
  local v = GRANOS[siguiente_grano]
  siguiente_grano = siguiente_grano % #GRANOS + 1

  local tam = util.clamp(params:get("s_tamano"), 0.01, s.dur)
  local cabeza = cabeza_s % s.dur
  local ventana = params:get("s_dispersion") * s.dur
  local donde
  if #s.silabas > 0 and math.random() < params:get("s_silabas") then
    -- 15 ms antes de la sílaba, para no comerse la consonante
    donde = silaba_cerca(s, cabeza, ventana) - 0.015
  else
    donde = (cabeza + azar() * ventana) % s.dur
    if params:get("s_saltar") == 2 then donde = siguiente_voz(s, donde) end
  end
  donde = util.clamp(donde, 0, math.max(0, s.dur - tam))

  local semi = params:get("s_tono") + lfo("tono samples") * 12
    + azar() * params:get("s_variacion")
  local rate = 2 ^ (semi / 12)
  local al_reves = math.random() < params:get("s_reversa")

  softcut.fade_time(v, math.min(tam * 0.3, 0.1))
  softcut.buffer(v, BUFFER_SAMPLES)
  softcut.level(v, params:get("s_volumen"))
  softcut.loop_start(v, s.inicio + donde)
  softcut.loop_end(v, s.inicio + donde + tam)
  softcut.rate(v, al_reves and -rate or rate)
  softcut.pan(v, azar() * params:get("s_estereo"))
  softcut.position(v, s.inicio + donde + (al_reves and tam or 0))
  softcut.play(v, 1)

  table.insert(marcas_s, { sample = n, x = donde / s.dur, vida = 1 })
  if #marcas_s > 16 then table.remove(marcas_s, 1) end
end

-- K3 en la pestaña SAMPLES: el sample entero, tal cual, por la voz del eco
local function escuchar()
  local n = sample_actual()
  if not n then return end
  local s = samples[n]
  if reloj_eco then
    clock.cancel(reloj_eco)
    reloj_eco = nil
  end
  softcut.buffer(VOZ_ECO, BUFFER_SAMPLES)
  softcut.level(VOZ_ECO, params:get("volumen"))
  softcut.rate(VOZ_ECO, 1)
  softcut.loop_start(VOZ_ECO, s.inicio)
  softcut.loop_end(VOZ_ECO, s.inicio + s.dur)
  softcut.position(VOZ_ECO, s.inicio)
  softcut.play(VOZ_ECO, 1)
  estado_s = "escuchando " .. s.nombre
end

-- ---------------------------------------------------------------------------
-- modo caracteres: números, letras y símbolos sueltos
-- ---------------------------------------------------------------------------

-- los nombres de las letras, para que cada motor las diga como letra
-- y no intente leerlas como palabra
local LETRAS = {
  { "a", "be", "ce", "de", "e", "efe", "ge", "hache", "i", "jota", "ka",
    "ele", "eme", "ene", "o", "pe", "cu", "erre", "ese", "te", "u", "uve",
    "uve doble", "equis", "i griega", "zeta" },
  { "ay", "bee", "see", "dee", "ee", "ef", "gee", "aitch", "eye", "jay",
    "kay", "el", "em", "en", "oh", "pee", "cue", "ar", "ess", "tee", "you",
    "vee", "double you", "ex", "why", "zee" },
}

-- símbolos: { cómo se ve en pantalla, cómo se dice en español, en inglés }.
-- las letras griegas van escritas porque la pantalla no las dibuja
local SIMBOLOS = {
  { "+", "más", "plus" }, { "-", "menos", "minus" }, { "=", "igual", "equals" },
  { "%", "por ciento", "percent" }, { "/", "barra", "slash" },
  { "*", "asterisco", "asterisk" }, { "#", "numeral", "hash" },
  { "@", "arroba", "at" }, { "<", "menor que", "less than" },
  { ">", "mayor que", "greater than" }, { "^", "elevado a", "to the power of" },
  { "~", "aproximadamente", "approximately" }, { "pi", "pi", "pi" },
  { "delta", "delta", "delta" }, { "lambda", "lambda", "lambda" },
  { "omega", "omega", "omega" }, { "psi", "psi", "psi" },
  { "sigma", "sigma", "sigma" }, { "inf", "infinito", "infinity" },
  { "raiz", "raíz", "root" },
}

-- arma una secuencia de caracteres sueltos. devuelve dos textos: el que se
-- ve en pantalla ("7  K  delta") y el que se dice ("siete. ka. delta.")
local function caracteres(cantidad)
  local idioma = params:get("idioma")
  local tipo = params:get("tipo_caracteres")   -- 1 todo, 2 números, 3 letras, 4 símbolos
  local vistos, dichos = {}, {}
  for _ = 1, cantidad do
    local t = tipo == 1 and math.random(3) or tipo - 1
    local visto, dicho
    if t == 1 then
      -- casi siempre un dígito; a veces un número más largo
      visto = tostring(math.random() < 0.75 and math.random(0, 9)
        or math.random(10, 999))
      dicho = visto
    elseif t == 2 then
      local i = math.random(26)
      visto = string.char(64 + i)
      dicho = LETRAS[idioma][i]
    else
      local simbolo = SIMBOLOS[math.random(#SIMBOLOS)]
      visto = simbolo[1]
      dicho = simbolo[idioma + 1]
    end
    table.insert(vistos, visto)
    table.insert(dichos, dicho)
  end
  -- un punto después de cada uno los deja aislados, con una pausa clara
  return table.concat(vistos, "  "), table.concat(dichos, ". ") .. "."
end

local function decir()
  if ocupado then return end
  local motor = params:get("motor")
  local falta = not hay.sox and "sox"
    or not hay[PROGRAMA_DE_MOTOR[motor]] and MOTORES[motor]
    or motor == 2 and not hay["espeak-ng"] and "eSpeak"
    or motor == 2 and voces_mbrola[1] == "-" and "voz mbrola"
    or motor == 4 and voces_piper[1] == "-" and "voz piper"
  if falta then
    estado = "falta " .. falta
    redraw()
    return
  end

  ocupado = true
  -- MODO: frases, caracteres sueltos, o una de las dos al azar
  local modo = params:get("modo")
  if modo == 3 then modo = math.random(2) end
  local texto
  if modo == 2 then
    frase, texto = caracteres(params:get("cantidad"))
  else
    frase = frases.generar(temas(), params:get("tema"), params:get("mezclar") == 2)
    texto = frase
  end
  estado = "pensando..."
  redraw()

  renderizar(texto, function(wav, problema, wav_eco)
    ocupado = false
    if wav then
      ultimo_wav = wav
      sonar(wav, wav_eco)
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

local function formato(patron)
  return function(p) return string.format(patron, p:get()) end
end

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
  end)

  -- el tema es un número y no una lista de nombres, porque los nombres
  -- cambian con el idioma; el formatter muestra el nombre del idioma actual
  params:add_number("tema", "tema", 1, #IDIOMAS[1], 1, function(p)
    return temas()[p:get()].nombre
  end)
  params:add_option("mezclar", "mezclar temas", { "no", "sí" }, 1)
  params:add_option("modo", "modo", { "frases", "caracteres", "mezcla" }, 1)
  params:add_option("tipo_caracteres", "caracteres",
    { "todo", "números", "letras", "símbolos" }, 1)
  params:add_number("cantidad", "caracteres por turno", 1, 12, 4)
  params:add_option("intervalo", "automático cada", INTERVALO_NOMBRES, 4)
  -- probabilidad de que un turno del modo automático se quede callado
  params:add_control("pausas", "pausas (auto)",
    controlspec.new(0, 1, "lin", 0, 0, ""), formato("%.2f"))

  params:add_separator("voxbox_motor", "MOTOR")
  params:add_option("motor", "motor de voz", MOTORES, 1)
  params:add_option("voz", "voz eSpeak", VOCES, 2)
  params:add_option("variante", "variante eSpeak", VARIANTES, 1)
  params:add_option("voz_mbrola", "voz MBROLA", voces_mbrola, 1)
  params:add_option("voz_flite", "voz flite (inglés)", VOCES_FLITE, 1)
  params:add_option("voz_piper", "voz Piper", voces_piper, 1)
  params:add_option("voz_pico", "voz Pico", VOCES_PICO, 1)
  params:add_option("voz_festival", "voz Festival", VOCES_FESTIVAL, 1)
  local nombres_sam = {}
  for i, v in ipairs(VOCES_SAM) do nombres_sam[i] = v[1] end
  params:add_option("voz_sam", "voz SAM (inglés)", nombres_sam, 1)
  params:add_option("voz_dectalk", "voz DECtalk", VOCES_DECTALK, 1)
  params:add_number("tono", "tono", 0, 99, 50)
  params:add_number("entonacion", "entonación", 0, 100, 50)
  -- 0 = voz normal, 1 = susurro puro (solo con eSpeak)
  params:add_control("siseo", "siseo (eSpeak)",
    controlspec.new(0, 1, "lin", 0, 0, ""), formato("%.2f"))
  params:add_separator("voxbox_habla", "HABLA")
  params:add_number("rapidez", "rapidez (palabras/min)", 80, 450, 140)
  -- probabilidad de una pausa entre cada par de palabras
  params:add_control("silencios", "silencios",
    controlspec.new(0, 1, "lin", 0, 0, ""), formato("%.2f"))
  -- cuánto cambia cada frase al azar: rapidez hasta el doble o la mitad,
  -- silencios hasta todo o nada
  params:add_control("azar_rapidez", "azar en rapidez",
    controlspec.new(0, 1, "lin", 0, 0, ""), formato("%.2f"))
  params:add_control("azar_silencios", "azar en silencios",
    controlspec.new(0, 1, "lin", 0, 0, ""), formato("%.2f"))

  params:add_option("velocidad", "reproducción", VELOCIDAD_NOMBRES, 4)
  params:add_option("repetir", "repetir en loop", { "no", "sí" }, 1)
  params:set_action("repetir", function(x) softcut.loop(VOZ_SECA, x - 1) end)
  params:add_control("volumen", "volumen voz",
    controlspec.new(0, 1, "lin", 0, 0.8, ""), formato("%.2f"))
  params:set_action("volumen", function(x) softcut.level(VOZ_SECA, x) end)

  params:add_separator("voxbox_eco", "ECO")
  -- volumen de la primera repetición; en 0 no hay eco
  params:add_control("eco", "eco última palabra",
    controlspec.new(0, 1, "lin", 0, 0, ""), formato("%.2f"))
  params:add_number("repeticiones", "repeticiones", 1, 6, 2)
  params:add_control("espacio_eco", "espacio entre ecos",
    controlspec.new(0.05, 1.5, "exp", 0, 0.3, "s"), formato("%.2fs"))
  -- cuánto cambia la intensidad del eco de una frase a otra
  params:add_control("azar_eco", "azar en eco",
    controlspec.new(0, 1, "lin", 0, 0, ""), formato("%.2f"))

  params:add_separator("voxbox_filtro", "FILTRO")
  params:add_option("filtro", "tipo", FILTROS, 2)
  params:set_action("filtro", aplicar_filtro)
  params:add_control("corte", "corte",
    controlspec.new(60, 16000, "exp", 0, 8000, "hz"), function(p)
      local hz = p:get()
      return hz >= 1000 and string.format("%.1fk", hz / 1000)
        or string.format("%d", hz)
    end)
  params:set_action("corte", aplicar_corte)
  params:add_control("resonancia", "resonancia",
    controlspec.new(0, 1, "lin", 0, 0.2, ""), formato("%.2f"))
  params:set_action("resonancia", aplicar_filtro)

  params:add_separator("voxbox_granos", "GRANOS")
  -- en 0 no se dispara ningún grano
  -- el volumen se aplica en cada grano, porque las mismas voces
  -- tocan también los granos de samples
  params:add_control("granos", "volumen granos",
    controlspec.new(0, 1, "lin", 0, 0, ""), formato("%.2f"))
  params:add_control("densidad", "granos por segundo",
    controlspec.new(1, 40, "exp", 0, 8, "/s"), formato("%.1f/s"))
  params:add_control("tamano", "tamaño del grano",
    controlspec.new(0.02, 1, "exp", 0, 0.12, "s"), function(p)
      return string.format("%dms", math.floor(p:get() * 1000))
    end)
  params:add_control("dispersion", "dispersión",
    controlspec.new(0, 1, "lin", 0, 0.1, ""), formato("%.2f"))
  -- 1 = recorre la frase a su velocidad, 0 = congela, negativo = hacia atrás
  params:add_control("avance", "avance",
    controlspec.new(-2, 2, "lin", 0.05, 1, "x"), function(p)
      local x = p:get()
      return math.abs(x) < 0.01 and "congelado" or string.format("%.2fx", x)
    end)
  params:add_number("tono_granos", "tono granos", -24, 24, 0, formato("%dst"))
  params:add_control("variacion", "variación de tono",
    controlspec.new(0, 12, "lin", 0, 0, "st"), formato("%.1fst"))
  params:add_control("estereo", "apertura estéreo",
    controlspec.new(0, 1, "lin", 0, 0.6, ""), formato("%.2f"))

  params:add_separator("voxbox_lfo", "LFO")
  params:add_option("lfo_destino", "destino", LFO_DESTINOS, 1)
  params:set_action("lfo_destino", function() aplicar_corte() end)
  params:add_control("lfo_vel", "velocidad",
    controlspec.new(0.02, 10, "exp", 0, 0.25, "hz"), formato("%.2fhz"))
  params:add_control("lfo_prof", "profundidad",
    controlspec.new(0, 1, "lin", 0, 0, ""), formato("%.2f"))
  params:set_action("lfo_prof", function() aplicar_corte() end)

  params:add_separator("voxbox_samples", "SAMPLES")
  -- el número de sample; en pantalla se ve su nombre
  params:add_number("sample", "sample", 1, MAX_SAMPLES, 1, function(p)
    local s = samples[p:get()]
    return s and s.nombre or "-"
  end)
  -- fijo: el elegido. azar: uno distinto en cada grano.
  -- ciclo: pasa al siguiente cada vez que la cabeza termina uno
  params:add_option("s_eleccion", "elección", { "fijo", "azar", "ciclo" }, 1)
  params:add_option("s_cargar", "K2 carga", { "un archivo", "la carpeta" }, 1)
  params:add_option("s_trocear", "trocear", { "no trocear", "en pausas" }, 1)
  -- cuánto silencio hace falta para cortar al trocear
  params:add_control("s_pausa", "pausa para trocear",
    controlspec.new(0.08, 1.5, "exp", 0, 0.25, "s"), formato("%.2fs"))
  params:add_control("s_volumen", "volumen samples",
    controlspec.new(0, 1, "lin", 0, 0, ""), formato("%.2f"))
  params:add_option("s_cuando", "suenan",
    { "siempre", "con la frase", "entre frases" }, 1)
  params:add_control("s_densidad", "granos por segundo",
    controlspec.new(1, 40, "exp", 0, 6, "/s"), formato("%.1f/s"))
  params:add_control("s_tamano", "tamaño del grano",
    controlspec.new(0.02, 1, "exp", 0, 0.18, "s"), function(p)
      return string.format("%dms", math.floor(p:get() * 1000))
    end)
  params:add_control("s_avance", "avance",
    controlspec.new(-2, 2, "lin", 0.05, 1, "x"), function(p)
      local x = p:get()
      return math.abs(x) < 0.01 and "congelado" or string.format("%.2fx", x)
    end)
  params:add_control("s_dispersion", "dispersión",
    controlspec.new(0, 1, "lin", 0, 0.05, ""), formato("%.2f"))
  -- probabilidad de que un grano empiece justo en una sílaba
  params:add_control("s_silabas", "sílabas",
    controlspec.new(0, 1, "lin", 0, 0.5, ""), formato("%.2f"))
  params:add_option("s_saltar", "saltar silencios", { "no", "sí" }, 2)
  params:add_number("s_tono", "tono samples", -24, 24, 0, formato("%dst"))
  params:add_control("s_variacion", "variación de tono",
    controlspec.new(0, 12, "lin", 0, 0, "st"), formato("%.1fst"))
  params:add_control("s_estereo", "apertura estéreo",
    controlspec.new(0, 1, "lin", 0, 0.5, ""), formato("%.2f"))
  -- probabilidad de que un grano suene al revés
  params:add_control("s_reversa", "reversa",
    controlspec.new(0, 1, "lin", 0, 0, ""), formato("%.2f"))
  params:add_trigger("s_quitar", "quitar sample elegido")
  params:set_action("s_quitar", function() quitar_samples(false) end)
  params:add_trigger("s_borrar", "borrar todos los samples")
  params:set_action("s_borrar", function() quitar_samples(true) end)

  params:add_separator("voxbox_guardar", "")
  params:add_trigger("guardar", "guardar última frase")
  params:set_action("guardar", guardar)
end

-- ---------------------------------------------------------------------------
-- norns
-- ---------------------------------------------------------------------------

function init()
  util.make_dir(DATA_DIR)
  util.make_dir(AUDIO_DIR)
  util.make_dir(SAMPLES_DIR)

  hay.sox = hay_programa("sox")
  for _, programa in ipairs(PROGRAMA_DE_MOTOR) do
    hay[programa] = hay_programa(programa)
  end
  -- las voces de MBROLA instaladas: cada una es una carpeta (es1, us1...)
  local carpetas = util.os_capture("ls " .. DIR_MBROLA .. " 2>/dev/null", true)
  local mbrola = {}
  for nombre in carpetas:gmatch("[^\n]+") do table.insert(mbrola, nombre) end
  if #mbrola > 0 then voces_mbrola = mbrola end
  -- las voces de Piper que haya en su carpeta
  local lista = util.os_capture("ls " .. DIR_PIPER .. " 2>/dev/null", true)
  local encontradas = {}
  for nombre in lista:gmatch("[^\n]+") do
    if nombre:match("%.onnx$") then table.insert(encontradas, nombre) end
  end
  if #encontradas > 0 then voces_piper = encontradas end

  softcut.reset()
  audio.level_cut(1)
  for _, v in ipairs(VOCES_SC) do
    softcut.enable(v, 1)
    softcut.buffer(v, 1)
    softcut.level(v, 0)
    softcut.pan(v, 0)
    softcut.rec(v, 0)
    softcut.loop(v, 0)
    softcut.fade_time(v, 0.01)
  end
  -- ojo: softcut.reset() deja en cero todas las salidas del filtro;
  -- aplicar_filtro() (desde params:bang) las vuelve a abrir

  -- los samples de la última vez
  softcut.buffer_clear()
  recargar_samples()

  agregar_parametros()
  params:bang()

  -- modo automático: cada cierto número de tiempos dice una frase nueva
  clock.run(function()
    while true do
      clock.sync(INTERVALOS[params:get("intervalo")])
      if auto then
        -- PAUSAS: a veces el turno se queda en silencio
        if math.random() < params:get("pausas") then
          estado = "pausa"
        else
          decir()
        end
      end
    end
  end)

  -- los granos: se disparan uno tras otro, tan seguido como diga la densidad
  clock.run(function()
    while true do
      local dens = params:get("densidad") * 2 ^ (lfo("densidad") * 2)
      local dt = 1 / util.clamp(dens, 0.5, 60)
      clock.sleep(dt)
      if params:get("granos") > 0 and dur_frase > 0 then
        -- la cabeza recorre la frase; en "congelado" se queda quieta
        cabeza = (cabeza + params:get("avance") * dt) % dur_frase
        disparar_grano()
      end
    end
  end)

  -- los granos de samples: su propio reloj, sus propios parámetros
  clock.run(function()
    while true do
      local dt = 1 / util.clamp(params:get("s_densidad"), 0.5, 60)
      clock.sleep(dt)
      local n = sample_actual()
      if n then
        local dur = samples[n].dur
        cabeza_s = cabeza_s + params:get("s_avance") * dt
        if cabeza_s >= dur or cabeza_s < 0 then
          cabeza_s = cabeza_s % dur
          if params:get("s_eleccion") == 3 then
            slot_ciclo = slot_ciclo % #samples + 1
          end
        end
        if params:get("s_volumen") > 0 and toca_samples() then
          disparar_grano_sample()
        end
      end
    end
  end)

  -- el LFO: una onda seno lenta, 30 veces por segundo
  clock.run(function()
    local dt = 1 / 30
    while true do
      clock.sleep(dt)
      lfo_fase = (lfo_fase + params:get("lfo_vel") * dt) % 1
      lfo_valor = math.sin(lfo_fase * 2 * math.pi) * params:get("lfo_prof")
      if LFO_DESTINOS[params:get("lfo_destino")] == "corte" then
        aplicar_corte()
      end
      for _, m in ipairs(marcas) do m.vida = m.vida - dt * 1.5 end
      for _, m in ipairs(marcas_s) do m.vida = m.vida - dt * 1.5 end
    end
  end)

  -- la pantalla se redibuja sola, 15 veces por segundo
  clock.run(function()
    while true do
      clock.sleep(1 / 15)
      redraw()
    end
  end)
end

-- en una página, E2 o E3 pueden nombrar un parámetro fijo o una función
-- que decide cuál (la página MOTOR cambia según el motor)
local function id_param(x)
  return type(x) == "function" and x() or x
end

local function mover(id, d)
  if id == "sample" then
    -- solo entre los samples que hay cargados
    params:set("sample", util.clamp(params:get("sample") + d, 1,
      math.max(1, #samples)))
  else
    params:delta(id, d)
  end
end

-- E1 recorre todas las páginas: las de SÍNTESIS y después las de SAMPLES
function enc(n, d)
  if n == 1 then
    pagina = util.clamp(pagina + d, 1, #PAGINAS)
    pagina_de[PAGINAS[pagina].pestana] = pagina
  elseif n == 2 then
    mover(id_param(PAGINAS[pagina].e2), d)
  elseif n == 3 then
    mover(id_param(PAGINAS[pagina].e3), d)
  end
  redraw()
end

local function cambiar_pestana()
  local otra = 3 - PAGINAS[pagina].pestana
  pagina = pagina_de[otra]
end

-- K2 actúa al soltarlo: así, mantenido, puede usarse con K3
-- para cambiar de pestaña sin decir una frase
function key(n, z)
  local pestana = PAGINAS[pagina].pestana
  if n == 2 then
    if z == 1 then
      k2_abajo, k2_combo = true, false
    else
      k2_abajo = false
      if not k2_combo then
        if pestana == 1 then decir() else elegir_archivo() end
      end
    end
  elseif n == 3 and z == 1 then
    if k2_abajo then
      k2_combo = true
      cambiar_pestana()
    elseif pestana == 1 then
      auto = not auto
      estado = auto and "automático" or "K2: frase nueva"
    else
      escuchar()
    end
  end
  redraw()
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

-- "etiqueta valor" de un parámetro, para la parte de abajo
local function texto_param(id)
  local etiqueta = ETIQUETAS[id]
  local valor = params:string(id)
  return etiqueta == "" and valor or (etiqueta .. " " .. valor)
end

-- en medio, en la pestaña SÍNTESIS: la frase, hasta tres líneas
local function dibujar_frase()
  screen.level(10)
  for i, linea in ipairs(partir(frase, 124)) do
    if i > 3 then break end
    screen.move(2, 18 + (i - 1) * 9)
    screen.text(linea)
  end

  -- la frase como una línea: la cabeza y los granos que van saliendo
  screen.level(1)
  screen.move(0, 44.5)
  screen.line(128, 44.5)
  screen.stroke()
  if params:get("granos") > 0 and dur_frase > 0 then
    for _, m in ipairs(marcas) do
      if m.vida > 0 then
        screen.level(math.max(1, math.floor(m.vida * 12)))
        screen.rect(math.floor(m.x * 126), 43, 2, 3)
        screen.fill()
      end
    end
    screen.level(15)
    screen.rect(math.floor(cabeza / dur_frase * 127), 40, 1, 9)
    screen.fill()
  end
end

-- en medio, en la pestaña SAMPLES: la forma del sample, sus sílabas,
-- la cabeza y los granos que van saliendo
local function dibujar_sample()
  local n = sample_actual()
  if not n then
    screen.level(10)
    screen.move(64, 26)
    screen.text_center("sin samples")
    screen.level(4)
    screen.move(64, 36)
    screen.text_center(cargando and "cargando..." or "K2: cargar uno")
    return
  end
  local s = samples[n]

  screen.level(10)
  screen.move(0, 16)
  screen.text(s.nombre)
  screen.level(3)
  screen.move(128, 16)
  screen.text_right(string.format("%.1fs %dsíl", s.dur, #s.silabas))

  -- la forma de onda, simétrica alrededor de y = 32
  screen.level(3)
  for x = 1, 128 do
    local alto = math.floor(s.forma[x] * 11 + 0.5)
    if alto > 0 then
      screen.move(x - 0.5, 32 - alto)
      screen.line(x - 0.5, 32 + alto)
      screen.stroke()
    end
  end
  -- las sílabas: rayitas arriba
  screen.level(7)
  for _, t in ipairs(s.silabas) do
    screen.rect(math.floor(t / s.dur * 127), 19, 1, 2)
    screen.fill()
  end
  -- los granos de este sample
  for _, m in ipairs(marcas_s) do
    if m.sample == n and m.vida > 0 then
      screen.level(math.max(1, math.floor(m.vida * 15)))
      screen.rect(math.floor(m.x * 126), 30, 2, 4)
      screen.fill()
    end
  end
  screen.level(15)
  screen.rect(math.floor(cabeza_s % s.dur / s.dur * 127), 21, 1, 23)
  screen.fill()
end

function redraw()
  screen.clear()
  screen.font_face(1)
  screen.font_size(8)

  -- arriba: la página (contada dentro de su pestaña) y el tema o el sample
  local pg = PAGINAS[pagina]
  local en_pestana, total = 0, 0
  for i, otra in ipairs(PAGINAS) do
    if otra.pestana == pg.pestana then
      total = total + 1
      if i <= pagina then en_pestana = total end
    end
  end
  screen.level(15)
  screen.move(0, 7)
  screen.text(pg.nombre)
  screen.level(3)
  screen.text(" " .. en_pestana .. "/" .. total)
  screen.move(128, 7)
  if pg.pestana == 2 then
    screen.text_right(PESTANAS[2] .. " " .. #samples)
  else
    screen.text_right(params:get("mezclar") == 2 and "mezcla"
      or params:string("tema"))
  end

  if pg.pestana == 2 then
    dibujar_sample()
  else
    dibujar_frase()
  end

  -- abajo: lo que mueven E2 y E3 en esta página
  screen.level(15)
  screen.move(0, 55)
  screen.text(texto_param(id_param(pg.e2)))
  screen.move(128, 55)
  screen.text_right(texto_param(id_param(pg.e3)))

  -- y el estado
  screen.level(4)
  screen.move(0, 63)
  screen.text(pg.pestana == 2 and estado_s or estado)
  screen.move(128, 63)
  screen.level(auto and 15 or 3)
  screen.text_right(auto and "auto" or "manual")

  screen.update()
end

function cleanup()
  for _, v in ipairs(VOCES_SC) do softcut.play(v, 0) end
end
