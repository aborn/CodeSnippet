#!/usr/bin/emacs --script 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; NAME 
;;    kit.el   ---- an example elisp script, which is 
;;             used to calculate intern salary.
;; 
;; USAGE
;;   emacs -Q --script kit.el iday
;;   ./kit.el iday
;;
;; NOTE
;; #!/  shebang works for emacs22 and later.
;; 
;; AUTHOR
;;   Aborn Jiang (aborn.jiang@gmail.com)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(print argv)
(message "input argument are %s" argv)
(message "system-type:%s system-name:%s" system-type system-name)

(defun cal-salary (iday)
  "Calculate the salary for intern in shanghai"
  (interactive "p")
  (setq total (* iday 180))
  (if (> total 800)
      (setq value (+ 800 (* 0.8 (- total 800))) 
            tvalue  (- total value))      ;; if true
    (setq value total                     ;; else part
          tvalue 0))
  (message "You have worked %d day(s), and salary is %d, tax is %d."  iday value tvalue)
  )

(cal-salary (string-to-number (elt argv 0)))
