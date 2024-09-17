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
(execute '(call (function (x) x) b))
;int state(x){
;return x;
;}
;a = 1;
;state(a);

;a;