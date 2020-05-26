;Exercise 1.35
;f(1) = 2.0000
;f(f(1)) = 1.5000
;f(f(f(1))) = 1.6666
;f(f(f(f(1)))) = 1.6024
;f(f(f(f(f(1))))) = 1.6241
;f(f(f(f(f(f(1)))))) = 1.6157
;f(f(f(f(f(f(f(f(1)))))))) = 1.6189
;f(f(f(f(f(f(f(f(f(1))))))))) = 1.6177
;f(f(f(f(f(f(f(f(f(f(1)))))))))) = 1.6182
;f(f(f(f(f(f(f(f(f(f(f(1))))))))))) = 1.6180

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	next
	(try next))))
  (try first-guess))

(define (close-enough? x y)
  (< (abs (- x y)) 0.001))

(define tolerance 0.00001)

(define (compute-golden-ratio x)
  (fixed-point (lambda (x) (+ 1 (/ 1 x)))
	      1.0))
