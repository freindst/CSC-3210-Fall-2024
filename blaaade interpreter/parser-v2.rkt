#lang racket
(require "utils.rkt")
(define blaaade-2-parser
  (lambda (code)
    (cond
      ;()
      ((null? code) '())
      ;(1)
      ((number? code) (list 'num-exp code))
      ((symbol? code) (list 'var-exp code))
      ((and (pair? code) (eq? (car code) 'out)) (list 'out-exp (blaaade-2-parser (cadr code))))
      ((and (pair? code) (eq? (car code) 'put) (symbol? (cadr code)) (eq? (caddr code) '=))
       (list 'put-exp (cadr code) (blaaade-2-parser (cadddr code))))
      ((and (pair? code) (eq? (length code) 3) (math-op? (cadr code)))
       (list 'math-exp (cadr code) (blaaade-2-parser (car code)) (blaaade-2-parser (caddr code))))
      ((pair? code)
       (cons (blaaade-2-parser (car code)) (blaaade-2-parser (cdr code))))
      (else (displayln "Unknown syntax error occurs."))
      )
    )
  )

(define math-op?
  (lambda (op)
    (cond
      ((eq? op '+) #t)
      ((eq? op '-) #t)
      ((eq? op '/) #t)
      ((eq? op '*) #t)
      ((eq? op '%) #t)
      (else #f)
      )
    )
  )
      
(provide (all-defined-out))