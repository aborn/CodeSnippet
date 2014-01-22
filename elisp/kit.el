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
(message "system-type:%s system-name:%s" system-type system-name)
                                        ;(message (string-to-int))

(defun cal-salary (iday)
  "Calculate the salary for intern in shanghai"
  (interactive "p")
  (setq value (+ 800 (* 0.8 (- (* iday 180)800))))
  (setq tvalue (- (* iday 180) value))
  (message "You work %d day, and salary is %d, tax is %d."  iday value tvalue)
  )

(cal-salary (string-to-number (elt argv 0)))