-- temas.lua
--
-- las palabras con las que conceptos arma sus frases.
-- edita este archivo en maiden para crear tus propios temas:
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
