;; org-summary-todo
;; http://orgmode.org/org.html
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)    ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

;(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)
