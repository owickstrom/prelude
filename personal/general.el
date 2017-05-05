(prelude-require-packages '(undo-tree
                            markdown-mode+
                            rainbow-delimiters
                            git-gutter
                            less-css-mode
                            company
                            flycheck
                            emmet-mode
                            editorconfig
			    color-theme-sanityinc-tomorrow
                            gruvbox-theme)
                          )

(load-theme 'sanityinc-tomorrow-night)

;; Replace emacs undo system with undo-tree
(global-undo-tree-mode)

;; Don't show weird fringe characters for empty lines.
(setq-default indicate-empty-lines nil)

;; Rainbow Delimiters everywhere!
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; No auto fill.
(turn-off-auto-fill)
(remove-hook 'text-mode-hook 'turn-on-auto-fill)

;; Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'after-init-hook #'flycheck-color-mode-line-mode)

(setq inhibit-startup-message t)

;; Remove big white square in Aquamacs
(setq visible-bell nil)
(setq ring-bell-function (lambda nil (message "")))

(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
