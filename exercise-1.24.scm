;Exercise 1.24
;The time needed to test the 12 prime values from exercise 1.22 is nearly instantaneous, even when running fast-prime up to 100 times
;The data reveals a massive increase in performance from the linear growth of the smallest-divisor test to the logarithmic growth of the fermat test
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
	 (remainder (square (expmod base (/ exponent 2) m))
		    m))
	(else
	  (remainder (* base (expmod base (- exponent 1) m))
		     m))))
