;Exercise 1.11
(define (f-recursive n)
  (cond ((< n 3) n)
	(else (+ (f-recursive (- n 1))
		 (* 2 (f-recursive (- n 2)))
		 (* 3 (f-recursive (- n 3)))))))

(define (f-iterative n)
  (f-iter n 0 1 3))

(define (f-iter n total counter max-count)
  (if (< n 3)
    n
    (if (> counter max-count)
      total
      (f-iter 
	n	
	(+ total (* counter (f-iter (- n counter) 0 1 3)))
	(+ counter 1)
	max-count))))







          
