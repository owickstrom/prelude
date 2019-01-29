(prelude-require-packages '(undo-tree
                            markdown-mode+
                            rainbow-delimiters
                            git-gutter
                            less-css-mode
                            helm-git-grep
                            company
                            flycheck
                            emmet-mode
                            editorconfig
                            racer
                            evil-magit
                            idris-mode
                            direnv
                            ))

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

(define-key flycheck-mode-map (kbd "M-p") 'flycheck-previous-error)
(define-key flycheck-mode-map (kbd "M-n") 'flycheck-next-error)

(setq inhibit-startup-message t)

;; Remove big white square in Aquamacs
(setq visible-bell nil)
(setq ring-bell-function (lambda nil (message "")))

(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-normal-state-map (kbd "C-c C-u") 'universal-argument)

(evil-set-initial-state
 'term-mode 'emacs
 'interactive-haskell-mode 'emacs)

(global-set-key (kbd "<f11>") 'prelude-fullscreen)
(global-unset-key (kbd "s-n"))

(define-key prelude-mode-map (kbd "C-c g") 'helm-git-grep)

(direnv-mode)
