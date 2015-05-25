
(define (eater x)
  (define (state-loop xs)
    (define (eat x)
      (if (eq? x 'vomit)
        (reverse xs)
        (state-loop (cons x xs))))
    eat)
  ((state-loop '()) x))

41> eater
#{procedure 9011 eater}
41> (eater 1)
#{procedure 9013 (eat in state-loop in eater)}
41> ((eater 1) 2)
#{procedure 9013 (eat in state-loop in eater)}
41> (((eater 1) 2) 3)
#{procedure 9013 (eat in state-loop in eater)}
41> ((((eater 1) 2) 3) 'vomit)
