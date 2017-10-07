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
                            minimal-theme
                            flycheck-color-mode-line
                            langtool
                            rust-mode
                            flycheck-rust
                            racer
                            evil-magit))

(setenv "PATH" (concat (getenv "PATH") ":~/.local/bin"))
(setq exec-path (append exec-path '("~/.local/bin")))

(load-theme 'minimal)
(set-face-italic 'font-lock-comment-face t)
(set-face-italic 'font-lock-doc-face t)
(set-face-attribute 'region nil :background "#468")
(set-face-attribute 'whitespace-line nil
                    :foreground "yellow"
                    :background nil)

;; Idris Color Overrides
(custom-set-faces
 '(idris-semantic-function-face ((t (:foreground "#8a9"))))
 '(idris-semantic-bound-face ((t (:foreground "gray80" :italic t))))
 '(idris-semantic-data-face ((t (:foreground "#a98"))))
 '(idris-semantic-type-face ((t (:foreground "#89a"))))
 '(idris-semantic-implicit-face ((t (:foreground "gray70")))))


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
