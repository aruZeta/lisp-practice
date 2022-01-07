;;;; Make a program that asks the user for 3 programs and shows if they are
;;;; ordered

(uiop:define-package :lisp-practice/first-project/ex7
  (:use :cl)
  (:import-from :lisp-practice/utils/get-input
                #:get-number)
  (:export main))
(in-package :lisp-practice/first-project/ex7)

(defun main ()
  "Main function of the program."
  (let ((a (get-number))
        (b (get-number))
        (c (get-number)))
    (format t
            "The numbers are~a ordered"
            (if (orderedp a b c)
                ""
                "n't"))))

(declaim (ftype (function (number number number) boolean) orderedp))

(defun orderedp (n1 n2 n3)
  "Return T if N1, N2 and N3 are in order. Otherwise, return NIL.
N1, N2 and N3 are NUMBER."
  (or (> n1 n2 n3)
      (< n1 n2 n3)))
