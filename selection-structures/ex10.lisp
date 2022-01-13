(uiop:define-package :lisp-practice/selection-structures/ex10
  (:documentation
   "Program that asks the user a grade and shows how bad it is.")
  (:use :cl)
  (:import-from :lisp-practice/utils/types
                #:grade)
  (:import-from :lisp-practice/utils/get-input
                #:get-grade)
  (:export main))
(in-package :lisp-practice/selection-structures/ex10)

(declaim (ftype (function (grade) string)
                show-grade))

(defun main ()
  "Main function of the program."
  (let ((grade (get-grade "Enter a grade: ")))
    (format t
            "~a~&"
            (show-grade grade))))

(defun show-grade (grade)
  "Return STRING specifying GRADE."
  (cond
    ((< grade 5) "Insufficient")
    ((< grade 6) "Sufficient")
    ((< grade 7) "Good")
    ((< grade 9) "Remarkable")
    ((<= grade 10) "Outstanding")))
