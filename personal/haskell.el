(prelude-require-packages '(haskell-mode
                            hindent
                            flycheck
                            flycheck-haskell))


(setq-default flycheck-disabled-checkers
              '('haskell-ghc
                'haskell-stack-ghc))

(add-hook 'haskell-mode-hook 'haskell-doc-mode)
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)
(add-hook 'haskell-mode-hook #'hindent-mode)
(add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)

(custom-set-variables
 '(haskell-process-type 'auto)
 '(haskell-process-suggest-remove-import-lines nil)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-font-lock-symbols t)
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save t))

(eval-after-load 'interactive-haskell-mode
  '(progn
     (define-key interactive-haskell-mode-map (kbd "M-.") 'haskell-mode-goto-loc)
     (define-key interactive-haskell-mode-map (kbd "C-c C-t") 'haskell-mode-show-type-at)))

(eval-after-load 'haskell-mode
  '(progn
     (define-key haskell-mode-map (kbd "C-c C-l")
       'haskell-process-load-or-reload)
     (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
     (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-mode-show-type-at)
     (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
     (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
     (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)
     (define-key haskell-mode-map (kbd "M-p") 'haskell-goto-prev-error)
     (define-key haskell-mode-map (kbd "M-n") 'haskell-goto-next-error)
     ))

(eval-after-load 'haskell-cabal
  '(progn
     (define-key haskell-cabal-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
     (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
     (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
     (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))

(global-set-key (kbd "C-<f6>") 'haskell-process-reload-devel-main)

(set-face-attribute 'haskell-error-face nil
                    :foreground nil
                    :background nil
                    :underline '(:color "red" :style wave))
