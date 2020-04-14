;Exercise 1.17
(define (fast-mult a b)
  (cond ((= b 0) 0)
	((even? b) (fast-mult (double a) (halve b)))
	(else (+ a (fast-mult a (- b 1))))))

(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))
