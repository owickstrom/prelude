;; Color Themes
(disable-theme 'zenburn)

(menu-bar-mode -1)

(when window-system
  ;; GUI Customizations
  (set-face-attribute 'default nil :font "Monaco-16")
  (tool-bar-mode -1))
