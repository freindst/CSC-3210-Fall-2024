#lang racket
(require "utils.rkt")
(require "parser-v2.rkt")
(require "interpreter-v2.rkt")

(define var-env
  '(((a 1) (b 2) (x 5)))
  )

(define execute
  (lambda (code)
    (blaaade-2-interpreter (blaaade-2-parser code) var-env)
    )
  )

;compiler
;((out-exp (num-exp 1)) ...)
;(num-exp 1)
;(out-exp return-value return-env)
;rest expressions return-value return-env
;out-exp what brings into the out-exp: value and env
(execute '((out 1) (out (2 + 3)) (out b)))

;(blaaade-2-interpreter (blaaade-2-parser '(out 1)) var-env)
;1
;2