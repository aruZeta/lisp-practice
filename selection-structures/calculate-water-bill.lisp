;;;; Make a program that asks the user how much liters of water he has used in
;;;; a month and shows how much he will have to pay keeping in mind depending
;;;; how much each liter of water costs depending on the limits
;;;; Example: 15l = 10l of low price + 5l of medium price

(uiop:define-package :lisp-practice/selection-structures/calculate-water-bill
  (:use :cl)
  (:import-from :lisp-practice/utils/types
                #:positive)
  (:import-from :lisp-practice/utils/get-input
                #:get-liters)
  (:export main))
(in-package :lisp-practice/selection-structures/calculate-water-bill)

(declaim (type (positive) *high-price*))
(declaim (type (positive) *medium-price*))
(declaim (type (positive) *low-price*))

(defvar *high-price* 10
  "PRICE of the LITERS above the `*high-limit*'.
PRICE is a POSITIVE.")
(defvar *medium-price* 4
  "PRICE of the LITERS between the `*medium-limit*' and `*high-limit*'.
PRICE is a POSITIVE.")
(defvar *low-price* 1
  "PRICE of the LITERS between the `*low-limit*' and `*medium-limit*'.
PRICE is a POSITIVE.")

(declaim (type (positive) *high-limit*))
(declaim (type (positive) *medium-limit*))
(declaim (type (positive) *low-limit*))

(defvar *high-limit* 20
  "LIMIT specifying the high-limit of water consumption.
Price of the LITERS consumed after this limit is determined by `*high-price*'.
LIMIT is a POSITIVE.")
(defvar *medium-limit* 10
  "LIMIT specifying the medium-limit of water consumption.
Price of the LITERS consumed between this limit and `*high-limit*' is determined
by `*medium-price*'.
LIMIT is a POSITIVE.")
(defvar *low-limit* 0
  "LIMIT specifying the low-limit of water consumption.
Price of the LITERS consumed between this limit and `*medium-limit*' is
determined by `*low-price*'.
LIMIT is a POSITIVE.")

(defun main ()
  "Main function of the program."
  (let ((liters (get-liters)))
    (format t
            "You'll have to pay $~a~&"
            (calc-water-bill liters))))

(declaim (ftype (function (positive) positive) calc-water-bill))

(defun calc-water-bill (liters)
  "Return the total PRICE of LITERS.
PRICE is a POSITIVE specifying the resulting price.
LITERS is a POSITIVE specifying an amount of liters.

Uses `calc-water-bill-high-limit', `calc-water-bill-medium-limit' and
`calc-water-bill-low-limit' depending on the LIMIT exceeded by LITERS."
  (cond
    ((> liters *high-limit*) (+ (calc-water-bill-low-limit)
                                (calc-water-bill-medium-limit)
                                (calc-water-bill-high-limit liters)))
    ((> liters *medium-limit*) (+ (calc-water-bill-low-limit)
                                  (calc-water-bill-medium-limit liters)))
    (t (calc-water-bill-low-limit liters))))

(declaim (ftype (function (positive) positive)
                calc-water-bill-high-limit))

(defun calc-water-bill-high-limit (liters)
  "Return PRICE of LITERS minus `*high-limit*'.
PRICE is a POSITIVE specifying the resulting price.
LITERS is a POSITIVE specifying an amount of liters."
  (* (- liters *high-limit*)
     *high-price*))

(declaim (ftype (function (&optional positive) positive)
                calc-water-bill-medium-limit))

(defun calc-water-bill-medium-limit (&optional liters)
  "Return PRICE of `*high-limit*' minus `*medium-limit*'.
Otherwise, if LITERS is passed, return PRICE of LITERS minus `*medium-limit*'.
PRICE is a POSITIVE specifying the resulting price.
LITERS is a POSITIVE specifying an amount of liters.

Eg: (being all the variables as default)
(calc-water-bill-medium-limit 15) => 20
(calc-water-bill-medium-limit) => 40"
  (* (- (or liters *high-limit*)
        *medium-limit*)
     *medium-price*))

(declaim (ftype (function (&optional positive) positive)
                calc-water-bill-low-limit))

(defun calc-water-bill-low-limit (&optional liters)
  "Return PRICE of `*medium-limit*' minus `*low-limit*'.
Otherwise, if LITERS is passed, return PRICE of LITERS minus `*low-limit*'.
PRICE is a POSITIVE specifying the resulting price.
LITERS is a POSITIVE specifying an amount of liters.

Eg: (being all the variables as default)
(calc-water-bill-medium-limit 5) => 5
(calc-water-bill-medium-limit) => 10"
  (* (- (or liters *medium-limit*)
        *low-limit*)
     *low-price*))
