;Exercise 1.22
;Test cases in the book are computed too fast with modern computers, used these test cases instead:
;n=10*10^9, .100 seconds
;n=10*10^10, .380 seconds
;n=10*10^11, 1.14 seconds
;n=10*10^12, 3.52 seconds
;Results consistent with predicted order of growth O(sqrt(n))

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

(define (search-for-primes n count)
  (newline)
  (display n)
  (cond ((even? n)
	 (search-for-primes-iter (+ n 1) count (runtime)))
	(else
	  (search-for-primes-iter n count (runtime)))))

(define (search-for-primes-iter n count start-time)
  (cond ((= count 0)
	 (report-prime (- (runtime) start-time)))
	((prime? n)
	 (newline)
	 (display n)
	 (newline)
	 (search-for-primes-iter (+ n 2) (- count 1) start-time))
	(else
	  (search-for-primes-iter (+ n 2) count start-time))))
