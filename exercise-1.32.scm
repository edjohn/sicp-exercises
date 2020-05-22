;Exercise 1.32
(define (accumulate-recur combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a)
	      (accumulate-recur combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (combiner (term a) result))))
    (iter a null-value))
