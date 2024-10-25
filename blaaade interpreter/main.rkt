#lang racket
(require "parser.rkt")
(require "utils.rkt")
(require "interpreter.rkt")
(require "interpreter-v2.rkt")

(define var-env
  '(((a 1) (b 2) (x 5)))
  )

(define execute
  (lambda (code)
    (blaaade-interpreter (blaaade-parser code) var-env)
    )
  )

;(execute '(rough a 1 (a < 20) (a + 1) (queue (put a = (a + 1)) (out a))))
(blaaade-parser '(queue (put a = 3) (out a)))

(blaaade-2-interpreter (blaaade-parser '(queue (put a = 3) (out a))) var-env)
;(queue (post a = 1) (ask (a < 20) ((put a = (a + 1)) (out a))) (rough-continue a 1 (a < 20) (a + 1)
; (queue (put a = (a + 1)) (out a))))
;whenever we are building the loop, we should treat it as push new statement to queue
;for(int a = 1; a < 20; a = a + 1)
;{
;  a = a + 1;
;  print(a);
;}
;initial rough declare a in the environment
;following rough update a only
;a = 0, output a
;a = a + 1, output a
;a = a + 1, output a
;..repeat 10 times