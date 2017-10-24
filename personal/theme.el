(prelude-require-packages '(gruvbox-theme
                            idris-mode))

(defconst gruvbox-dark1 "#3c3836")
(defconst gruvbox-light1 "#ebdbb2")

(defconst gruvbox-neutral_red     "#fb4934")
(defconst gruvbox-neutral_green   "#b8bb26")
(defconst gruvbox-neutral_yellow  "#fabd2f")
(defconst gruvbox-neutral_blue    "#83a598")
(defconst gruvbox-neutral_purple  "#d3869b")
(defconst gruvbox-neutral_aqua    "#8ec07c")
(defconst gruvbox-neutral_orange  "#fe8019")

(defconst gruvbox-faded_red       "#9d0006")
(defconst gruvbox-faded_green     "#79740e")
(defconst gruvbox-faded_yellow    "#b57614")
(defconst gruvbox-faded_blue      "#076678")
(defconst gruvbox-faded_purple    "#8f3f71")
(defconst gruvbox-faded_aqua      "#427b58")
(defconst gruvbox-faded_orange    "#af3a03")

(defconst dark-or-light 'dark)

(pcase dark-or-light
  (`dark
   (load-theme 'gruvbox-dark-medium)
   (custom-theme-set-faces
    'gruvbox-dark-medium

    `(sml/col-number ((t (:foreground ,gruvbox-light1))))
    `(sml/folder ((t (:foreground ,gruvbox-light1))))
    `(sml/global ((t (:foreground ,gruvbox-light1))))
    `(sml/minor-modes ((t (:foreground ,gruvbox-light1))))

    `(idris-semantic-function-face ((t (:foreground ,gruvbox-neutral_green))))
    `(idris-semantic-bound-face ((t (:foreground ,gruvbox-neutral_aqua :italic t))))
    `(idris-semantic-data-face ((t (:foreground ,gruvbox-neutral_orange))))
    `(idris-semantic-type-face ((t (:foreground ,gruvbox-neutral_blue))))
    `(idris-semantic-implicit-face ((t (:foreground ,gruvbox-neutral_purple))))
    ))
  (`light
   (custom-theme-set-faces
    'gruvbox-light-medium

    '(markdown-pre-face ((t (:family "Latin Modern Mono"))))
    '(markdown-code-face ((t (:family "Latin Modern Mono"))))

    `(sml/col-number ((t (:foreground ,gruvbox-dark1))))
    `(sml/folder ((t (:foreground ,gruvbox-dark1))))
    `(sml/global ((t (:foreground ,gruvbox-dark1))))
    `(sml/minor-modes ((t (:foreground ,gruvbox-dark1))))

    `(idris-semantic-function-face ((t (:foreground ,gruvbox-faded_green))))
    `(idris-semantic-bound-face ((t (:foreground ,gruvbox-faded_aqua :italic t))))
    `(idris-semantic-data-face ((t (:foreground ,gruvbox-faded_orange))))
    `(idris-semantic-type-face ((t (:foreground ,gruvbox-faded_blue))))
    `(idris-semantic-implicit-face ((t (:foreground ,gruvbox-faded_purple))))
    )))

(set-face-italic 'font-lock-comment-face t)
(set-face-italic 'font-lock-doc-face t)
