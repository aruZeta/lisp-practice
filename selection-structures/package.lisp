(uiop:define-package :lisp-practice/first-project/all
  (:use :cl)
  (:mix-reexport
   :lisp-practice/selection-structures/calculate-water-bill
   :lisp-practice/selection-structures/day-of-the-week
   :lisp-practice/selection-structures/is-vocal
   :lisp-practice/selection-structures/marital-status))
