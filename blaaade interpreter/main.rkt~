#lang racket
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

;a -> 1
;parser: a -> (var-exp a)
;executer: (var-exp a) -> go to var-scope and return 1

(define blaaade-parser
  (lambda (code)
    (cond
      ((symbol? code) (list 'var-exp code))
      (else (println "blaaade's parser is confused"))
      )
    )
  )

(define blaaade-interpreter
  (lambda (parsed-code scope)
    (cond
      ((null? parsed-code) (println "blaaade's interpreter found illegal code."))
      ((eq? (car parsed-code) 'var-exp) (resolve-helper (cadr parsed-code) scope))
      (else (println "blaaade's interpreter found illegal code."))
      )
    )
  )

(define execute
  (lambda (code)
    (blaaade-interpreter (blaaade-parser code) var-scope)
    )
  )

(execute 'y)

;(reverse-parser (blaaade-parser 'a)) -> 'a