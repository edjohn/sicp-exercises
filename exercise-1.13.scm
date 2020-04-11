;Exercise 1.13
(define (raise x n)
  (cond ((= n 0) 1)
	((= n 1) x)
	(else (* x (raise x (- n 1))))))

(define (psi n)
  (raise (/ (- 1 (sqrt 5)) 2) n))

(define (phi n)
  (raise (/ (+ 1 (sqrt 5)) 2) n))

(define (fib n)
  (cond ((= n 0) 0)
	((= n 1) 1)
	(else (+ (fib (- n 1))
		 (fib (- n 2))))))

(define (first-proof n)
  (/ (phi n) (sqrt 5)))
;fib(0) is 0, the closest integer to 0.447...
;fib(1) is 1, the closest integer to 0.773...
;fib(2) is 1, the closest integer to 1.170...
;Holds true for any non-negative n. 

(define (second-proof n)
  (/ (- (phi n) (psi n)) (sqrt 5)))
;fib(0) is 0, equivalent to 0.
;fib(1) is 1, equivalent to 1.
;fib(2) is 1, equivalent to 1.
;Holds true for any non-negative n.
