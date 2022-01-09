(uiop:define-package :lisp-practice/selection-structures/odd-or-even
  (:documentation
   "Program that asks the user a number and shows if it is odd or even.")
  (:use :cl)
  (:import-from :lisp-practice/utils/get-input
                #:get-integer)
  (:export main))
(in-package :lisp-practice/selection-structures/odd-or-even)

(defun main ()
  "Main function of the program."
  (let ((number (get-integer "Enter a integer: ")))
    (format t
            "~a"
            (if (evenp number)
                "Even"
                "Odd"))))
