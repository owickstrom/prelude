(setq prelude-theme nil)

(menu-bar-mode -1)

(when window-system
  ;; GUI Customizations
  (setq-default line-spacing 0)
  (set-frame-font "Fira Code 13")
  (tool-bar-mode -1)
  (scroll-bar-mode -1))
