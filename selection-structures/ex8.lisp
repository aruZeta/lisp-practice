(uiop:define-package :lisp-practice/selection-structures/ex8
  (:documentation
   "Program that asks the user a number and shows it reversed.")
  (:use :cl)
  (:import-from :lisp-practice/utils/types
                #:positive)
  (:import-from :lisp-practice/utils/get-input
                #:get-positive)
  (:export main))
(in-package :lisp-practice/selection-structures/ex8)

(declaim (ftype (function (positive) positive)
                reverse-n))

(defun main ()
  "Main function of the program."
  (let ((number (get-positive "Enter a number: ")))
    (format t
            "Reversed: ~a~&"
            (reverse-n number))))

(defun reverse-n (n)
  "Return the reverse of N.
N is a POSITIVE."
  (let ((reversed-n 0))
    (loop while (> n 0) do
      (setq reversed-n (+ (* reversed-n 10)
                          (mod n 10))
            n (floor n 10)))
    reversed-n))
