(setq prelude-theme nil)

(menu-bar-mode 1)

;; GUI Customizations
(pcase window-system
  ((guard (not 'window-system))
   (message "No window system, skipping GUI customization."))
  (w32
   (setq-default line-spacing 0)
   (set-frame-font "Consolas 12")
   (tool-bar-mode -1)
   (scroll-bar-mode -1))
  ('other
   (setq-default line-spacing 0)
   (set-frame-font "Fira Code 13")
   (tool-bar-mode -1)
   (scroll-bar-mode -1))
  )
