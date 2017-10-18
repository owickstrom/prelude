(prelude-require-packages '(circe))

(setq auth-sources '("~/.authinfo.gpg"))

(defun my-fetch-password (&rest params)
  (require 'auth-source)
  (let ((match (car (apply 'auth-source-search params))))
    (if match
        (let ((secret (plist-get match :secret)))
          (if (functionp secret)
              (funcall secret)
            secret))
      (error "Password not found for %S" params))))

(defun my-nickserv-password (server)
  (my-fetch-password :user "owickstrom" :host "irc.wickstrom.tech"))

(setq circe-network-options
      '(("wickstrom.tech"
         :host "irc.wickstrom.tech"
         :port 6668
         :nick "owickstrom"
         :channels ()
         :tls t
         :user "owickstrom"
         :pass my-nickserv-password
         )))
