;Exercise 1.12
(define (pascal row column)
  (cond ((or (= row 1) (= column 1) (= column row)) 1) 
	(else (+ (pascal (- row 1) column)
		 (pascal (- row 1) (- column 1))))))


