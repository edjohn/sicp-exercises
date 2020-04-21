;Exercise 1.22
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

;Test cases in the book are computed too fast with modern computers, used these test cases instead:
;n=10*10^9, .11 seconds
;n=10*10^10, .39 seconds
;n=10*10^11, 1.10 seconds
;n=10*10^12, 3.32 seconds
;Results consistent with predicted order of growth O(sqrt(n))
(define (search-for-primes n range)
  (newline)
  (display n)
  (cond ((even? n)
	 (search-for-primes-iter (+ n 1) range 0 (runtime)))
	(else
	  (search-for-primes-iter n range 0 (runtime)))))

(define (search-for-primes-iter n count total-time start-time)
  (cond ((= count 0)
	 (report-prime total-time))
	((prime? n)
	 (search-for-primes-iter 
	   (+ n 2) 
	   (- count 1) 
	   (+ total-time (- (runtime) start-time)) 
	   (runtime)))
	(else
	  (search-for-primes-iter
	    (+ n 2)
	    count
	    (+ total-time (- (runtime) start-time))
	    (runtime)))))
	

