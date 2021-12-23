;;;; Make a program that asks the user a number of a day of the week and
;;;; returns its name
;;;; Example: 3 = "Wednesday"

(defvar +days-of-the-week+ '("Monday"
                             "Tuesday"
                             "Wednesday"
                             "Thursday"
                             "Friday"
                             "Saturday"
                             "Sunday"))

(defun main ()
  "Main function of the program."
  (let ((number (get-number)))
    (format t
            "It's ~a~&"
            (name-of-nth-day number))))

(defun get-number ()
  "Ask the user to enter a number and return its value."
  (print "Enter a number: ")
  (read))

(defun name-of-nth-day (number)
  "Return the name of the nth day of the week"
  (nth (- number 1) +days-of-the-week+))
