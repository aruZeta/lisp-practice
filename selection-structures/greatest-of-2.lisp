(uiop:define-package :lisp-practice/selection-structures/greatest-of-2
  (:documentation
   "Program that asks the user 2 numbers and shows which is the greatest.")
  (:use :cl)
  (:import-from :lisp-practice/utils/get-input
                #:get-number)
  (:export main))
(in-package :lisp-practice/selection-structures/greatest-of-2)

(defun main ()
  "Main function of the program"
  (let ((n1 (get-number))
        (n2 (get-number)))
    (format t
            "The greatest is: ~a~&"
            (greatest-of-2 n1 n2))))

(declaim (ftype (function (integer integer) integer) greatest-of-2))

(defun greatest-of-2 (n1 n2)
  "Return the greatest number passed, N1 or N2.
N1 is a INTEGER.
N2 is a INTEGER."
  (if (> n1 n2)
      n1
      n2))
