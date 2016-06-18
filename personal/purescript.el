;; specify path to the 'psc-ide' executable
(require 'psc-ide)

(add-hook 'purescript-mode-hook
          (lambda ()
            (psc-ide-mode)
            (company-mode)))

(add-hook 'purescript-mode-hook 'turn-on-purescript-indentation)
