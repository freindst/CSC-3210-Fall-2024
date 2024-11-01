#lang racket
(require "utils.rkt")
(require "parser-v2.rkt")
(require "interpreter-v2.rkt")

(define var-env
  '(((a 1) (b 2) (x 5)))
  )

;(define execute
;  (lambda (code)
;    (blaaade-interpreter (blaaade-parser code) var-env)
;    )
;  )

;compiler
;((out-exp (num-exp 1)) ...)
;(num-exp 1)
;(out-exp return-value return-env)
;rest expressions return-value return-env
;out-exp what brings into the out-exp: value and env
(blaaade-2-parser '((out 1)))

;(blaaade-2-interpreter (blaaade-2-parser '(out 1)) var-env)
;1
;2