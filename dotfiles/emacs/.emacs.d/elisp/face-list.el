                                                                                                                                                                                                                                                                
From: Alex Schroeder <a...@bsiag.com>
Subject: face-list.el
Date: 2000/06/15
Message-ID: <ud7lj825b.fsf@bsiag.com>#1/1
X-Deja-AN: 634895419
Followup-To: gnu.emacs.help
Content-Type: text/plain; charset=us-ascii
X-Complaints-To: news@ip-plus.net
X-Trace: pollux.ip-plus.net 961078253 9833 164.128.46.210 (15 Jun 2000 14:10:53 GMT)
Organization: BSI AG, http://www.bsiag.com/
X-Home-Page: http://www.geocities.com/kensanata/
Mime-Version: 1.0
User-Agent: Gnus/5.0803 (Gnus v5.8.3) Emacs/20.6
NNTP-Posting-Date: 15 Jun 2000 14:10:53 GMT
Newsgroups: gnu.emacs.sources

The following mode might be very usefull for people developping
color-themes...  After calling `list-faces-display' you are put in a
special mode that allows you to call 'customize-face' for the face at
point with a keystroke.

In order to use this for color-theme.el, customize the faces you want
without saving them for future sessions, and then use
color-theme-print to save your settings in a color-theme (setting the
stuff for future sessions would record the face definitions in your
~/.emacs file).

Alex.


;;; face-list.el --- convenience functions for face customization

;; Copyright (C) 2000  Alex Schroeder <a...@gnu.org>

;; Author: Alex Schroeder <a...@gnu.org>
;; Maintainer: Alex Schroeder <a...@gnu.org>
;; Version: 1.0.0
;; Keywords: faces

;; This file is not part of GNU Emacs.

;; This is free software; you can redistribute it and/or modify it under
;; the terms of the GNU General Public License as published by the Free
;; Software Foundation; either version 2, or (at your option) any later
;; version.

;; This is distributed in the hope that it will be useful, but WITHOUT
;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
;; FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
;; for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330, Boston,
;; MA 02111-1307, USA.

;;; Commentary:

;; This code allows you to browse the list of defined faces and to
;; quickly call a face customization buffer for the face at point,
;; thereby facilitating the job of a color theme author.

;; Loading this code will advise `list-faces-display' to put the *Faces*
;; buffer into `faces-list-mode'.  That modes provides two extra key
;; bindings; one of them calls `face-describe' for the face at point,
;; the other calls `customize-face' for the face at point.

;; The two functions to describe and customize the face at point can be
;; called from anywhere; they are `describe-face-at-point' and
;; `customize-face-at-point'.  If you are working with Emacs and
;; discover a face you don't like, put point on some text with the
;; offending face and type M-x customize-face-at-point RET.



;;; Code:

(defadvice list-faces-display (after do-faces-list-mode activate)
  "Start faces-list-mode after listing the faces."
  (set-buffer (get-buffer "*Faces*"))
  (faces-list-mode))

(defun faces-list-mode ()
  "Major mode to examine and modify faces.

Use \\[describe-face-at-point] to describe the face at point.
Use \\[customize-face-at-point] to customize the face at point."
  (kill-all-local-variables)
  (setq major-mode 'faces-list-mode)
  (setq mode-name "Faces")
  (use-local-map faces-list-mode-map)
  (setq buffer-read-only t))

(defvar faces-list-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "e") 'customize-face-at-point)
    (define-key map (kbd "RET") 'customize-face-at-point)
    (define-key map (kbd "d") 'describe-face-at-point)
    (define-key map (kbd "?") 'describe-face-at-point)
    map)
  "Mode map used for `faces-list-mode'.")

(defun describe-face-at-point ()
  "Describe face at point."
  (interactive)
  (describe-face (get-face-at-point)))

(defun customize-face-at-point ()
  "Customize face at point."
  (interactive)
  (customize-face (get-face-at-point)))

(defun get-face-at-point ()
  "Determine face at point using `get-char-property'.  
If char at point has no face property, examine the text on the same line
as point as well."
  (or (get-char-property (point) 'face)
      (let ((start (point))
	    (face))
	(while (null (or (setq face (get-char-property (point) 'face))
			 (eolp)))
	  (forward-char 1))
	(goto-char start)
	face)
      (let ((start (point))
	    (face))
	(while (null (or (setq face (get-char-property (point) 'face))
			 (bolp)))
	  (forward-char -1))
	(goto-char start)
	face)
      (error "No face selected.")))

;; face-list.el ends here

