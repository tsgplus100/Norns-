-- frases.lua
--
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
