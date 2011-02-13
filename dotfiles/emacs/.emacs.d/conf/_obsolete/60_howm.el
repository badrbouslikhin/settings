;;;; http://howm.sourceforge.jp/
(my-autoload-and-when 'howm-menu "howm"
                      (setq howm-menu-lang 'ja)
                      (setq howm-directory "~/howm")
                      (setq howm-file-name-format "%Y/%m/%Y%m%d-%H%M%S.howm")
;;;                      (setq howm-file-name-format "%Y/%m/%Y%m%d.howm")
                      (setq howm-keyword-file "~/howm/.howm-keys")
                      (setq howm-history-file "~/howm/.howm-history")
                      (setq howm-menu-file "~/howm/.howm-menu")
                      (setq howm-keyword-case-fold-search t)
;;;                      (setq howm-list-all-title t)
                      (setq howm-list-title nil)
                      (setq howm-list-recent-title t)
                      (setq howm-menu-refresh-after-save nil)
                      (setq howm-refresh-after-save nil)
;;;                      (setq howm-view-summary-persistent nil)
                      (setq howm-menu-expiry-hours 2)
                      (setq howm-menu-schedule-days-before 10)
                      (setq howm-menu-schedule-days 3)
                      (setq howm-view-grep-command "egrep")
;;;                      (define-key howm-mode-map [tab] 'action-lock-goto-next-link)
;;;                      (define-key howm-mode-map [(meta tab)] 'action-lock-goto-previous-link)
                      (define-key howm-mode-map "\C-c\C-c" 'my-save-and-kill-buffer)
                      )
(global-set-key "\C-c,," 'howm-menu)
