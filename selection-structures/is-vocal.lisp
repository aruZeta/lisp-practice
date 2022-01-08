(uiop:define-package :lisp-practice/selection-structures/is-vocal
  (:documentation
   "Program that asks the user a character and shows if it is a vocal.")
  (:use :cl)
  (:import-from :lisp-practice/utils/types
                #:char-list)
  (:import-from :lisp-practice/utils/get-input
                #:get-character)
  (:export main))
(in-package :lisp-practice/selection-structures/is-vocal)

(declaim (type (char-list)
               +vocals+)
         (ftype (function (character) boolean)
                vocalp))

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

(defun vocalp (char)
  "Return T when CHARACTER appears in `+vocals+'.
Otherwise, return NIL."
  (when (member char +vocals+) t))
