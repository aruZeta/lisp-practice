;;;; Make a program that asks the user for 3 programs and shows if they are
;;;; ordered

(uiop:define-package :lisp-practice/first-project/ex7
  (:use :cl)
  (:import-from :lisp-practice/utils/get-input #:get-number)
  (:export main))
(in-package :lisp-practice/first-project/ex7)

(defun main ()
  "Main function of the program."
  (let ((a (get-number))
        (b (get-number))
        (c (get-number)))
    (format t
            "The numbers are~a ordered"
            (if (ordered-p a b c)
                ""
                "n't"))))

(defun ordered-p (n1 n2 n3)
  "Return T if the 3 values passed are ordered from lowest to highest or highest
to lowest. Otherwise, return NIL"
  (or (> n1 n2 n3)
      (< n1 n2 n3)))
