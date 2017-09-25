(prelude-require-packages '(haskell-mode
                            hindent
                            intero
                            flycheck))

(setenv "PATH" (concat (getenv "PATH") ":~/.local/bin"))
(setq exec-path (append exec-path '("~/.local/bin")))

(setq haskell-font-lock-symbols t)
(setq haskell-stylish-on-save t)

(add-hook 'haskell-mode-hook 'haskell-doc-mode)
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)
(add-hook 'haskell-mode-hook #'hindent-mode)
;; (add-hook 'haskell-mode-hook 'intero-mode)

(custom-set-variables
 '(haskell-process-type 'auto)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t))

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
     (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)))

(eval-after-load 'haskell-cabal
  '(progn
     (define-key haskell-cabal-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
     (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
     (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
     (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))

(with-eval-after-load 'intero
  (flycheck-add-next-checker 'intero '(warning . haskell-hlint)))

(defun intero-change-directory ()
  (interactive)
  (intero-with-repl-buffer nil
    (comint-simple-send
     (get-buffer-process (current-buffer))
     (concat ":cd " (read-directory-name "Directory to use in Intero REPL:")))))

(defun intero-reload-and-run-main (&rest args)
  (interactive)
  (intero-with-repl-buffer nil
    (comint-simple-send
     (get-buffer-process (current-buffer))
     (concat ":reload Main\n:main " (string-join args " ")))))

(global-set-key (kbd "C-<f5>") 'intero-reload-and-run-main)
(global-set-key (kbd "C-<f6>") 'intero-devel-reload)
