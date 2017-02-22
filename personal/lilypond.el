(setenv "PATH" (concat (getenv "PATH")
                       ":/Applications/LilyPond.app/Contents/Resources/bin"))

(setq exec-path (append exec-path
                        '("/Applications/LilyPond.app/Contents/Resources/bin")))
