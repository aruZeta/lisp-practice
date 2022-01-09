(uiop:define-package :lisp-practice/first-project/ex1
  (:documentation
   "Program that asks the user his age and shows if it is a legal age.")
  (:use :cl)
  (:import-from :lisp-practice/utils/types
                #:positive)
  (:import-from :lisp-practice/utils/get-input
                #:get-positive)
  (:export main))
(in-package :lisp-practice/first-project/ex1)

(declaim (ftype (function (positive &key (:legal-age positive)) boolean)
                legal-age-p))

(defun main ()
  "Main function of the progam."
  (let ((age (get-integer "Enter your age: ")))
    (format t
            "Age: ~a, of legal age: ~a~&"
            age
            (if (legal-age-p age) "yes" "no"))))

(defun legal-age-p (age &key (legal-age 18))
  "Return T if AGE is above or equal to LEGAL-AGE. Otherwise, return NIL.
AGE is a POSITIVE.
LEGAL-AGE is a POSITIVE which defaults to 18."
  (>= age legal-age))
