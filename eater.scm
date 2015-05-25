
(define (eater)
  (define (state-loop xs)
    (define (eat x)
      (if (eq? x 'vomit)
        (reverse xs)
        (state-loop (cons x xs))))
    eat)
  (state-loop '()))

40> (eater)
#{procedure 8985 (eat in state-loop in eater)}
40> ((eater) 1)
#{procedure 8985 (eat in state-loop in eater)}
40> (((eater) 1) 2)
#{procedure 8985 (eat in state-loop in eater)}
40> ((((eater) 1) 2) 3)
#{procedure 8985 (eat in state-loop in eater)}
40> (((((eater) 1) 2) 3) 'vomit)
(1 2 3)
