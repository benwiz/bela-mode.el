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

;; TODO defcustom for bbb-address. Make sure to have a good default. Maybe have a default for bela-scripts-dir, it's mainly for me anyway.
;; TODO a flag for force overwrite. It's `--force` on build_project.sh
;; TODO need to get project directory somehow
;; BBB_ADDRESS=root@192.168.6.2 ./build_project.sh ../examples/Fundamentals/print/

(defcustom bela-scripts-dir nil
  "The local directory containing Bela scripts (https://github.com/BelaPlatform/Bela/tree/master/scripts)."
  :type 'string
  :group 'bela-mode)

(defun trailing-slash? (path)
  "Check for trailing slash on PATH."
  (string= "/" (substring path (- (length path) 1) (length path))))

(defun fullpath (path filename)
  "Concat PATH and FILENAME intelligently based on trailing slash."
  (if (trailing-slash? path)
      (concat bela-scripts-dir filename)
    (concat bela-scripts-dir filename)))

(defun command (filename)
  "Create command using PATH and FILENAME."
  (concat "BBB_ADDRESS=root@192.168.6.2 " (fullpath bela-scripts-dir filename)))

(defun bela-my-test ()
  "Call my_test.sh."
  (interactive)
  (shell-command (command "my_test.sh")))

(defun bela-build-project ()
  "Call my_test.sh."
  (interactive)
  (shell-command (command "build_project.sh ~/code/bela-dsp/looper/")))

(defun bela-stop-running ()
  "Call my_test.sh."
  (interactive)
  (shell-command (command "stop_running.sh")))

;;;###autoload
(define-minor-mode bela-mode
  "Minor mode for calling Bela scripts"
  :lighter " bela"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "C-c t") 'bela-my-test)
            map))

(provide 'bela-mode)
;;; bela-mode.el ends here
