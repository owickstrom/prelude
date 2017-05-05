(setq prelude-theme nil)

(menu-bar-mode -1)

(when window-system
  ;; GUI Customizations
  (setq-default line-spacing 2)
  (set-face-attribute 'default nil :font "Fira Code-14")
  (tool-bar-mode -1)
  (scroll-bar-mode -1))
