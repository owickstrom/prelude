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

(load-theme 'gruvbox-light-medium)

(defconst gruvbox-dark1 "#3c3836")
(defconst gruvbox-neutral_red     "#fb4934")
(defconst gruvbox-neutral_green   "#b8bb26")
(defconst gruvbox-neutral_yellow  "#fabd2f")
(defconst gruvbox-neutral_blue    "#83a598")
(defconst gruvbox-neutral_purple  "#d3869b")
(defconst gruvbox-neutral_aqua    "#8ec07c")
(defconst gruvbox-neutral_orange  "#fe8019")

(custom-theme-set-faces
 'gruvbox-light-medium

 '(markdown-pre-face ((t (:family "Latin Modern Mono"))))
 '(markdown-code-face ((t (:family "Latin Modern Mono"))))

 `(sml/col-number ((t (:foreground ,gruvbox-dark1))))
 `(sml/folder ((t (:foreground ,gruvbox-dark1))))
 `(sml/global ((t (:foreground ,gruvbox-dark1))))
 `(sml/minor-modes ((t (:foreground ,gruvbox-dark1))))

 `(idris-semantic-function-face ((t (:foreground ,gruvbox-neutral_blue))))
 `(idris-semantic-bound-face ((t (:foreground ,gruvbox-neutral_purple :italic t))))
 `(idris-semantic-data-face ((t (:foreground ,gruvbox-neutral_red))))
 `(idris-semantic-type-face ((t (:foreground ,gruvbox-neutral_orange))))
 `(idris-semantic-implicit-face ((t (:foreground ,gruvbox-neutral_aqua))))
 )

(set-face-italic 'font-lock-comment-face t)
(set-face-italic 'font-lock-doc-face t)
; (set-face-attribute 'region nil :background "#468")
; (set-face-attribute 'whitespace-empty nil :background nil)

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

(setq inhibit-startup-message t)

;; Remove big white square in Aquamacs
(setq visible-bell nil)
(setq ring-bell-function (lambda nil (message "")))

(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)

(evil-set-initial-state
 'term-mode 'emacs)

(require 'lockstep)
