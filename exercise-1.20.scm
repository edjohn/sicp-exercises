;Exercise 1.20

;Normal-Order Evaluation
;Remainder is performed 18 times in normal-order evaluation
(gcd 206 40)

(if (= 40 0)
  206
  (gcd 40 (remainder 206 40)))

(if (= (remainder 206 40) 0);1 time
  40
  (gcd (remainder 206 40) (remainder 40 
				     (remainder 206 40))))

(if (= (remainder 40
		  (remainder 206 40)) 0);2 times
  (remainder 206 40)
  (gcd (remainder 40
		  (remainder 206 40))
       (remainder (remainder 206 40)
		  (remainder 40
			     (remainder 206 40)))))

(if (= (remainder (remainder 206 40)
	       (remainder 40
			  (remainder 206 40))) 0);4 times
  (remainder 40
	     (remainder 206 40))
  (gcd (remainder (remainder 206 40)
		  (remainder 40
			     (remainder 206 40)))
       (remainder (remainder 40
			     (remainder 206 40))
		  (remainder (remainder 206 40)
			     (remainder 40
					(remainder 206 40))))))
(if (= (remainder (remainder 40
			     (remainder 206 40))
		  (remainder (remainder 206 40)
			     (remainder 40
					(remainder 206 40)))) 0);7 times
  (remainder (remainder 206 40)
	     (remainder 40
			(remainder 206 40)))
  (gcd (remainder (remainder 40
			     (remainder 206 40))
		  (remainder (remainder 206 40)
			     (remainder 40
					(remainder 206 40))))
       (remainder (remainder (remainder 206 40)
			     (remainder 40
					(remainder 206 40)))
		  (remainder (remainder 40
					(remainder 206 40))
			     (remainder (remainder 206 40)
					(remainder 40
						   (remainder 206 40))))))

(remainder (remainder 206 40)
	   (remainder 40
		      (remainder 206 40)));4 times

;Applicative-Order Evaluation
;Remainder is performed 4 times in applicative-order evaluation
(gcd 206 40)

(if (= 40 0)
  206
  (gcd 40 (remainder 206 40)));1 time

(if (= 6 0)
  40
  (gcd 6 (remainder 40 6)));1 time

(if (= 4 0)
  6
  (gcd 4 (remainder 6 4)));1 time

(if (= 2 0)
  4
  (gcd 2 (remainder 4 2)));1 time
