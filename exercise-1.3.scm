;Exercise 1.3
(define (square x) (* x x))
(define (sos x y z) (+ (square x) (square y) (square z)))
(define (smallest x y z)
  (cond ((or (<= x y z) (<= x z y)) x)
  	((or (<= y x z) (<= y z x)) y)
  	((or (<= z x y) (<= z y x)) z)))
(define (sos-larger x y z) (- (sos x y z) (square (smallest x y z))))
