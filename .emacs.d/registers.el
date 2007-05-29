
;;; Part of my .emacs file

;; by Phil Hagelberg
;; Much thanks to emacswiki.org and RMS.

;; Note: this relies on files found in my dotfiles repository:
;; http://dev.technomancy.us/phil/browser/dotfiles/

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;     registers (C-x C-r)

(set-register ?e '(file . "~/.emacs"))
(set-register ?d '(file . "~/.emacs.d"))
(set-register ?r '(file . "~/.emacs.d/rinari/rinari.el"))
(set-register ?y '(file . "~/.emacs.d/ebby.el"))
(set-register ?g '(file . "~/.gnus.el"))
(set-register ?t '(file . "/philisha.net:timecard"))
(set-register ?b '(file . "~/.bashrc"))
(set-register ?s '(file . "~/.screenrc"))
(set-register ?c '(file . "~/.contacts"))
(set-register ?f '(file . "~/.feeds.opml"))
(set-register ?n '(file . "~/documents/NOTES"))


(provide 'registers)