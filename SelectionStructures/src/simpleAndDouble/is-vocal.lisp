;;;; Make a program that asks the user a character and shows if it is a vocal

(defconstant vocals '(#\a #\e #\i #\o #\u
                      #\A #\E #\I #\O #\U))

(defun main ()
  "Main function of the program."
  (let ((character (get-character)))
    (format t
            "~a is~a a vocal"
            character
            (if (is-vocal-p character)
                ""
                "n't"))))

(defun get-character ()
  "Ask the user to enter a character and return its value."
  (print "Enter a character: ")
  (read-char))

(defun is-vocal-p (character)
  "Return T when the character passed is a vocal. Otherwise, return NIL."
  (when (member character vocals) t))
