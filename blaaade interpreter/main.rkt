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

(execute '(queue (post c = 3) (put c = 4) (out c)))