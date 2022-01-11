(uiop:define-package :lisp-practice/selection-structures/ex5
  (:documentation
   "Program that asks the user for the values a, b and c of a 2nd grade
equation, solves them and shows the solutions.")
  (:use :cl)
  (:import-from :lisp-practice/utils/types
                #:real
                #:real-list)
  (:import-from :lisp-practice/utils/get-input
                #:get-real)
  (:export main))
(in-package :lisp-practice/selection-structures/ex5)

(declaim (ftype (function (real real real) (or real-list boolean))
                solve-2nd-grade-equation)
         (ftype (function (real real) real)
                solve-solution))

(defun main ()
  "Main function of the program."
  (let ((a (get-real "Value of ax^2: "))
        (b (get-real "Value of bx: "))
        (c (get-real "Value of c: ")))
    (format t
            "~:[No solutions~;~:*~{~#[~;x = ~a~;x1 = ~a~&x2 = ~a~]~}~]~&"
            (solve-2nd-grade-equation a b c))))

(defun solve-solution (nominator a)
  "Return the division of NOMINATOR and the double of A.
NOMINATOR and A are REAL."
  (/ nominator
     (* a 2)))

(defun solve-2nd-grade-equation (a b c)
  "Return SOLUTION LIST if there are solutions. Otherwise, return NIL.
SOLUTION LIST is a REAL LIST specifying the solutions, may be 1 or 2.
A, B and C are REAL."
  (let ((discriminant (- (expt b 2) (* a c 4))))
    (cond
      ((> discriminant 0) `(,(solve-solution (- (sqrt discriminant) b) a)
                            ,(solve-solution (- (+ (sqrt discriminant) b)) a)))
      ((= discriminant 0) `(,(solve-solution (- b) a))))))
