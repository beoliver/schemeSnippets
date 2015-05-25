
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
(1 2 3)

;; we can achieve the same effect by replacing 'eat' with a unnamed lambda function

(define (munch x)
  (define (loop state)
    (lambda (x) 
      (if (eq? x 'vomit)
        (reverse state)
        (loop (cons x state)))))
  ((loop '()) x))

41> munch
#{procedure 9049 munch}
41> (munch 1)
#{procedure 9051 (unnamed in loop in munch)}
41> ((munch 1) 2)
#{procedure 9051 (unnamed in loop in munch)}
41> (((munch 1) 2) 3)
#{procedure 9051 (unnamed in loop in munch)}
41> ((((munch 1) 2) 3) 'vomit)
(1 2 3)
