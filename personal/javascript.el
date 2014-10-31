
;; Buffer based auto-complete for certain languages.
(add-hook 'javascript-mode (lambda () (auto-complete-mode 1)))

;; JSX
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))
(autoload 'jsx-mode "jsx-mode" "JSX mode" t)
