#lang racket
(require "parser.rkt")
(require "utils.rkt")
(require "interpreter.rkt")

(define var-scope
  '((a 1) (b 2) (x 5))
  )



(define execute
  (lambda (code)
    (blaaade-interpreter (blaaade-parser code) var-scope)
    )
  )

;(blaaade-interpreter (blaaade-parser '(call (function (x) x) y)) var-scope)
;(execute '(call (function (x) x) (call (function (z) z) 2)))

;(call (function (x) x) a)
;(call (function (x) x) 2) -> 2 numeric expression
;(1 + 1) -> math expression

;(math-exp (num-exp 1) (op +) (num-exp 2))
(execute '(call (function (x + 1) x) a))
;(blaaade-interpreter (blaaade-parser '(1 + 2)) var-scope)