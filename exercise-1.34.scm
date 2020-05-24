;Exercise 1.34
(define (f g)
  (g 2))

(f square)
;4

(f (lambda (z) (* z (+ z 1))))
;6

;(f f)
;(f 2)
;(2 2)
;The interpreter evaluates (2 2), which cannot be evaluated since 2 isn't an applicable procedure.
