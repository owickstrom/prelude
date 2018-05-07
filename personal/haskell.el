(prelude-require-packages '(haskell-mode
                            hindent
                            flycheck
                            flycheck-haskell))


(add-to-list 'flycheck-disabled-checkers 'haskell-ghc)
(add-to-list 'flycheck-disabled-checkers 'haskell-stack-ghc)

;; (add-hook 'haskell-mode-hook 'haskell-doc-mode)
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
 '(haskell-tags-on-save nil)
 )

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

;; Use Nix binaries.

;; (setq haskell-process-wrapper-function
      ;; (lambda (args) (apply 'nix-shell-command (nix-current-sandbox) args)))

;; Work around for GHC 8.2.x incompatible error parsing in
;; haskell-mode.

(setq haskell-process-args-ghci
      '("-ferror-spans" "-fshow-loaded-modules"))

(setq haskell-process-args-cabal-repl
      '("--ghc-options='-ferror-spans -fshow-loaded-modules'"))

(setq haskell-process-args-stack-ghci
      '("--ghci-options=-ferror-spans -fshow-loaded-modules"
        "--no-build"
        "--no-load"))

;; (setq haskell-process-args-cabal-new-repl
;;       '("--ghc-options=-ferror-spans"
;;         "--ghc-options=-fshow-loaded-modules"))

;; Squiggly lines for errors.

(set-face-attribute 'haskell-error-face nil
                    :foreground nil
                    :background nil
                    :underline '(:color "red" :style wave))
