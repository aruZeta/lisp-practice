(uiop:define-package :lisp-practice/first-project/all
  (:use :cl)
  (:mix-reexport
   :lisp-practice/first-project/src/double
   :lisp-practice/first-project/src/operators
   :lisp-practice/first-project/src/expression-exercises/ex1
   :lisp-practice/first-project/src/expression-exercises/ex2
   :lisp-practice/first-project/src/expression-exercises/ex3
   :lisp-practice/first-project/src/expression-exercises/ex4
   :lisp-practice/first-project/src/expression-exercises/ex5
   :lisp-practice/first-project/src/expression-exercises/ex6
   :lisp-practice/first-project/src/expression-exercises/ex7
   :lisp-practice/first-project/src/expression-exercises/ex9))
