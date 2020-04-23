;Exercise 1.27
;The fermat-test evaluates to true for every given Carmichael number, running expmod for every a<n
(define (fermat-test n)
  (fermat-test-iter 1 n))

(define (fermat-test-iter a n)
  (cond ((= a n) #t)
    	((= (expmod a n n) a)
	 (fermat-test-iter (+ a 1) n))
	(else #f)))

(define (expmod base exponent m)
  (cond ((= exponent 0) 1)
	((even? exponent)
	 (remainder (square (expmod base (/ exponent 2) m))
		    m))
	(else
	  (remainder (* base (expmod base (- exponent 1) m))
		     m))))


