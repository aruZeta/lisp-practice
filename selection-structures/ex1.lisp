(uiop:define-package :lisp-practice/selection-structures/ex1
  (:documentation
   "Program that asks the user the 3 sides of a triangle and shows the type of
triangle depending on the angles.")
  (:use :cl)
  (:import-from :lisp-practice/utils/get-input
                #:get-number)
  (:export main))
(in-package :lisp-practice/selection-structures/ex1)

(declaim (ftype (function (integer integer integer) string)
                triangle-type-angles))

(defun main ()
  "Main function of the program"
  (let ((side1 (get-number))
        (side2 (get-number))
        (side3 (get-number)))
    (format t
            "The triangle is: ~a~&"
            (triangle-type-angles side1 side2 side3))))

(defun triangle-type-angles (side1 side2 side3)
  "Return TYPE depending on SIDE1, SIDE2 and SIDE3.
TYPE is a STRING specifying the type of triangle depending on the angles.
SIDE1 is a INTEGER specifying a side.
SIDE2 is a INTEGER specifying a side.
SIDE3 is a INTEGER specifying a side."
  (let* ((sides (sort `(,side1 ,side2 ,side3) #'>))
       	 (a (car sides))
       	 (b (nth 1 sides))
       	 (c (nth 2 sides)))
    (if (< a (+ b c))
        (let ((squared-a (* a a))
              (squared-rest (+ (* b b)
                               (* c c))))
          (cond
            ((< squared-a squared-rest) "Acute")
            ((> squared-a squared-rest) "Oblique")
            (t "Right")))
        "Not a tringle")))
