;;;; Custom types used by the programs

(uiop:define-package :lisp-practice/utils/types
  (:use :cl)
  (:export positive
           string-list
           char-list
           int-list
           char-list-to-string-alist
           day
           date))
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

  (defun int-list-p (object)
    "Return T if OBJECT is a LIST containing INTEGER.
Otherwise, return NIL."
    (when (listp object)
      (every #'integerp object)))

  (defun char-list-to-string-alist-p (object)
    "Return T if OBJECT is a ALIST of CHARACTER LIST to STRING.
Otherwise, return NIL."
    (when (listp object)
      (every #'char-list-to-string-cons-p object)))

  (defun int-to-string-alist-p (object)
    "Return T if OBJECT is a ALIST of INTEGER to STRING.
Otherwise, return NIL."
    (when (listp object)
      (every #'int-to-string-cons-p object)))

  (defun char-list-to-string-cons-p (object)
    "Return T if OBJECT is a CONS of CHARACTER LIST to STRING.
Otherwise, return NIL."
    (when (consp object)
      (and (char-list-p (car object))
           (stringp (cdr object)))))

  (defun int-to-string-cons-p (object)
    "Return T if OBJECT is a CONS of INTEGER to STRING.
Otherwise, return NIL."
    (when (consp object)
      (and (integerp (car object))
           (stringp (cdr object)))))

  (defconstant +days-of-months+ '(31 28 31 30 31 30 31 31 30 31 30 31))

  (defun leap-year-p (year)
    "Return T if YEAR is a LEAP-YEAR.
Otherwise, return NIL.
YEAR is a INTEGER.
YEAR is LEAP-YEAR if it is multiple of 4 and not of 100, or multiple of 400."
    (or (zerop (mod year 400))
        (and (zerop (mod year 4))
             (not (zerop (mod year 100))))))

  (defun dayp (object &optional month year)
    "Return T if OBJECT is a DAY.
Otherwise, return NIL.
If MONTH is passed, check `+days-of-the-months'.
If YEAR is passed and it is a leap year, month 2 will have 1 day more."
    (when (integerp object)
      (and (> object 0)
           (<= object (if month
                          (let ((days (nth (1- month) +days-of-months+)))
                            (when year
                              (when (and (leap-year-p year)
                                         (= month 2))
                                (incf days)))
                            days)
                          31)))))
  (defun monthp (object)
    "Return T if OBJECT is a MONTH.
Otherwise, return NIL."
    (when (integerp object)
      (and (> object 0)
           (<= object 12))))

  (defun datep (object)
    "Return T if OBJECT is a DATE.
Otherwise, return NIL.
DATE is a LIST (DAY MONTH YEAR), YEAR may or may not appear."
    (when (int-list-p object)
      (if (= (length object) 3)
          (and (dayp (car object)
                     (nth 1 object)
                     (nth 2 object))
               (monthp (nth 1 object))
               (integerp (nth 2 object)))
          (and (dayp (car object)
                     (nth 1 object))
               (monthp (nth 1 object)))))))

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
