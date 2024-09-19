#lang racket
(require "parser.rkt")
;blaaade
(define var-scope
  '((a 1) (b 2) (x 5))
  )

(define resolve-helper
  (lambda (varname scope)
    (cond
      ((null? scope) (println "blaaade cannot find the variable"))
      ((eq? (car (car scope)) varname) (cadr (car scope)))
      (else (resolve-helper varname (cdr scope)))
      )
    )
  )

(define resolve
  (lambda (varname)
    (resolve-helper varname var-scope)
    )
  )

;how to support make y = 10?
;(define assign-helper
;  (lambda (varname value scope)
;    (cond
;      ((null? scope) (set! scope (list (list varname value))))
;      ((eq (caar scope) varname) (set! scope (cons (list varname value) (cdr scope))))
;      (else (assign-helper varname value (cdr scope)))
;      )
;    )
;  )

(define reverse-parser
  (lambda (parsed-code)
    (cond
      ((null? parsed-code) '())
      ((list? (car parsed-code)) (cons (reverse-parser (car parsed-code)) (reverse-parser (cdr parsed-code))))
      ((eq? (car parsed-code) 'app-exp)
       (append (list 'call (reverse-parser (cadr parsed-code)))
               (reverse-parser (caddr parsed-code))))
      ((eq? (car parsed-code) 'func-exp)
       (append (list 'function (list (cadr (cadr parsed-code)))) (reverse-parser (cadr (caddr parsed-code)))
               ))
      ((eq? (car parsed-code) 'body-exp) (reverse-parser (cdr parsed-code)))
      ((eq? (car parsed-code) 'var-exp) (reverse-parser (cdr parsed-code)))
      ((eq? (car parsed-code) 'num-exp) (reverse-parser (cdr parsed-code)))
      (else (cons (car parsed-code) (reverse-parser (cdr parsed-code))))
      )
    )
  )

(reverse-parser (blaaade-parser '(call (function (x) x) 8)))