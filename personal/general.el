(prelude-require-packages '(clojure-mode
                            cider
                            undo-tree
                            markdown-mode+
                            rainbow-delimiters
                            git-gutter
                            less-css-mode
                            auto-complete
                            flycheck
                            emmet-mode
                            editorconfig))

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

;; Buffer based auto-complete for certain languages.
(add-hook 'javascript-mode (lambda () (auto-complete-mode 1)))

;; Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

(setq inhibit-startup-message t)

(menu-bar-mode -1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("454dc6f3a1e9e062f34c0f988bcef5d898146edc5df4aa666bf5c30bed2ada2e" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Remove big white square in Aquamacs
(setq visible-bell nil)
(setq ring-bell-function (lambda nil (message "")))
