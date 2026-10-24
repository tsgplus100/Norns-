-- themes_en.lua
--
-- los mismos cinco temas que temas.lua, escritos en inglés.
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
