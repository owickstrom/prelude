(prelude-require-packages '(minimal-theme
                            atom-dark-theme
                            ))

(load-theme 'atom-one-dark)

(when nil
  (load-theme 'minimal-light)

  (custom-theme-set-faces
   'minimal-light
   '(region ((t (:background "#ccddff")))))

  (load-theme 'minimal)

  (custom-theme-set-faces
   'minimal
   '(font-lock-comment-face ((t (:foreground "#777777"))))
   '(region ((t (:background "#555555"))))))
