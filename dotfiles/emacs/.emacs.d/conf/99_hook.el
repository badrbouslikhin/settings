;;;; diminish
;;;(install-elisp "http://www.eskimo.com/~seldon/diminish.el")
(my-require-and-when 'diminish
  (diminish 'widen-window-mode " WW")
  (diminish 'auto-complete-mode)
  (diminish 'doxymacs-mode)
;;;  (diminish 'egg-minor-mode)
  (diminish 'eldoc-mode)
  (diminish 'font-lock-mode)
  (diminish 'hs-minor-mode)
  (diminish 'my-keyjack-mode)
;;;  (diminish 'typing-outputz-mode)
  (diminish 'yas/minor-mode)
;;;  (diminish 'emacs-lisp-mode "Elisp")
;;;  (my-eval-after-load "cwarn" '(diminish 'cwarn-mode))
;;;  (my-eval-after-load "flymake" '(diminish 'flymake-mode))
;;;  (my-eval-after-load "gtags" '(diminish 'gtags-mode))
  )


;; -*-no-byte-compile: t; -*-
