#lang racket
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