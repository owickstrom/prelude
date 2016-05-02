;; Fix "Pinging *.id (Indonesia) problem.
;; https://github.com/technomancy/emacs-starter-kit/issues/39
(setq ido-use-filename-at-point nil)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
