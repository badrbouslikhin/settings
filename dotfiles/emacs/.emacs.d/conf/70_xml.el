;;;; http://www.thaiopensource.com/nxml-mode/
(my-load-and-when "rng-auto.el"
  )                                     ; autoload


;;;; association setting
(add-to-list 'auto-mode-alist '("\\.\\(xml\\|xsl\\|rng\\|xhtml\\)\\'" . nxml-mode))


;;;; xpath
;;;(install-elisp-from-emacswiki "xpath.el")
;;;(install-elisp-from-emacswiki "xpath-parser.el")
'(my-require-and-when 'xpath)


;;;; mode hook
(defun my-nxml-mode-hook ()
  ;; common setting
  (setq nxml-slash-auto-complete-flag t)
  (setq nxml-child-indent 2)
  (setq auto-fill-mode -1)
  )
(add-hook 'nxml-mode-hook 'my-nxml-mode-hook)


;; -*-no-byte-compile: t; -*-
