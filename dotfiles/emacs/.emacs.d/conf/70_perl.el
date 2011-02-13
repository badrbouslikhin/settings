(my-require-and-when 'cperl-mode
  (defalias 'perl-mode 'cperl-mode))

;;;; association setting
(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\|al\\)\\'" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))


;;;; perl-completion
;;;(install-elisp "http://svn.coderepos.org/share/lang/elisp/perl-completion/trunk/perl-completion.el")
(add-hook 'cperl-mode-hook
           (lambda ()
             (my-require-and-when 'perl-completion)
             (add-to-list 'ac-sources 'ac-source-perl-completion t)))


;;;; eldoc
(defun my-cperl-eldoc-documentation-function ()
  "Return meaningful doc string for `eldoc-mode'."
  (car
   (let ((cperl-message-on-help-error nil))
     (cperl-get-help))))

(add-hook 'cperl-mode-hook
          (lambda ()
            (set (make-local-variable 'eldoc-documentation-function)
                 'my-cperl-eldoc-documentation-function)))


;;;; brackets
(add-hook 'cperl-mode-hook
          (lambda()
            (progn
              (define-key cperl-mode-map "{" 'insert-braces)
              (define-key cperl-mode-map "(" 'insert-parens)
              (define-key cperl-mode-map "\"" 'insert-double-quotation)
              (define-key cperl-mode-map "[" 'insert-brackets)
              (define-key cperl-mode-map "\C-c}" 'insert-braces-region)
              (define-key cperl-mode-map "\C-c)" 'insert-parens-region)
              (define-key cperl-mode-map "\C-c]" 'insert-brackets-region)
              (define-key cperl-mode-map "\C-c\"" 'insert-double-quotation-region)
              )))


;;;; macros
(add-hook 'cperl-mode-hook
          (lambda ()
            (my-load-and-when "_perl-insert-use-statement")
            (local-set-key (kbd "\C-c \C-m") 'perl-insert-use-statement)
            (my-load-and-when "_perltidy")))


;; -*-no-byte-compile: t; -*-
