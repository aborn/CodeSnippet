;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; NAME
;;   file-utils.el     all elisp files operation
;;                     related function definition
;; 
;; USAGE
;;   (load "/path/to/file-utils.el")
;;
;; AUTHOR
;;   Aborn Jiang (aborn.jiang@gmail.com)
;;
;; VERSIOIN
;;   v0.1    2014-01-23  function: obtain-file-content
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun obtain-file-content (filename)
  "Return file content as a string list."
  (interactive "p")
  (with-temp-buffer 
    (insert-file-contents filename)
    (buffer-string)
    )
  )

(defun print-elements-of-list (list)
  "Print each element in list."
  (interactive "p")
  (setq i 0)
  (while list
    (print (concat (number-to-string i) "=" (car list)))
    (setq list (cdr list)
          i (+ i 1))
    )
  )
