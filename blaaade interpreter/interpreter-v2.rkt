#lang racket
(require "utils.rkt")
(define blaaade-2-interpreter
  (lambda (parsed-code env)
    (cond
      ((null? parsed-code) (displayln "program ends"))
      ((eq? 'num-exp (car parsed-code))
       (list (cadr parsed-code) env))
      ((and (pair? parsed-code) (eq? (length parsed-code) 1))
       (output-exp (blaaade-2-interpreter (car parsed-code) env)))
      (else (print ""))
      )
    )
  )

(define output-exp
  (lambda (export)
    (if (eq? (length export) 3)
        (displayln (get-list-item) 2)
        (displayln "")
        )
    )
  )

(provide (all-defined-out))