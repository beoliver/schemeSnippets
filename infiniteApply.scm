

(define (applicative proc)
  (define (loop state)
    (lambda xs
      (if (null? xs)
        (apply proc state)
        (loop (append xs state)))))
  (loop '()))


44> applicative
#{procedure 9090 applicative}
44> (applicative +)
#{procedure 9092 (unnamed in loop in applicative)}
44> ((applicative +) 1 2 3)
#{procedure 9092 (unnamed in loop in applicative)}
44> (define xs ((applicative +) 1 2 3))
; no values returned
44> xs
#{procedure 9092 (unnamed in loop in applicative)}
44> (xs)
6
44> (xs 4 5 6)
#{procedure 9092 (unnamed in loop in applicative)}
44> (define ys (xs 4 5 6))
; no values returned
44> ys
#{procedure 9092 (unnamed in loop in applicative)}
44> (ys)
21
