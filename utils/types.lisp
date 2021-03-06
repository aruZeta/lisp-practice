(uiop:define-package :lisp-practice/utils/types
  (:documentation
   "Collection of custom types.")
  (:import-from :lisp-practice/utils/type-checkers
                #:positivep
                #:integer-between-0-99-p
                #:string-list-p
                #:char-list-p
                #:real-list-p
                #:int-list-p
                #:positive-list-p
                #:char-list-to-string-alist-p
                #:int-to-string-alist-p
                #:dayp
                #:monthp
                #:datep
                #:gradep)
  (:use :cl))
(in-package :lisp-practice/utils/types)

(deftype positive ()
  "Type for objects which must be a positive NUMBER or 0."
  `(satisfies positivep))

(deftype integer-between-0-99 ()
  "Type for objects which must be a INTEGER between 0 and 99."
  `(satisfies integer-between-0-99-p))

(deftype string-list ()
  "Type for objects which must be a STRING LIST."
  `(satisfies string-list-p))

(deftype char-list ()
  "Type for objects which must be a CHARACTER LIST."
  `(satisfies char-list-p))

(deftype real-list ()
  "Type for objects which must be a REAL LIST."
  `(satisfies real-list-p))

(deftype int-list ()
  "Type for objects which must be a INTEGER LIST."
  `(satisfies int-list-p))

(deftype positive-list ()
  "Type for objects which must be a POSITIVE LIST."
  `(satisfies positive-list-p))

(deftype char-list-to-string-alist ()
  "Type for objects which must be a ALIST of CHARACTER LIST to STRING."
  `(satisfies char-list-to-string-alist-p))

(deftype int-to-string-alist ()
  "Type for objects which must be a ALIST of INTEGER to STRING."
  `(satisfies int-to-string-alist-p))

(deftype day ()
  "Type for objects which must be a DAY.
A DAY is a INTEGER which is between 1 and 31 (inclusive)."
  `(satisfies dayp))

(deftype month ()
  "Type for objects which must be a MONTH.
A MONTH is a INTEGER which is between 1 and 12."
  `(satisfies monthp))

(deftype date ()
  "Type for objects which must be a DATE.
A DATE is a LIST of (DAY MONTH YEAR), but not all are necessary, if there is
only DAY then it wont be a LIST but a INTEGER."
  `(satisfies datep))

(deftype grade ()
  "Type for objects which must be a GRADE.
A GRADE is a INTEGER which is between 0 and 10."
  `(satisfies gradep))
