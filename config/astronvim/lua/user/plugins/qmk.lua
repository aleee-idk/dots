return {
  "codethread/qmk.nvim",
  ft = "c",
  config = {
    name = "LAYOUT",
    layout = {
      "_ x x x x x x _ _ _ x x x x x x",
      "_ x x x x x x _ _ _ x x x x x x",
      "_ x x x x x x _ _ _ x x x x x x",
      "_ x x x x x x x _ x x x x x x x",
      "_ _ _ x x x x x _ x x x x x _ _",
    },
    comment_preview = {
      -- mostly overrides for Spanish Latin American
      keymap_overrides = {
        KC_SYMBOLS = "Symbols",
        KC_SYSTEM = "System",
        KC_NUMPAD = "Numpad",
        KC_GAME = "Game",
        KC_COLEMAK = "Colemak",
        KC_QWERTY = "Qwerty",
        KC_GRV = "|",
        KC_GRAVE = "|",
        KC_SCLN = "ñ",
        ES_COMM = ",",
        ES_DOT = ".",
        ES_MINS = "-",
        ES_QUOT = "'",
        ES_GRV = "´",
        ES_IEXL = "?",
        ES_LABK = ">",
        ES_PLUS = "+",
        KC_ALGR = "algr",
      },
    },
  },
}
