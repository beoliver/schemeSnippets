
(define (applicative proc)
    (define (loop state)
      (lambda xs
        (if (null? xs)
          (apply proc state)
          (loop (append state xs)))))
    (loop '()))

(define (curry arity proc)
  (define (loop passed arity)
    (lambda args
      (let ((n (- arity (length args)))
            (xs (append passed args)))
        (if (<= n 0) (apply proc xs) (loop xs n)))))
  (loop '() arity))

(define-syntax lambda*
  (syntax-rules ()
    ((fun params body)
      (if (symbol? `params)
        (applicative (lambda params body))
        (curry (length `params) (lambda params body))))))

