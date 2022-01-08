(uiop:define-package :lisp-practice/selection-structures/marital-status
  (:documentation
   "Program that asks the user the character (alias) representing his marital
status and shows the complete name.")
  (:use :cl)
  (:import-from :lisp-practice/utils/types
                #:char-list-to-string-alist)
  (:import-from :lisp-practice/utils/get-input
                #:get-marital-status-alias)
  (:export main))
(in-package :lisp-practice/selection-structures/marital-status)

(declaim (type (char-list-to-string-alist)
               *alias-to-marital-status-list*)
         (ftype (function (character) string)
                marital-status-from-alias))

(defvar *alias-to-marital-status-alist*
  '(((#\n #\N) . "Never married")
    ((#\m #\M) . "Married")
    ((#\s #\S) . "Separated")
    ((#\d #\D) . "Divorced")
    ((#\w #\W) . "Widowed"))
  "ALIST of ALIAS LIST to MARITAL STATUS.
ALIAS LIST is a CHARACTER LIST representing an alias of MARITAL STATUS.
MARITAL STATUS is a STRING with the full name of a marital status.")

(defun main ()
  "Main function of the program."
  (let ((alias (get-marital-status-alias)))
    (format t
            "~a~&"
            (marital-status-from-alias alias))))

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
