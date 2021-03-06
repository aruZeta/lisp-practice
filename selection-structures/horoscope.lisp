(uiop:define-package :lisp-practice/selection-structures/horoscope
  (:documentation
   "Program that asks the user a date and shows the associated zodiac sign.")
  (:use :cl)
  (:import-from :lisp-practice/utils/types
                #:int-to-string-alist
                #:day
                #:month)
  (:import-from :lisp-practice/utils/get-input
                #:get-date)
  (:export main))
(in-package :lisp-practice/selection-structures/horoscope)

(declaim (type (int-to-string-alist)
               +zodiac-signs+)
         (ftype (function (day month) string)
                associated-zodiac-sign))

(defconstant +zodiac-signs+ '((20 . "Aquarius")
                              (19 . "Pisces")
                              (21 . "Aries")
                              (20 . "Taurus")
                              (21 . "Gemini")
                              (21 . "Cancer")
                              (23 . "Leo")
                              (23 . "Virgo")
                              (23 . "Libra")
                              (23 . "Scorpio")
                              (22 . "Sagittarius")
                              (22 . "Capricorn"))
  "ALIST of DAY to ZODIAC-SIGN.
DAY is a INTEGER specifying the day where the association to ZODIAC-SIGN starts.
ZODIAC-SIGN is a STRING specifying the name of a zodiac sign.
Note: the list is ordered by the month the ZODIAC-SIGN is associated to, so
there is no need to store the month too.")

(defun main ()
  "Main function of the program."
  (let ((date (get-date "Enter a day: " nil "Enter a month: " nil)))
    (format t
            "The zodiac sign associated to that date is: ~a~&"
            (associated-zodiac-sign (car date) (nth 1 date)))))

(defun associated-zodiac-sign (day month)
  "Return ZODIAC-SIGN associated to DAY and MONTH.
ZODIAC-SIGN is a STRING.
DAY is a DAY.
MONTH is a MONTH."
  (let* ((pos (1- month))
         (actual-sign (nth pos +zodiac-signs+)))
    (if (>= day (car actual-sign))
        (cdr actual-sign)
        (cdr (nth (if (zerop pos)
                      11
                      (1- pos))
                  +zodiac-signs+)))))
