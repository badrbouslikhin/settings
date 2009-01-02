(autoload 'ansi-color-for-comint-mode-on "ansi-color"
  "Set `ansi-color-for-comint-mode' to t." t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(add-hook 'comint-output-filter-functions
          'comint-watch-for-password-prompt)


;; pcomplete
;(add-hook 'shell-mode-hook 'pcomplete-shell-setup)


;; shell-toggle (switch shell buffer easily)
;(install-elisp "http://user.it.uu.se/~mic/shell-toggle.el")
(autoload 'shell-toggle "shell-toggle"
  "Toggles between the *shell* buffer and whatever buffer you are editing."
  t)
(autoload 'shell-toggle-cd "shell-toggle"
  "Pops up a shell-buffer and insert a \"cd \" command." t)


;; eshell
(custom-set-variables
 '(eshell-ask-to-save-history (quote always))
 '(eshell-history-size 1000)
 '(eshell-ls-dired-initial-args (quote ("-h")))
 '(eshell-ls-exclude-regexp "~\\'")
 '(eshell-ls-initial-args "-h")
 '(eshell-ls-use-in-dired t nil (em-ls))
 '(eshell-modules-list (quote (eshell-alias eshell-basic
                                            eshell-cmpl eshell-dirs eshell-glob
                                            eshell-hist eshell-ls eshell-pred
                                            eshell-prompt eshell-rebind
                                            eshell-script eshell-smart
                                            eshell-term eshell-unix eshell-xtra)))
 '(eshell-prefer-to-shell t nil (eshell))
 '(eshell-stringify-t nil)
 '(eshell-term-name "ansi")
 '(eshell-visual-commands (quote ("vi" "top" "screen" "less" "lynx"
                                  "ssh" "rlogin" "telnet"))))
