;; Use regular-style option and super keys
(when (boundp 'mac-option-modifier)
  (setq mac-option-modifier 'meta))
(when (boundp 'mac-option-modifier)
  (setq mac-command-modifier 'super))

;; Enable ligatures
(when (fboundp mac-auto-operator-composition-mode)
  (mac-auto-operator-composition-mode))
