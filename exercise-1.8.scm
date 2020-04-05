;Exercise 1.8
(define (qbrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (qbrt-iter (improve guess x)
	       x)))

(define (improve guess x)
  (/ 
    (+ 
      (/ x (square guess))
      (* 2 guess))
    3))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001))

(define (qbrt x)
  (qbrt-iter 1.0 x))
