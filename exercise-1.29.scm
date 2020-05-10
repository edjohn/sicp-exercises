;Exercise 1.29
(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (s-integral f a b n)
  (define h (/ (- b a) n))
  (define (add-2h x) (+ x h h))
  (* (+ (f a)
	(* 4.0 (sum f (+ a h) add-2h (- b h)))
	(* 2.0 (sum f (+ a h h) add-2h (- b h)))
	(f b))
     (/ h 3.0)))

