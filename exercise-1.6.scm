;Exercise 1.6
;new-if enters an infinite recursion loop. This is because Scheme uses applicative-order evaluation.
;"if" is a special form because it does not have to evaluate all of its arguments.
;"new-if" is a function, so it abides by Scheme's evaluation and evaluates every argument.
;With "new-if", even if the predicate passes, the else clause will still be evaluated. This leads to an infinite recursion loop.
