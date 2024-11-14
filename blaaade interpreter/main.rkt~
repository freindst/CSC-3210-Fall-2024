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

(define code '(rough (i = 0) (i < 9) (i + 1) (out i)) )
;parser should know the answers:
;what is an expression?
;what is a list of expression?
(parser code)
;(execute code)
