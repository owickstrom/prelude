;; Auto load paredit in LISP buffers
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'rainbow-delimiters-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'geiser-repl-mode-hook      #'enable-paredit-mode)

;; Clojure stuff
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'subword-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-mode-hook #'eldoc-mode)
;; (setq nrepl-log-messages t)

(defun cider-user-reset ()
  (interactive)
  (cider-interactive-eval "(user/reset)"))

(defun add-user-reset-to-cider ()
  (define-key cider-mode-map (kbd "C-c u r") 'cider-user-reset))

(add-hook 'cider-mode-hook 'add-user-reset-to-cider)
