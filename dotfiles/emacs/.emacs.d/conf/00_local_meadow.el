(set-language-environment "Japanese")

;; IME
(setq default-input-method "MW32-IME")
(add-hook 'mw32-ime-on-hook
          (function (lambda () (set-cursor-color "SkyBlue"))))
(add-hook 'mw32-ime-off-hook
          (function (lambda () (set-cursor-color "LemonChiffon"))))
(setq-default mw32-ime-mode-line-state-indicator "[--]")
(setq mw32-ime-mode-line-state-indicator-list '("[--]" "[J]" "[--]"))
(mw32-ime-initialize)

;; mouse cursor
(setq w32-hide-mouse-timeout 1000)
(setq w32-hide-mouse-on-key t)

;; font-setup
;(install-elisp "http://www.bookshelf.jp/elc/font-setup.el")
;; �ե��������
(when (require 'font-setup nil t)
  (setq font-setup-bdf-dir
        (expand-file-name "../../fonts/intlfonts" data-directory))
  (defun font-setup-small (&optional font num unuse set)
    (interactive)
    (let ((fn (or font font-setup-ttf-def))
          (n (or num font-setup-ttf-def-number))
          (dir (expand-file-name font-setup-bdf-dir))
          fs min
          (num 2) (size -14))
      (setq min (or font-setup-bdf-hangul-mincho
                    (string-match "��ī\\|mincho" fn)))

      (while (not (= num 0))
        (if (= num 1)
            (setq size -12))
        (setq fs
              (or set
                  (concat fn (int-to-string size))))
        (w32-add-font
         fs
         `((spec
            ;; **TrueType Fonts**
            ;; ascii
            ((:char-spec ascii :height any)
             strict
             (w32-logfont ,fn 0 ,size 400 0 nil nil nil 0 1 3 ,n))
            ((:char-spec ascii :height any :weight bold)
             strict
             (w32-logfont ,fn 0 ,size 700 0 nil nil nil 0 1 3 ,n)
             ((spacing . -1)))
            ((:char-spec ascii :height any :weight normal :slant italic)
             strict
             (w32-logfont ,fn 0 ,size 400 0 t nil nil 0 1 3 ,n))
            ((:char-spec ascii :height any :weight bold :slant italic)
             strict
             (w32-logfont ,fn 0 ,size 700 0 t nil nil 0 1 3 ,n)
             ((spacing . -1)))
            ;; katakana-jisx0201
            ((:char-spec katakana-jisx0201 :height any)
             strict
             (w32-logfont ,fn 0 ,size 400 0 nil nil nil 128 1 3 ,n))
            ((:char-spec katakana-jisx0201 :height any :weight bold)
             strict
             (w32-logfont ,fn 0 ,size 700 0 nil nil nil 128 1 3 ,n)
             ((spacing . -1)))
            ((:char-spec katakana-jisx0201
                         :height any :weight normal :slant italic)
             strict
             (w32-logfont ,fn 0 ,size 400 0 t nil nil 128 1 3 ,n))
            ((:char-spec katakana-jisx0201
                         :height any :weight bold :slant italic)
             strict
             (w32-logfont ,fn 0 ,size 700 0 t nil nil 128 1 3 ,n)
             ((spacing . -1)))
            ;; japanese-jisx0208
            ((:char-spec japanese-jisx0208 :height any)
             strict
             (w32-logfont ,fn 0 ,size 400 0 nil nil nil 128 1 3 ,n))
            ((:char-spec japanese-jisx0208 :height any :weight bold)
             strict
             (w32-logfont ,fn 0 ,size 700 0 nil nil nil 128 1 3 ,n)
             ((spacing . -1)))
            ((:char-spec japanese-jisx0208
                         :height any :weight normal :slant italic)
             strict
             (w32-logfont ,fn 0 ,size 400 0 t nil nil 128 1 3 ,n))
            ((:char-spec japanese-jisx0208
                         :height any :weight bold :slant italic)
             strict
             (w32-logfont ,fn 0 ,size 700 0 t nil nil 128 1 3 ,n)
             ((spacing . -1))))))
        ;; ����¾
        (setq scalable-fonts-allowed t)
        (setq num (- num 1)))))
  (font-setup "�ͣ� �����å�" 49 t)
  (font-setup "�ͣ� ��ī" 17 t)
  (font-setup-small "�ͣ� �����å�" 49 t)
  (font-setup-small "�ͣ� ��ī" 17 t)
  ;; IME �� Font
  (add-to-list 'default-frame-alist
               `(ime-font
                 w32-logfont "�ͣ� �����å�" 0 0 400 0 nil nil nil 128 1 3 49)))
