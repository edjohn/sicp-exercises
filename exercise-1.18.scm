;Exercise 1.18
(define (fast-mult a n)
  (fast-mult-iter 0 a n))

(define (fast-mult-iter a b n)
  (if (= n 0)
    a
    (if (even? n)
      (fast-mult-iter a (double b) (halve n))
      (fast-mult-iter (+ a b) b (- n 1)))))

(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))
