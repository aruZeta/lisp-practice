;;;; Make a program that asks the user the character (alias) representing his
;;;; marital status and shows the complete name

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defun char-list-to-string-alist-p (object)
    "Return T if OBJECT is a ALIST of CHARACTER LIST to STRING.
Otherwise, return NIL."
    (when (listp object)
      (every #'char-list-to-string-cons-p object)))

  (defun char-list-p (object)
    "Return T if OBJECT is a LIST containing CHARACTER.
Otherwise, return NIL."
    (when (listp object)
      (every #'characterp object)))

  (defun char-list-to-string-cons-p (object)
    "Return T if OBJECT is a CONS of CHARACTER LIST to STRING.
Otherwise, return NIL."
    (when (consp object)
      (and (char-list-p (car object))
           (stringp (cdr object))))))

(deftype char-list-to-string-alist ()
  "Type for objects which must be a ALIST of CHARACTER LIST to STRING."
  `(satisfies char-list-to-string-alist-p))

(declaim (type (char-list-to-string-alist) *alias-to-marital-status-list*))

(defvar *alias-to-marital-status-alist*
  '(((#\n #\N) . "Never married")
    ((#\m #\M) . "Married")
    ((#\s #\S) . "Separated")
    ((#\d #\D) . "Divorced")
    ((#\w #\W) . "Widowed"))
  "ALIST of ALIAS LIST to MARITAL STATUS.
ALIAS LIST is a CHARACTER LIST representing an alias of MARITAL STATUS.
MARITAL STATUS is a STRING with the full name of a marital status.

Example: '(((#\n #\N) . \"Never Married\") ((#\d #\D) \"Divorced\"))")

(defun main ()
  "Main function of the program."
  (let ((alias (get-marital-status-alias)))
    (format t
            "~a~&"
            (marital-status-from-alias alias))))

(declaim (ftype (function () character) get-marital-status-alias))

(defun get-marital-status-alias ()
  "Ask the user to enter ALIAS and return its value.
ALIAS is a CHARACTER representing an alias of MARITAL STATUS in
`*alias-to-marital-status-alist*'."
  (print "Enter the character representing your marital status (alias): ")
  (read-char))

(declaim (ftype (function (character) string) marital-status-from-alias))

(defun marital-status-from-alias (alias)
  "Return MARITAL STATUS bound to ALIAS in `*alias-to-marital-status-alist*'.
If ALIAS doesn't appear return \"Unknown alias\".
ALIAS is a CHARACTER.
MARITAL STATUS is a STRING."
  (or (block search-status
        (loop for item in *alias-to-marital-status-alist* do
          (when (member alias (car item))
            (return-from search-status (cdr item)))))
      "Unknown alias"))
