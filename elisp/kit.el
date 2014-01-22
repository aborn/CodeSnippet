#!/usr/bin/emacs --script 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; NAME 
;;    kit.el   ---- an example elisp script
;; 
;; USAGE
;;   emacs -Q --script kit.el
;;   ./kit.el
;;
;; NOTE
;; #!/  shebang works for emacs22 and later.
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(print argv)
(message "hello word")
(message "input argument are %s" argv)
(message "first argument is %s" (elt argv 0))
