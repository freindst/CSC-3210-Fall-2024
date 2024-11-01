#lang racket
(require "utils.rkt")
(define blaaade-2-parser
  (lambda (code)
    (cond
      ;()
      ((null? code) '())
      ;(1)
      ((number? code) (list 'num-exp code))
      ((and (pair? code) (eq? (car code) 'out)) (list 'out-exp (blaaade-2-parser (cadr code))))
      ((pair? code)
       (cons (blaaade-2-parser (car code)) (blaaade-2-parser (cdr code))))
      (else (displayln "Unknown syntax error occurs."))
      )
    )
  )

(provide (all-defined-out))