#lang racket
(require "parser.rkt")
(require "utils.rkt")
(require "interpreter.rkt")

(define var-env
  '(((a 1) (b 2) (x 5)))
  )

(define execute
  (lambda (code)
    (blaaade-interpreter (blaaade-parser code) var-env)
    )
  )

;(execute '(call (function (x) (x == 1)) a))

;(blaaade-interpreter (blaaade-parser '(1 + 2)) var-scope)
;(blaaade-parser (x == 1)) -> (boolean-exp (var-exp x) (op ==) (num-exp 1)

;(ask (a == 1) b x) -> (ask-exp (boolean-exp (var-exp a) (op ==) (num-exp 1))
; (true-exp (var-exp b))
; (false-exp (var-exp x))