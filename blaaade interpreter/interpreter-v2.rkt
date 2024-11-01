#lang racket
(require "utils.rkt")
(define blaaade-2-interpreter
  (lambda (parsed-code env)
    (cond
      ((null? parsed-code) (displayln "program ends"))
      ((eq? (car parsed-code) 'num-exp)
       (list (list 'return-value (cadr parsed-code))
             (list 'return-env env))
         )
      (else (print ""))
      )
    )
  )

(provide (all-defined-out))