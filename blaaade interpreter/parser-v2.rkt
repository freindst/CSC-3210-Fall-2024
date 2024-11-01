#lang racket
(require "utils.rkt")
(define blaaade-2-parser
  (lambda (code)
    (cond
      ;()
      ((null? code) '())
      ;(1)
      ((and (pair? code) (eq? (length code) 1) (number? (car code)))
       (list 'num-exp (car code)))
      ;(out (1))
      ((and (pair? code) (eq? (car code) 'out))
       (list 'out-exp (blaaade-2-parser (cadr code))))
      ;((1) (2))
      ((pair? (car code))
       (cons
        (blaaade-2-parser (car code))
        (blaaade-2-parser (cdr code))))
      (else (displayln "Unknown syntax error occurs."))
      )
    )
  )

(provide (all-defined-out))