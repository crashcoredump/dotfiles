;;;
;;;  arorem.el -
;;;
;;;  Assorted Ruby on Rails Emacs Modes
;;;  
;;;  Latest version may be found at
;;;  http://dev.technomancy.us/phil/wiki/arorem
;;;

;;; Motivation

;; Arorem used to be Another Ruby on Rails Emacs Mode. However, it
;; turns out rather than having a single mode for Rails editing, it's
;; more effective work with a combination of a number of modes and add
;; a few rails-specific features to ruby-mode. So Arorem has become a
;; modular collection of elisp to help with rails.

;;; Usage

;; - toggle
;; - console
;; - ri
;; - snippets
;; - rhtml
;; - psvn help?
;; - config file registers?
;; - rake?

;;; TODO

;; See the open ticket list: http://dev.technomancy.us/phil/report/10

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar arorem-version "0.2")
(require 'ruby-mode)
(require 'inf-ruby)
(require 'snippet)
(require 'rhtml-mode)

(load "abbrevs")

;;; view toggling

(defun ruby-find-view ()
  (interactive)
  (let* ((funname (which-function))
 	 (cls (and (string-match "\\(.*\\)Controller#" funname) (downcase (match-string 1 funname))))
 	 (fn (and (string-match "#\\(.*\\)" funname) (match-string 1 funname)))
 	 (appdir (file-name-directory (directory-file-name (file-name-directory (buffer-file-name))))))
    (find-file (concat appdir "views/" cls "/" fn ".rhtml"))))


;;; script/console

(defun rails-root (&optional dir)
  (or dir (setq dir default-directory))
  (if (file-exists-p (concat dir "config/environment.rb"))
      dir
    (if (equal dir  "/")
	nil
      (rails-root (expand-file-name (concat dir "../"))))))

(defun arorem-console ()
  (interactive)
  (run-ruby (concat (rails-root) "/script/console")))

(define-key ruby-mode-map
  "\C-c\C-s" 'arorem-console)
(define-key ruby-mode-map
  "\C-c\C-v" 'ruby-find-view)
(define-key ruby-mode-map
  "\C-c\C-t" 'toggle-test)
(define-key ruby-mode-map
  "\C-c\C-f" 'toggle-fixture)

(provide 'arorem)
