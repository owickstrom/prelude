(setq prelude-theme 'sanityinc-tomorrow-night)

(menu-bar-mode -1)

(when window-system
  ;; GUI Customizations
  (set-face-attribute 'default nil :font "Source Code Pro-13")
  (tool-bar-mode -1))
