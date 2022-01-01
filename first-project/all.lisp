(uiop:define-package :lisp-practice/first-project/all
  (:use :cl)
  (:mix-reexport
   :lisp-practice/first-project/src/double
   :lisp-practice/first-project/src/operators))
