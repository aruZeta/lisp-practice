(uiop:define-package :lisp-practice/first-project/ex7
  (:documentation
   "Program that asks the user for 3 numbers and shows if they are ordered.")
  (:use :cl)
  (:import-from :lisp-practice/utils/get-input
                #:get-real)
  (:export main))
(in-package :lisp-practice/first-project/ex7)

(declaim (ftype (function (real real real) boolean)
                orderedp))

(defun main ()
  "Main function of the program."
  (let ((a (get-real "Enter a number: "))
        (b (get-real "Enter a number: "))
        (c (get-real "Enter a number: ")))
    (format t
            "The numbers are~a ordered"
            (if (orderedp a b c)
                ""
                "n't"))))

(defun orderedp (n1 n2 n3)
  "Return T if N1, N2 and N3 are in order. Otherwise, return NIL.
N1, N2 and N3 are REAL."
  (or (> n1 n2 n3)
      (< n1 n2 n3)))
