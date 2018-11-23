(prelude-require-packages '(flycheck
                            rust-mode
                            flycheck-rust
                            cargo))

(add-hook 'rust-mode-hook 'cargo-minor-mode)

(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
