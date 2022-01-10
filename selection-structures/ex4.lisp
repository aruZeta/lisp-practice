(uiop:define-package :lisp-practice/selection-structures/ex4
  (:documentation
   "Program that asks the user a number and the awarded number of a raffle, if
the first or last digit is the same in both, show that the user has been awarded
a refund.")
  (:import-from :lisp-practice/utils/types
                #:positive)
  (:import-from :lisp-practice/utils/get-input
                #:get-positive)
  (:export main))
(in-package :lisp-practice/selection-structures/ex4)

(declaim (ftype (function (positive) positive)
                first-digit
                last-digit)
         (ftype (function (positive positive) boolean)
                first-digit=
                last-digit=))

(defun main ()
  "Main function of the program."
  (let ((number (get-positive "Enter your number: "))
        (awarded (get-positive "Enter the awarded number: ")))
    (format t
            "You have~a been awarded a refund"
            (if (or (first-digit= number awarded)
                    (last-digit= number awarded))
                ""
                "n't"))))

(defun first-digit (n)
  "Return the first digit of N.
N is a POSITIVE."
  (floor n (expt 10 (truncate (log n 10)))))

(defun first-digit= (n1 n2)
  "Return T if the first digit of N1 and N2 are the same. Otherwise, return NIL.
N1 is a POSITIVE.
N2 is a POSITIVE."
  (= (first-digit n1)
     (first-digit n2)))

(defun last-digit (n)
  "Return the last digit of N.
N is a POSITIVE."
  (mod n 10))

(defun last-digit= (n1 n2)
  "Return T if the last digit of N1 and N2 are the same. Otherwise, return NIL.
N1 is a POSITIVE.
N2 is a POSITIVE."
  (= (last-digit n1)
     (last-digit n2)))
