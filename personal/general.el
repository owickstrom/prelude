(prelude-require-packages '(undo-tree
                            markdown-mode+
                            rainbow-delimiters
                            git-gutter
                            less-css-mode
                            auto-complete
                            flycheck
                            emmet-mode
                            editorconfig
			    color-theme-sanityinc-tomorrow))

;; Replace emacs undo system with undo-tree
(global-undo-tree-mode)

;; Don't show weird fringe characters for empty lines.
(setq-default indicate-empty-lines nil)

;; Rainbow Delimiters everywhere!
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; No auto fill.
(turn-off-auto-fill)
(remove-hook 'text-mode-hook 'turn-on-auto-fill)

(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(require 'auto-complete-config)
(ac-config-default)

;; Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

(setq inhibit-startup-message t)

;; Remove big white square in Aquamacs
(setq visible-bell nil)
(setq ring-bell-function (lambda nil (message "")))
