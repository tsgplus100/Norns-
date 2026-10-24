-- temas.lua
--
-- las palabras con las que conceptos arma sus frases.
-- edita este archivo en maiden para crear tus propios temas:
-- copia un tema completo, cámbiale el nombre y las palabras.
--
-- reglas para que las frases suenen bien:
--
--   sustantivos  van con su género: { "río", "m" } o { "luna", "f" }.
--                evita los femeninos que empiezan con "a" tónica
--                (agua, alma, águila): llevan "el" y el script
--                les pondría "la".
--   adjetivos    van en masculino y femenino: { "oscuro", "oscura" }.
--                si es igual en los dos, repítelo: { "verde", "verde" }.
--   verbos       en tercera persona del singular: "canta", "duerme".
--   lugares      frases completas que dicen dónde: "bajo la lluvia".

local temas = {

  {
    nombre = "naturaleza",
    sustantivos = {
      { "río", "m" }, { "bosque", "m" }, { "viento", "m" }, { "musgo", "m" },
      { "pájaro", "m" }, { "árbol", "m" }, { "relámpago", "m" },
      { "montaña", "f" }, { "lluvia", "f" }, { "semilla", "f" },
      { "raíz", "f" }, { "niebla", "f" }, { "piedra", "f" }, { "hoja", "f" },
    },
    adjetivos = {
      { "verde", "verde" }, { "húmedo", "húmeda" }, { "salvaje", "salvaje" },
      { "antiguo", "antigua" }, { "quieto", "quieta" }, { "dorado", "dorada" },
      { "profundo", "profunda" }, { "frágil", "frágil" },
    },
    verbos = {
      "crece", "respira", "canta", "espera", "florece", "se pudre",
      "escucha", "se mueve", "duerme", "germina",
    },
    lugares = {
      "bajo la lluvia", "entre las piedras", "al amanecer",
      "en el fondo del lago", "sobre el musgo", "dentro de la tierra",
      "a la orilla del río",
    },
  },

  {
    nombre = "máquinas",
    sustantivos = {
      { "circuito", "m" }, { "motor", "m" }, { "cable", "m" },
      { "algoritmo", "m" }, { "robot", "m" }, { "engranaje", "m" },
      { "pantalla", "f" }, { "señal", "f" }, { "memoria", "f" },
      { "antena", "f" }, { "válvula", "f" }, { "frecuencia", "f" },
    },
    adjetivos = {
      { "eléctrico", "eléctrica" }, { "binario", "binaria" },
      { "oxidado", "oxidada" }, { "infinito", "infinita" },
      { "automático", "automática" }, { "roto", "rota" },
      { "brillante", "brillante" }, { "digital", "digital" },
    },
    verbos = {
      "calcula", "vibra", "zumba", "se apaga", "procesa", "sueña",
      "repite", "transmite", "olvida", "se reinicia",
    },
    lugares = {
      "en la fábrica vacía", "dentro del código", "a medianoche",
      "entre los cables", "en la red", "detrás de la pantalla",
      "en el último piso",
    },
  },

  {
    nombre = "cosmos",
    sustantivos = {
      { "planeta", "m" }, { "cometa", "m" }, { "sol", "m" },
      { "silencio", "m" }, { "eclipse", "m" }, { "satélite", "m" },
      { "estrella", "f" }, { "luna", "f" }, { "galaxia", "f" },
      { "órbita", "f" }, { "nebulosa", "f" }, { "gravedad", "f" },
    },
    adjetivos = {
      { "lejano", "lejana" }, { "helado", "helada" }, { "eterno", "eterna" },
      { "oscuro", "oscura" }, { "inmenso", "inmensa" },
      { "luminoso", "luminosa" }, { "silencioso", "silenciosa" },
      { "invisible", "invisible" },
    },
    verbos = {
      "gira", "explota", "brilla", "cae", "orbita", "se expande",
      "desaparece", "observa", "flota", "se enfría",
    },
    lugares = {
      "en el vacío", "más allá del horizonte", "entre las estrellas",
      "hace mil años", "al borde del universo", "en la noche",
      "detrás de la luna",
    },
  },

  {
    nombre = "sueños",
    sustantivos = {
      { "recuerdo", "m" }, { "espejo", "m" }, { "laberinto", "m" },
      { "susurro", "m" }, { "reloj", "m" }, { "fantasma", "m" },
      { "puerta", "f" }, { "sombra", "f" }, { "escalera", "f" },
      { "máscara", "f" }, { "voz", "f" }, { "ventana", "f" },
    },
    adjetivos = {
      { "extraño", "extraña" }, { "borroso", "borrosa" },
      { "olvidado", "olvidada" }, { "suave", "suave" },
      { "secreto", "secreta" }, { "lento", "lenta" },
      { "transparente", "transparente" }, { "dormido", "dormida" },
    },
    verbos = {
      "flota", "se derrite", "susurra", "se esconde", "vuelve",
      "se transforma", "llama", "se abre", "recuerda", "se borra",
    },
    lugares = {
      "en la casa de la infancia", "al otro lado del espejo",
      "bajo la cama", "en un pasillo sin fin", "antes de despertar",
      "dentro de otro sueño", "en la habitación azul",
    },
  },

  {
    nombre = "ciudad",
    sustantivos = {
      { "semáforo", "m" }, { "tren", "m" }, { "edificio", "m" },
      { "taxi", "m" }, { "puente", "m" }, { "perro", "m" },
      { "calle", "f" }, { "esquina", "f" }, { "sirena", "f" },
      { "multitud", "f" }, { "azotea", "f" }, { "luz", "f" },
    },
    adjetivos = {
      { "ruidoso", "ruidosa" }, { "gris", "gris" }, { "nocturno", "nocturna" },
      { "cansado", "cansada" }, { "mojado", "mojada" },
      { "abandonado", "abandonada" }, { "rápido", "rápida" },
      { "solitario", "solitaria" },
    },
    verbos = {
      "corre", "espera", "parpadea", "grita", "se detiene", "cruza",
      "vigila", "se pierde", "suena", "llega tarde",
    },
    lugares = {
      "en la avenida", "bajo el puente", "a la hora pico",
      "en el metro", "frente al mercado", "a las tres de la mañana",
      "en la última estación",
    },
  },

}

-- plantillas: las formas que puede tener una frase.
-- cada {marca} se cambia por una palabra del tema:
--
--   {el}     artículo + sustantivo     "el río", "la luna"
--   {un}     artículo + sustantivo     "un río", "una luna"
--   {n}      sustantivo solo           "río"
--   {adj}    adjetivo, concuerda con el último sustantivo
--   {verbo}  un verbo
--   {lugar}  un lugar
--
-- agrega, borra o inventa las tuyas.
temas.plantillas = {
  "{el} {adj} {verbo} {lugar}.",
  "{el} {verbo}, {el} {verbo}.",
  "¿por qué {el} {verbo} {lugar}?",
  "no hay {n} sin {n}.",
  "{el} es {adj}.",
  "{un} {adj}, {lugar}.",
  "{lugar}, {el} {verbo}.",
  "soy {un} {adj}.",
  "{n}. {n}. {n}.",
  "{el} {verbo} y {el} {verbo} {lugar}.",
  "¿dónde está {el} {adj}?",
}

return temas
