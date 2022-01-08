(uiop:define-package :lisp-practice/utils/types
  (:documentation
   "Collection of custom types.")
  (:import-from :lisp-practice/utils/type-checkers
                #:positivep
                #:string-list-p
                #:char-list-p
                #:int-list-p
                #:char-list-to-string-alist-p
                #:int-to-string-alist-p
                #:dayp
                #:datep)
  (:use :cl))
(in-package :lisp-practice/utils/types)

(deftype positive ()
  "Type for objects which must be a positive NUMBER or 0."
  `(satisfies positivep))

(deftype string-list ()
  "Type for objects which must be a STRING LIST."
  `(satisfies string-list-p))

(deftype char-list ()
  "Type for objects which must be a CHARACTER LIST."
  `(satisfies char-list-p))

(deftype int-list ()
  "Type for objects which must be a INTEGER LIST."
  `(satisfies int-list-p))

(deftype char-list-to-string-alist ()
  "Type for objects which must be a ALIST of CHARACTER LIST to STRING."
  `(satisfies char-list-to-string-alist-p))

(deftype int-to-string-alist ()
  "Type for objects which must be a ALIST of INTEGER to STRING."
  `(satisfies int-to-string-alist-p))

(deftype day ()
  "Type for object which must be a DAY.
A DAY is a INTEGER which is between 1 and 31 (inclusive)."
  `(satisfies dayp))

(deftype date ()
  "Type for objects which must be a DATE.
A DATE is a LIST of (DAY MONTH YEAR), but not all are necessary, if there is
only DAY then it wont be a LIST but a INTEGER."
  `(satisfies datep))
