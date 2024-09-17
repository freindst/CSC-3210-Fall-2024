#lang racket
(require "utils.rkt")

;(define var-scope '((x a) (a 1) (b 2) (x 5)))
(define blaaade-interpreter
  (lambda (parsed-code scope)
    (cond
      ((null? parsed-code) (println "blaaade's interpreter found illegal code."))
      ((eq? (car parsed-code) 'var-exp) (resolve-helper (cadr parsed-code) scope))
      ((eq? (car parsed-code) 'app-exp)
       (let
           (
            (local_scope
             (cons (list (cadr (cadr (cadr parsed-code))) (var-exp-helper (caddr parsed-code) scope)) scope))
            )
         (var-exp-helper (cadr (caddr (cadr parsed-code))) local_scope)
         )
       )
      (else (println "blaaade's interpreter found illegal code."))
      )
    )
  )

  ;(var-exp a) resolve the value from the variable expression based on scope
(define var-exp-helper
  (lambda (parsed-code scope)
    (resolve-helper (cadr parsed-code) scope)
    )
  )

(provide (all-defined-out))