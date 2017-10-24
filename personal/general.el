(prelude-require-packages '(undo-tree
                            markdown-mode+
                            rainbow-delimiters
                            git-gutter
                            less-css-mode
                            company
                            flycheck
                            gruvbox-theme
                            emmet-mode
                            editorconfig
                            langtool
                            rust-mode
                            flycheck-rust
                            racer
                            evil-magit
                            idris-mode))

(setenv "PATH" (concat (getenv "PATH") ":~/.local/bin"))
(setq exec-path (append exec-path '("~/.local/bin")))

;; Replace emacs undo system with undo-tree
(global-undo-tree-mode)

;; Disable prelude's diff-hl-mode.
(global-diff-hl-mode -1)

;; Don't show weird fringe characters for empty lines.
(setq-default indicate-empty-lines nil)

;; Rainbow Delimiters in Lisp
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)

;; No auto fill.
(turn-off-auto-fill)
(remove-hook 'text-mode-hook 'turn-on-auto-fill)

;; Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

(setq inhibit-startup-message t)

;; Remove big white square in Aquamacs
(setq visible-bell nil)
(setq ring-bell-function (lambda nil (message "")))

(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)

(evil-set-initial-state
 'term-mode 'emacs)

(require 'lockstep)
