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
(add-hook 'haskell-mode-hook 'intero-mode)

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
