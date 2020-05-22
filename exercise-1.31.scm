;Exercise 1.31
(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* (term a) result))))
  (iter a 1))

(define (product-recur term a next b)
  (if (> a b)
    1
    (* (term a)
       (product-recur term (next a) next b))))

(define (approximate-pi n)
  (*
    (/ (product-iter square 4 add-2 (+ 4 (* 4 n)))
       (product-iter square 3 add-2 (+ 3 (* 4 n))))
    (/ 1 (+ 4 (* 4 n)))
    8.0))

(define (identity x) x)

(define (inc n) (+ n 1))

(define (add-2 n) (+ n 2))

(define (square n) (* n n))

(define (factorial a b)
  (product-recur identity a inc b))
