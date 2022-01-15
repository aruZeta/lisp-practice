(uiop:define-package :lisp-practice/selection-structures/ex11
  (:documentation
   "Program that asks the user a number from 0 to 99 and shows it as text.")
  (:use :cl)
  (:import-from :lisp-practice/utils/types
                #:integer-between-0-99)
  (:import-from :lisp-practice/utils/get-input
                #:get-integer)
  (:export main))
(in-package :lisp-practice/selection-structures/ex11)

(declaim (ftype (function (integer-between-0-99) string)))

(defconstant +written-units+ '("zero" "one" "two" "three" "four"
                               "five" "six" "seven" "eight" "nine"))
(defconstant +written-dozens+ '("ten" "twenty" "thirty" "forty" "fifty"
                                "sixty" "seventy" "eighty" "ninety"))

(defun main ()
  "Main function of the program."
  (let ((number (get-integer "Enter a number from 0 to 99: ")))
    (format t
            "~a~&"
            (number->text number))))

(defun number->text (number)
  "Return TEXT specifying the written version of NUMBER.
TEXT is a STRING.
NUMBER is a INTEGER from 0 to 99."
  (let ((unit (mod number 10))
        (dozen (floor number 10)))
    (cond
      ((zerop dozen) (nth unit +written-units+))
      ((= number 11) "eleven")
      ((= number 12) "twelve")
      ((= number 13) "thirteen")
      ((= number 15) "fifteen")
      ((and (not (zerop unit))
            (= dozen 1))
       (concatenate 'string (nth unit +written-units+) "teen"))
      (t (apply #'concatenate 'string
                (nth (1- dozen) +written-dozens+)
                (unless (zerop unit)
                  `("-" ,(nth unit +written-units+))))))))
