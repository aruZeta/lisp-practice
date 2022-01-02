;;;; Make a program that asks the user for a number and shows it reversed

(uiop:define-package :lisp-practice/first-project/ex9
  (:use :cl)
  (:import-from :lisp-practice/utils/get-input #:get-number)
  (:export main))
(in-package :lisp-practice/first-project/ex9)

(defun main ()
  "Main function of the program."
  (let ((number (get-number)))
    (format t
            "~a reversed: ~a~&"
            number
            (reverse-n number))))

(defun reverse-n (n)
  "Return the reverse of the number passed."
  (let ((reversed-n 0))
    (loop while (> n 0) do
      (setq reversed-n (+ (* reversed-n 10)
                          (mod n 10))
            n (floor n 10)))
    reversed-n))
