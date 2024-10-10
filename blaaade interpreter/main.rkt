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

;(wahl-exp (boolean-exp (var-exp a) (op <) (num-exp 10)
;(body-exp (queue-exp (put-exp (var-exp a) (math-exp (var-exp a) (op +)
;(num-exp 1)) (out-exp (var-exp a)))))
(blaaade-parser '(rough (a < 10) 0 (a + 1) (out a)))
;(execute '(wahl (a < 10) (queue (put a = (a + 1)) (out a))))
