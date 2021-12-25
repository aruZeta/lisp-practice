;;;; Make a program that asks the user the character (alias) representing his
;;;; marital status and shows the complete name

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defun list-of-alist-char-list-to-string-p (object)
    "Return T if OBJECT is a LIST containing ALIST of CHARACTER LIST to STRING.
Otherwise, return NIL."
    (when (listp object)
      (every #'alist-char-list-to-string-p object)))

  (defun character-list-p (object)
    "Return T if OBJECT is a LIST containing CHARACTER.
Otherwise, return NIL."
    (when (listp object)
      (every #'characterp object)))

  (defun alist-char-list-to-string-p (object)
    "Return T if OBJECT is an ALIST containing CHARACTER LIST to STRING.
Otherwise, return NIL."
    (when (consp object)
      (and (character-list-p (car object))
           (stringp (cdr object))))))

(deftype list-of-alist-char-list-to-string ()
  "Type which must be a LIST containing ALIST of CHARACTER LIST to STRING."
  `(satisfies list-of-alist-char-list-to-string-p))

(declaim (type (list-of-alist-char-list-to-string)
               *alias-to-marital-status-list*))

(defvar *alias-to-marital-status-list*
  '(((#\n #\N) . "Never married")
    ((#\m #\M) . "Married")
    ((#\s #\S) . "Separated")
    ((#\d #\D) . "Divorced")
    ((#\w #\W) . "Widowed"))
  "LIST containing ALIST of ALIAS LIST to MARITAL STATUS.
ALIAS LIST is a CHARACTER LIST representing an alias of MARITAL STATUS.
MARITAL STATUS is a STRING with the full name of a marital status.

Example: '(((#\n #\N) . \"Never Married\") ((#\d #\D) \"Divorced\"))")

(defun main ()
  "Main function of the program."
  (let ((status (get-marital-status)))
    (format t
            "~a~&"
            (marital-status status))))

(defun get-marital-status ()
  "Ask the user to enter the character representing his marital status and
return its value."
  (print "Enter the character representing your marital status: ")
  (read-char))

(defun marital-status (status)
  "Return the marital status corresponding to the passed character."
  (or (block search-status
        (loop for item in *alias-to-marital-status-list* do
          (when (member status (car item))
            (return-from search-status (cdr item)))))
      "Unknown character"))
