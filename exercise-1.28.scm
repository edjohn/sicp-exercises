;Exercise 1.28
(define (expmod base exponent m)
  (define (condition-check n)
    (if (and (not (= n 1))
	     (not (= n (- m 1)))
	     (= (remainder (square n) m) 1))
      0
      (remainder (square n) m)))
  (cond ((= exponent 0) 1)
	((even? exponent)
	 (condition-check (expmod base (/ exponent 2) m)))
	(else
	  (remainder (* base (expmod base (- exponent 1) m))
		     m))))

(define (miller-rabin-test n)
  (define (try-it a)
    (expmod a (- n 1) n))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
	((= (miller-rabin-test n) 1) (fast-prime? n (- times 1)))
	(else false)))
