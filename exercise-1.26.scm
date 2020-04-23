;Exercise 1.26
;The process increases in order of growth from O(logn) to O(n) because the new procedure has to compute expmod twice and multiply them together
;By using the square procedure, expmod is only computed once and multiplied by itself, which is computed much faster

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 100)
    (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (fast-prime? n times)
  (cond ((= times 0) true)
	((fermat-test n) (fast-prime? n (- times 1)))
	(else false)))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (expmod base exponent m)
  (cond ((= exponent 0) 1)
	((even? exponent)
	 (remainder (* (expmod base (/ exponent 2) m)
		       (expmod base (/ exponent 2) m))
		    m))
	(else
	  (remainder (* base (expmod base (- exponent 1) m))
		     m))))
