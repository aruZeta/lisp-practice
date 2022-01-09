(uiop:define-package :lisp-practice/selection-structures/ex3
  (:documentation
   "Program that asks the user his DNI number (spanish national ID) and shows
the letter associated to it.")
  (:use :cl)
  (:import-from :lisp-practice/utils/types
                #:char-list)
  (:import-from :lisp-practice/utils/get-input
                #:get-positive)
  (:export main))
(in-package :lisp-practice/selection-structures/ex3)

(declaim (type (char-list)
               +dni-associated-letters+)
         (ftype (function (positive) character)
                dni-letter))

(defconstant +dni-associated-letters+ '(#\T #\R #\W #\A #\G #\M
                                        #\Y #\F #\P #\D #\X #\B
                                        #\N #\J #\Z #\S #\Q #\V
                                        #\H #\L #\C #\K #\E)
  "CHARACTER LIST specifying the letters associated to DNI.")

(defun main ()
  "Main function of the program."
  (let ((dni (get-positive "Enter your DNI number: ")))
    (format t
            "Letter: ~a"
            (dni-letter dni))))

(defun dni-letter (dni)
  "Return CHARACTER representing the letter associated to DNI.
DNI is a POSITIVE."
  (nth (- dni (* (floor dni 23) 23))
       +dni-associated-letters+))
