;;;; Custom types used by the programs

(uiop:define-package :lisp-practice/utils/types
  (:use :cl)
  (:export positive))
(in-package :lisp-practice/utils/types)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defun positivep (object)
    "Return T if object is a positive NUMBER or 0.
Otherwise, return NIL."
    (when (numberp object)
      (>= object 0))))

(deftype positive ()
  "Type for objects which must be a positive NUMBER or 0."
  `(satisfies positivep))
