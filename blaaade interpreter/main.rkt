#lang racket
(require "utils.rkt")
(require "parser-v2.rkt")
(require "interpreter-v2.rkt")

(define var-env
  '(((a 1) (b 2) (x 5)))
  )

(define execute
  (lambda (code)
    (interpreter (parser code) var-env)
    )
  )

;for i = 0; i < 10; i++
(define code '(josh square (x y z) (out (x * x))))
;josh-exp (var-exp square) (func-exp ((var-exp x) (var-exp y) (var-exp z)) (parsed-code))
;we will create a new key-value pair in the top-most variable scope
;key = square //function name
;value = (func-exp ((var-exp x) (var-exp y) (var-exp z)) (parsed-code) //function expression
;(parser code)
;(execute code)

(define code1 '(call square (x)))
;(parser code1)
(define code2 '(func-exp ((var-exp x)) (out-exp (math-exp (var-exp x) (op *) (var-exp x))) ((num-exp 5))))
;how?
(interpreter code2 var-env)




