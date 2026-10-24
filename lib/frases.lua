-- frases.lua
--
-- arma una frase al azar a partir de una plantilla y un tema.
-- no toca sonido ni pantalla: solo texto, así que es fácil
-- de entender y de modificar.

local frases = {}

local function elegir(lista)
  return lista[math.random(#lista)]
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
      return genero == "f" and a[2] or a[1]
    end,
    verbo = function()
      return elegir(tema_para(temas, n_tema, mezclar).verbos)
    end,
    lugar = function()
      return elegir(tema_para(temas, n_tema, mezclar).lugares)
    end,
  }

  -- gsub recorre la plantilla de izquierda a derecha, así que cada
  -- {adj} ve el género del sustantivo que vino justo antes
  local frase = plantilla:gsub("{(%a+)}", function(marca)
    local f = reemplazos[marca]
    return f and f() or marca
  end)

  -- mayúscula en la primera letra (saltando el "¿" si lo hay)
  frase = frase:gsub("^([^%a]*)(%a)", function(antes, letra)
    return antes .. letra:upper()
  end)
  return frase
end

return frases
