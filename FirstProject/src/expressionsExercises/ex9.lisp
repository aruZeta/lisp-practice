;;;; Make a program that asks the user for a number and shows it reversed

(defun main ()
  "Main function of the program."
  (let ((number (get-number)))
    (format t
            "~a reversed: ~a~&"
            number
            (reverse-n number))))

(declaim (ftype (function () integer) get-number))

(defun get-number ()
  "Ask the user to enter a number and return its value."
  (print "Enter a number: ")
  (read))

(defun reverse-n (n)
  "Return the reverse of the number passed."
  (let ((reversed-n 0))
    (loop while (> n 0) do
      (setq reversed-n (+ (* reversed-n 10)
                          (mod n 10))
            n (floor n 10)))
    reversed-n))
