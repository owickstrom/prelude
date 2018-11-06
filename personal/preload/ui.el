(setq prelude-guru nil)
(setq prelude-theme nil)

(add-to-list 'default-frame-alist '(font . "Iosevka-13"))

(when window-system
  (setq-default line-spacing 0)
  (set-frame-font "Iosevka 13")
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))
