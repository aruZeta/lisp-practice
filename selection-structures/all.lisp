(uiop:define-package :lisp-practice/first-project/all
  (:use :cl)
  (:mix-reexport
   :lisp-practice/selection-structures/src/simple-and-double/calculate-water-bill
   :lisp-practice/selection-structures/src/simple-and-double/day-of-the-week
   :lisp-practice/selection-structures/src/simple-and-double/is-vocal
   :lisp-practice/selection-structures/src/simple-and-double/marital-status))
