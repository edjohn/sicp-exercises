;Exercise 1.32
(define (accumulate combiner null-value accumulate-filter term a next b)
  (if (> a b)
    null-value
    (if (accumulate-filter a)
      (combiner (term a)
		(accumulate combiner null-value accumulate-filter term (next a) next b))
      (accumulate combiner null-value accumulate-filter term (next a) next b))))

(define (sum-of-prime-squares a b)
  (define (prime? a)
    (= a (smallest-divisor a)))
  (accumulate sum 0 prime? square a inc b))

(define (product-of-relative-primes n)
  (define (relatively-prime? a)
    (= 1 (greatest-common-divisor a n)))
  (accumulate product 1 relatively-prime? identity 1 inc n))

(define (greatest-common-divisor a b)
  (if (= b 0)
    a
    (greatest-common-divisor b (remainder a b))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square x) (* x x))

(define (sum x y) (+ x y))

(define (product x y) (* x y))

(define (identity x) x)

(define (inc x) (+ x 1))


