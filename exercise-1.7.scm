;Exercise 1.7
;For very small numbers, good-enough fails because it is not precise enough.
;E.g. 1.0*10^-3
;For very large numbers, good-enough fails because it recurses infinitely.
;E.g. 1.0*10^14
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x)
	       x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess)) (* guess 0.001))) 

(define (sqrt x)
  (sqrt-iter 1.0 x))
;This square root procedure works better for small and large numbers.
