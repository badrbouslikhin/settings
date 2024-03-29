'(install-elisp-from-emacswiki "anything.el")
'(install-elisp-from-emacswiki "anything-config.el")
'(install-elisp-from-emacswiki "anything-startup.el")
'(install-elisp-from-emacswiki "anything-obsolete.el")
'(install-elisp-from-emacswiki "anything-rubikitch.el")
'(install-elisp-from-emacswiki "anything-goodies.el")
'(setq anything-debug t)
(my-require-and-when 'anything-startup)
(my-load-and-when "anything-rubikitch-import")
'(my-load-and-when "anything-rubikitch")


;;;; anything-kyr
;;;(install-elisp-from-emacswiki "anything-kyr.el")
;;;(install-elisp-from-emacswiki "anything-kyr-config.el")
(my-require-and-when 'anything-kyr-config)

(setq anything-kyr-commands-by-major-mode '())


;;;; anything-with-everything
;;;; (install-elisp "https://github.com/yaotti/anything-with-everything.el/raw/master/anything-with-everything.el")
(my-require-and-when 'anything-with-everything
  ;;(defun-anything-function-with-script anything-emacswiki-changes "get-emacswiki-changes.pl")
  )


;;;; anything-match-plugin
;;;(install-elisp-from-emacswiki "anything-match-plugin.el")
(my-require-and-when 'anything-match-plugin
  (setq anything-mp-space-regexp "[\\ ] "))


;;;; anything-show-completion
;;;(install-elisp-from-emacswiki "anything-show-completion.el")
(setq anything-show-completion-activate nil)


;;;; anything-migemo
;;;(install-elisp-from-emacswiki "anything-migemo.el")
(my-require-and-when 'anything-migemo
  (define-key global-map (kbd "C-:") 'anything-migemo))


;;;; anything-extension
;;;(install-elisp-from-emacswiki "anything-extension.el")
'(my-require-and-when 'anything-extension)


;;;; anything-menu
;;;(install-elisp-from-emacswiki "anything-menu.el")
(my-require-and-when 'anything-menu)


;;;; anything-c-source-buffers2
;;;(install-elisp "http://www4.atpages.jp/loveloveelisp/anything-c-source-buffers2.el")
(my-require-and-when 'anything-c-source-buffers2)


;;;; ac-anything
;;;(install-elisp-from-emacswiki "ac-anything.el")
(my-require-and-when 'ac-anything
  (define-key ac-complete-mode-map (kbd "C-'") 'ac-complete-with-anything))


;;;; anything-c-yasnippet
(my-require-and-when 'anything-c-yasnippet
  (setq anything-c-yas-space-match-any-greedy t))


;;;; anything-c-dabbrev
;;;(install-elisp-from-emacswiki "anything-c-dabbrev.el")


;;;; anything-dabbrev-expand
;;;(install-elisp-from-emacswiki "anything-dabbrev-expand.el")
'(my-require-and-when 'anything-dabbrev-expand
  (setq anything-dabbrev-input-idle-delay 0.0)
  (setq anything-dabbrev-idle-delay 1.0)
  (setq anything-dabbrev-expand-candidate-number-limit 20)
  (global-set-key "\M-/" 'anything-dabbrev-expand)
  (define-key anything-dabbrev-map "\M-/" 'anything-dabbrev-find-all-buffers)
  )


;;;; anything-grep
;;;(install-elisp-from-emacswiki "anything-grep.el")
(my-require-and-when 'anything-grep
  (setq anything-grep-goto-hook
        (lambda ()
          (when anything-in-persistent-action
            (anything-persistent-highlight-point (point-at-bol) (point-at-eol)))))
  (setq anything-grep-alist
        ;; 全バッファのファイル名においてegrepをかける。moccurの代わり。
        '(("buffers" ("egrep -Hin %s $buffers" "/"))
          ;; ~/memo 以下から再帰的にegrepをかける。不要なファイルは除かれる。
          ("memo" ("ack-grep -af | xargs egrep -Hin %s" "~/memo"))
          ;; grep current directory (now testing)
          ("current directory" ("ack-grep -af | xargs egrep -Hin %s" "."))
          ;; ~/ruby以下の全Rubyスクリプトと~/bin以下のファイルをまとめて検索する。
          ("~/bin and ~/ruby"
           ("ack-grep -afG 'rb$' | xargs egrep -Hin %s" "~/ruby")
           ("ack-grep -af | xargs egrep -Hin %s" "~/bin"))))
  )


;;;; anything-ack
;;;(install-elisp-from-emacswiki "anything-ack.el")
(my-require-and-when 'anything-ack)


;;;; anything-c-moccur
;;;(install-elisp "http://svn.coderepos.org/share/lang/elisp/anything-c-moccur/trunk/anything-c-moccur.el")
(my-require-and-when 'anything-c-moccur
  (setq anything-c-moccur-anything-idle-delay 0.2)
  (setq anything-c-moccur-enable-initial-pattern t)
  (setq anything-c-moccur-higligt-info-line-flag t)
  (setq anything-c-moccur-enable-auto-look-flag t)
  ;;(defalias 'aoccur 'anything-c-moccur-occur-by-moccur)
  (global-set-key (kbd "M-o") 'anything-c-moccur-occur-by-moccur)
  (global-set-key (kbd "C-M-o") 'anything-c-moccur-dmoccur)
  (global-set-key (kbd "C-M-s") 'anything-c-moccur-isearch-forward)
  (global-set-key (kbd "C-M-r") 'anything-c-moccur-isearch-backward)
  )


;;;; anything-c-source-filelist
(setq anything-c-filelist-file-name "/tmp/all.filelist")
(setq anything-grep-candidates-fast-directory-regexp "^/tmp")


;;;; anything-project
;;;; http://github.com/imakado/anything-project
'(my-require-and-when 'anything-project
  (global-set-key (kbd "C-c C-f") 'anything-project))


;;;; anything-gtags
;;;(install-elisp-from-emacswiki "anything-gtags.el")
(my-require-and-when 'anything-gtags
  (setq anything-gtags-classify t))


;;;; anything-c-imenu
;;;(install-elisp-from-emacswiki "el-expectations.el")
(my-require-and-when 'el-expectations)
;;;(install-elisp "http://www4.atpages.jp/loveloveelisp/anything-c-imenu.el")
(my-require-and-when 'anything-c-imenu)


;;;; anything-c-linkd-tags
;;;(install-elisp-from-emacswiki "linkd.el")
(my-require-and-when 'linkd)
;;;(install-elisp "http://www4.atpages.jp/loveloveelisp/lib/anything-c-linkd-tags.el")
;;;(my-require-and-when 'anything-c-linkd-tags) ; TODO: anything-goodies.el is something wrong


;;;; anything-c-lisp-complete-symbol
;;;(install-elisp "http://svn.coderepos.org/share/lang/elisp/anything-c-lisp-complete-symbol/anything-c-lisp-complete-symbol.el")
(my-require-and-when 'anything-c-lisp-complete-symbol)


;;;; anything-rurima
;;;(install-elisp-from-emacswiki "anything-rurima.el")
'(my-require-and-when 'anything-rurima
  (setq anything-rurima-index-file "~/foo/rurima.e"))


;;;; anything-rcodetools
;;;(install-elisp-from-emacswiki "anything-rcodetools.el")
'(my-require-and-when 'anything-rcodetools
  (setq rct-get-all-methods-command "PAGER=cat fri -l"))


;;;; anything-org-mode
;;; http://d.hatena.ne.jp/r_takaishi/20101218/1292641216
(my-require-and-when 'anything-org-mode)


;;;; anything-ipa
;;;(install-elisp-from-emacswiki "anything-ipa.el")
(my-require-and-when 'anything-ipa)


;;;; anything-delicious
;;;(install-elisp "http://trac.codecheck.in/share/browser/lang/elisp/anything-delicious/trunk/anything-delicious.el?format=txt")
'(my-require-and-when 'anything-delicious)


;;;; anything-emms
;;;(install-elisp-from-emacswiki "anything-emms.el")
'(my-require-and-when 'anything-emms)


;;;; descbinds-anything
;;;(install-elisp-from-emacswiki "descbinds-anything.el")
(my-require-and-when 'descbinds-anything
  (descbinds-anything-install))


;;;; anything-c-key-chord-describe
(my-load-and-when "_anything-c-key-chord-describe")


;;;; anything-auto-install
;;;(install-elisp-from-emacswiki "anything-auto-install.el")
(my-require-and-when 'anything-auto-install)


;;;; basic setting
;;;(anything-iswitchb-setup)
(setq anything-idle-delay 0.3)
(setq anything-input-idle-delay 0.2)
(setq anything-candidate-number-limit 50)
(setq anything-candidate-separator
      "------------------------------------------------------------------------------------")
(setq anything-enable-shortcuts 'alphabet)
(setq anything-persistent-action-use-special-display t)
(add-hook 'anything-after-persistent-action-hook 'which-func-update)
;;;(setq anything-c-locate-db-file "~/home.locatedb")
;;;(setq anything-c-locate-options `("locate" "-d" ,anything-c-locate-db-file "-i" "-r" "--"))


;;;; key setting
;;;(define-key global-map (kbd "M-<SPC>") 'anything)
(define-key global-map (kbd "C-'") 'anything-resume)
(define-key global-map (kbd "C-&") 'anything-call-source)
(define-key anything-map "\C-\M-n" 'anything-next-source)
(define-key anything-map "\C-\M-p" 'anything-previous-source)
(define-key anything-map "\C-r" 'anything-select-source)
(define-key anything-map "\C-a" 'beginning-of-line)
(define-key anything-map "\C-h" 'delete-backward-char)
(define-key anything-map "\C-k" (lambda () (interactive) (delete-minibuffer-contents)))
(define-key anything-map "M" 'anything-toggle-visible-mark) ; for terminal, "C-<SPC>" doesn't work...


;;;; source
(defvar anything-c-source-mode-specific-default
  '(anything-c-source-kyr
    anything-c-source-ffap-guesser
    anything-c-source-buffers
    anything-c-source-bm
    anything-c-source-bookmarks
    ;;anything-c-source-bookmark-files&dirs
    anything-c-source-call-source
    ;;anything-c-source-files-in-current-dir+
    anything-c-source-recentf
    anything-c-source-filelist
    anything-c-source-extended-command-history
    ;;anything-c-source-complex-command-history
    ;;anything-c-source-emacs-commands
    ;;anything-c-source-man-pages
    ;;anything-c-source-info-pages
    ;;anything-c-source-calculation-result
    ))
(defvar anything-mode-specific-alist '())

(defun anything-mode-specific ()
  (interactive)
  (let ((pair (assoc major-mode anything-mode-specific-alist)))
    (anything-at-point (if pair
                           (append anything-c-source-mode-specific-default (cdr pair))
                         anything-c-source-mode-specific-default))))
(define-key global-map (kbd "M-<SPC>") 'anything-mode-specific)

;;;(defun my-anything-null-function (candidate))
;;;(setcdr (assoc 'persistent-action anything-c-source-find-files) 'my-anything-null-function)
;;;(nconc (cdr (assoc 'action anything-c-source-find-files)) '(("Copy file name" . kill-new)))


;;;; advice
(defadvice anything (around disable-ww-mode activate)
  (ad-deactivate-regexp "widen-window")
  (unwind-protect
      ad-do-it
    (ad-activate-regexp "widen-window")))

'(defadvice anything (around disable-debug-around-anything activate)
  (setq debug-on-error nil)
  (unwind-protect
      ad-do-it
    (setq debug-on-error t)))

;;;; patches
(setq fit-frame-inhibit-fitting-flag t)
(setq anything-save-configuration-functions '(set-window-configuration . current-window-configuration))
(remove-hook 'kill-emacs-hook 'anything-c-adaptive-save-history) ; adaptive sort file is buggy


;;;; macros
;;; http://www.emacswiki.org/emacs/AnythingSources
(my-load-and-when "_anything-c-source-other-windows")
;;; http://d.hatena.ne.jp/kitokitoki/20101205/p2
(my-load-and-when "_ac-complete-look")
;;; http://gist.github.com/315995
(my-load-and-when "_any-source-visible-mark")
