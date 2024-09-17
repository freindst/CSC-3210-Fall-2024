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

(provide (all-defined-out))