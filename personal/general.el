(prelude-require-packages '(starter-kit-lisp
                            clojure-mode
                            cider
                            undo-tree
                            markdown-mode+
                            gruvbox-theme
                            elixir-mode
                            rainbow-delimiters
                            git-gutter
                            less-css-mode
                            auto-complete
                            flycheck
                            emmet-mode
                            jsx-mode
                            editorconfig))

;; Color Themes
(load-theme 'gruvbox t)

;; Replace emacs undo system with undo-tree
(global-undo-tree-mode)

;; Don't show weird fringe characters for empty lines.
(setq-default indicate-empty-lines nil)

;; Rainbow Delimiters everywhere!
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Auto load paredit in LISP buffers
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'rainbow-delimiters-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(require 'auto-complete-config)
(ac-config-default)

;; Buffer based auto-complete for certain languages.
(add-hook 'javascript-mode (lambda () (auto-complete-mode 1)))

(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

;; Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; JSX
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))
(autoload 'jsx-mode "jsx-mode" "JSX mode" t)

(setq inhibit-startup-message t)

(menu-bar-mode -1)

(when window-system
  ;; GUI Customizations
  (set-face-attribute 'default nil :font "Monaco-16")
  (tool-bar-mode -1))

;; Clojure stuff
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'subword-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)

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
