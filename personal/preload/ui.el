(setq prelude-guru nil)
(setq prelude-theme nil)

(when window-system
  (setq-default line-spacing 0)
  (set-default-font "Iosevka Term 10")
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))
