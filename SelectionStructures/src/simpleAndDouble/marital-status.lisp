;;;; Make a program that asks the user the character representing his marital
;;;; status and shows the complete name

(defvar *marital-status-list*
  '(((#\n #\N) . "Never married")
    ((#\m #\M) . "Married")
    ((#\s #\S) . "Separated")
    ((#\d #\D) . "Divorced")
    ((#\w #\W) . "Widowed"))
  "LIST of ALIST with a STRING specifying a marital status to a CHARACTER LIST.
ALIST such (ALIAS LIST . MARITAL STATUS). ALIAS LIST is a CHARACTER LIST
representing an alias of MARITAL STATUS. MARITAL STATUS is a STRING with the
full name of a marital status.

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
  (or
   (block search-status
     (loop for item in *status-list* do
       (when (member status (car item))
         (return-from search-status (cdr item)))))
   "Unknown character"))
