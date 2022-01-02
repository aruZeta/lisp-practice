;;;; Make a program that asks the user a number and shows if it is multiple of 7

(uiop:define-package :lisp-practice/first-project/ex2
  (:use :cl)
  (:import-from :lisp-practice/utils/get-input #:get-number)
  (:export main))
(in-package :lisp-practice/first-project/ex2)

(defun main ()
  "Main function of the progam."
  (let ((number (get-number)))
    (format t
            "~a is~a multiple of 7~&"
            number
            (if (multiple-of-7-p number)
                ""
                "n't"))))

(defun multiple-of-7-p (n)
  "Return T if the number passed is multiple of 7. Otherwise, return NIL."
  (= (mod n 7) 0))
