;;;; Make a program that asks the user a character and shows if it is a vocal

(uiop:define-package :lisp-practice/selection-structures/is-vocal
  (:use :cl)
  (:export main))
(in-package :lisp-practice/selection-structures/is-vocal)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defun char-list-p (object)
    "Return T if OBJECT is a LIST containing CHARACTER.
Otherwise, return NIL."
    (when (listp object)
      (every #'characterp object))))

(deftype char-list ()
  "Type for objects which must be a CHARACTER LIST."
  `(satisfies char-list-p))

(declaim (type (char-list) +vocals+))

(defconstant +vocals+ '(#\a #\e #\i #\o #\u
                        #\A #\E #\I #\O #\U)
  "CHARACTER LIST specifying all the vocals.")

(defun main ()
  "Main function of the program."
  (let ((character (get-character)))
    (format t
            "~a is~a a vocal"
            character
            (if (vocalp character)
                ""
                "n't"))))

(declaim (ftype (function () character) get-character))

(defun get-character ()
  "Ask the user to enter CHARACTER and return its value."
  (print "Enter a character: ")
  (read-char))

(declaim (ftype (function (character) boolean) vocalp))

(defun vocalp (char)
  "Return T when CHARACTER appears in `+vocals+'.
Otherwise, return NIL."
  (when (member char +vocals+) t))
