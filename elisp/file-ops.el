#!/usr/bin/emacs --script
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; NAME
;;    file-ops.el  an example to visit file
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(message "this is a file test prog")
(setq filename "./test.conf")

(message "The attribute of file %s is %s" filename (file-attributes filename))

(load "~/code/configure/elisp/file-utils.el")
;;(message "gooo:%s" (buffer-string (find-file filename)))
(setq file-content (obtain-file-content filename))

(setq lists '("a" "b" "c"))
(if (listp file-content)
(message "listooooooooooooooo")
(message "not a list tttttttt"))
(print-elements-of-list lists)
(print "end of this print")
(send-string-to-terminal "fffffffffffffff")

;;(print-elements-of-list (cdr file-content))
;;(message "file contents:\n%s" file-content)
;;(message "size=%d" (length file-content))
