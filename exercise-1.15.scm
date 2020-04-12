;Exercise 1.15
(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1)
	   angle
	   (p (sine (/ angle 3.0))))))
;p is applied 5 times when (sine 12.15) is evaluated
;Requires O(log(a)) space
;Requires O(log(a)) steps





