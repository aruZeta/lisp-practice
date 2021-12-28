;;;; Make a program that asks the user a number of a day of the week and
;;;; shows its name
;;;; Example: 3 = "Wednesday"

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defun string-list-p (object)
    "Return T if OBJECT is a LIST containing STRING.
Otherwise, return NIL."
    (when (listp object)
      (every #'stringp object))))

(deftype string-list ()
  "Type for objects which must be a STRING LIST."
  `(satisfies string-list-p))

(declaim (type (string-list) *days-of-the-week*))

(defconstant *days-of-the-week*
  '("Monday"
    "Tuesday"
    "Wednesday"
    "Thursday"
    "Friday"
    "Saturday"
    "Sunday")
  "DAY-OF-THE-WEEK LIST.
DAY-OF-THE-WEEK is a STRING specifying the name of a day of the week.")

(defun main ()
  "Main function of the program."
  (let ((number (get-number)))
    (format t
            "It's ~a~&"
            (name-of-nth-day number))))

(declaim (ftype (function () integer) get-number))

(defun get-number ()
  "Ask the user to enter INTEGER and return its value."
  (print "Enter a number: ")
  (read))

(declaim (ftype (function (integer) string) name-of-nth-day))

(defun name-of-nth-day (number)
  "Return DAY-OF-THE-WEEK from `*days-of-the-week*' corresponding to NUMBER.
DAY-OF-THE-WEEK is a STRING.
NUMBER is a INTEGER.
Note: The first DAY-OF-THE-WEEK stands by 1, not 0."
  (nth (1- number) *days-of-the-week*))
