;;;; Custom types used by the programs

(uiop:define-package :lisp-practice/utils/types
  (:use :cl)
  (:export positive
           string-list
           char-list
           char-list-to-string-alist))
(in-package :lisp-practice/utils/types)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defun positivep (object)
    "Return T if OBJECT is a positive NUMBER or 0.
Otherwise, return NIL."
    (when (numberp object)
      (>= object 0)))

  (defun string-list-p (object)
    "Return T if OBJECT is a LIST containing STRING.
Otherwise, return NIL."
    (when (listp object)
      (every #'stringp object)))

  (defun char-list-p (object)
    "Return T if OBJECT is a LIST containing CHARACTER.
Otherwise, return NIL."
    (when (listp object)
      (every #'characterp object)))

  (defun char-list-to-string-alist-p (object)
    "Return T if OBJECT is a ALIST of CHARACTER LIST to STRING.
Otherwise, return NIL."
    (when (listp object)
      (every #'char-list-to-string-cons-p object)))

  (defun char-list-to-string-cons-p (object)
    "Return T if OBJECT is a CONS of CHARACTER LIST to STRING.
Otherwise, return NIL."
    (when (consp object)
      (and (char-list-p (car object))
           (stringp (cdr object))))))

(deftype positive ()
  "Type for objects which must be a positive NUMBER or 0."
  `(satisfies positivep))

(deftype string-list ()
  "Type for objects which must be a STRING LIST."
  `(satisfies string-list-p))

(deftype char-list ()
  "Type for objects which must be a CHARACTER LIST."
  `(satisfies char-list-p))

(deftype char-list-to-string-alist ()
  "Type for objects which must be a ALIST of CHARACTER LIST to STRING."
  `(satisfies char-list-to-string-alist-p))
