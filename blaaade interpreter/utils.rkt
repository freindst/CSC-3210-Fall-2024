#lang racket

(define resolve-helper
  (lambda (varname scope)
    (cond
      ((null? scope) (println "blaaade cannot find the variable"))
      ((eq? (car (car scope)) varname) (cadr (car scope)))
      (else (resolve-helper varname (cdr scope)))
      )
    )
  )

(define resolve-scope
  (lambda (varname scope)
    (cond
      ((null? scope) (println "blaaade cannot find the variable"))
      ((eq? (car (car scope)) varname) (cadr (car scope)))
      (else (resolve-scope varname (cdr scope)))
      )
    )
  )

;return true if the scope has the variable name, otherwise return false
(define scope-contains-name?
  (lambda (varname scope)
    (
     cond
      ((null? scope) #f)
      ((eq? (car (car scope)) varname) #t)
      (else (scope-contains-name? varname (cdr scope)))
      )
    )
  )

(define resolve-env
  (lambda (varname env)
    (cond
      ((null? env) (println "no such variable in the environment."))
      ((scope-contains-name? varname (car env)) (resolve-scope varname (car env)))
      (else (resolve-env varname (cdr env)))
      )
    )
  )

(provide (all-defined-out))