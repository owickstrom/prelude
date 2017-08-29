(prelude-require-packages '(purescript-mode
                            psc-ide
                            psci
                            flycheck))

(add-hook 'purescript-mode-hook
          (lambda ()
            (psc-ide-mode)
            (company-mode)
            (flycheck-mode)
            (turn-on-purescript-indentation)
            ;;(turn-on-purescript-unicode-input-method)
            ))
