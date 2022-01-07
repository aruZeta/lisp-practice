;;;; Make a program that asks the user a number and shows if it is odd or even

(uiop:define-package :lisp-practice/selection-structures/odd-or-even
  (:use :cl)
  (:import-from :lisp-practice/utils/get-input
                #:get-number)
  (:export main))
(in-package :lisp-practice/selection-structures/odd-or-even)

(defun main ()
  "Main function of the program."
  (let ((number (get-number)))
    (format t
            "~a"
            (if (evenp number)
                "Even"
                "Odd"))))
