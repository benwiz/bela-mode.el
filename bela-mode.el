;;; bela-mode.el --- Minor mode for interacting with a Bela board. -*- coding: utf-8; lexical-binding: t; -*-

;; Copyright © 2020, by Ben Wiz

;; Author: Ben Wisialowski (bwisialowski@gmail.com)
;; Version: 1.0.0
;; Created: 19 Fed 2020
;; Keywords: bela
;; Homepage: https://github.com/benwiz/bela-mode.el

;; This file is not part of GNU Emacs.

;;; License:

;; You can redistribute this program and/or modify it under the terms of the GNU General Public License version 2.

;;; Commentary:

;; short description here

;; full doc on how to use here

;;; Code:

;; helpful https://nullprogram.com/blog/2013/02/06/

;; TODO figure out how to turn on bela mode using .dir-locals
;; TODO create a concat function that checks for trailing slash

(defcustom bela-scripts-dir nil
  "The local directory containing Bela scripts (https://github.com/BelaPlatform/Bela/tree/master/scripts)."
  :type 'string
  :group 'bela-mode)

(defun bela-my-test ()
  "Call my_test.sh."
  (interactive)
  (shell-command (concat bela-scripts-dir "my_test.sh")))

;;;###autoload
(define-minor-mode bela-mode
  "Minor mode for calling Bela scripts"
  :lighter " bela"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "C-c e") 'bela-my-test)
            map))

(provide 'bela-mode)
;;; bela-mode.el ends here
