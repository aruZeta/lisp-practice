;;;; Make a program that asks the user how much liters of water he has used in
;;;; a month and shows how much he will have to pay keeping in mind depending
;;;; how much each liter of water costs depending on the limits
;;;; Example: 15l = 10l of low price + 5l of medium price

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defun positivep (object)
    "Return T if object is a positive NUMBER or 0.
Otherwise, return NIL."
    (when (numberp object)
      (>= object 0))))

(deftype positive ()
  "Type for objects which must be a positive NUMBER or 0."
  `(satisfies positivep))

(declaim (type (positive) *high-price*))
(declaim (type (positive) *medium-price*))
(declaim (type (positive) *low-price*))

(defvar *high-price* 10
  "INT specifying the price of the liters above the `*high-limit*'.")
(defvar *medium-price* 4
  "INT specifying the price of the liters between the `*medium-limit*' and
`*high-limit*'.")
(defvar *low-price* 1
  "INT specifying the price of the liters between the `*low-limit*' and
`*medium-limit*'.")

(declaim (type (positive) *high-limit*))
(declaim (type (positive) *medium-limit*))
(declaim (type (positive) *low-limit*))

(defvar *high-limit* 20
  "INT specifying the high limit of liters of water consumption.")
(defvar *medium-limit* 10
  "INT specifying the medium limit of liters of water consumption.")
(defvar *low-limit* 0
  "INT specifying the low limit of liters of water consumption.")

(defun main ()
  "Main function of the program."
  (let ((liters (get-liters)))
    (format t
            "You'll have to pay $~a~&"
            (calc-water-bill liters))))

(declaim (ftype (function () positive) get-liters))

(defun get-liters ()
  "Ask the user to enter an amount of liters and return its value."
  (print "Enter how much liters you've used this month: ")
  (read))

(declaim (ftype (function (positive) positive) calc-water-bill))

(defun calc-water-bill (liters)
  "Return the total price of the liters of water used, depending if it above the
high, medium or low limits."
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
  "Return the price of the liters minus `*high-limit*'."
  (* (- liters *high-limit*)
     *high-price*))

(declaim (ftype (function (&optional positive) positive)
                calc-water-bill-medium-limit))

(defun calc-water-bill-medium-limit (&optional liters)
  "Return the price of the liters between `*high-limit*' and `*medium-limit*'.
If an amount of liters is passed, return the price of the liters minus
`*medium-limit*'.
Eg: (being all the variables as default)
(calc-water-bill-medium-limit 15) => 20
(calc-water-bill-medium-limit) => 40"
  (* (- (or liters *high-limit*)
        *medium-limit*)
     *medium-price*))

(declaim (ftype (function (&optional positive) positive)
                calc-water-bill-low-limit))

(defun calc-water-bill-low-limit (&optional liters)
  "Return the price of the liters between `*medium-limit*' and `*low-limit*'.
If an amount of liters is passed, return the price of the liters minus
`*low-limit*'.
Eg: (being all the variables as default)
(calc-water-bill-medium-limit 5) => 5
(calc-water-bill-medium-limit) => 10"
  (* (- (or liters *medium-limit*)
        *low-limit*)
     *low-price*))
