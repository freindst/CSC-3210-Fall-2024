#lang racket
(require "utils.rkt")
(define blaaade-2-interpreter
  (lambda (parsed-code env)
    (cond
      ((null? parsed-code) (displayln "Program ends here."))
      ((eq? 'num-exp (car parsed-code))
       (list (cadr parsed-code) env))
      ((eq? 'var-exp (car parsed-code))
       (list (resolve-env (cadr parsed-code) env) env))
      ((eq? 'out-exp (car parsed-code))
       (displayln (car (blaaade-2-interpreter (cadr parsed-code) env)))
       (list 'null env))
      ((eq? 'put-exp (car parsed-code))
       (if (env-contains-name? (cadr parsed-code) env)
           (list 'null (put-helper (cadr parsed-code) (car (blaaade-2-interpreter (caddr parsed-code) env)) env))
           (displayln "Variable out of scope")))
      ((eq? 'math-exp (car parsed-code))
       (list (math-exp-helper parsed-code env) env))
      (else (let*
                ((export (blaaade-2-interpreter (car parsed-code) env)))
              (blaaade-2-interpreter (cdr parsed-code) (cadr export))))
      )
    )
  )

(define output-exp
  (lambda (export)
    (if (eq? (length export) 3)
        (displayln (get-list-item) 2)
        (displayln "")
        )
    )
  )

(define math-helper
  (lambda (op num1 num2)
    (cond
      ((eq? op '+) (+ num1 num2))
      ((eq? op '-) (- num1 num2))
      ((eq? op '*) (* num1 num2))
      ((eq? op '/) (/ num1 num2))
      ((eq? op '%) (modulo num1 num2))
      (else (println "blaaade do not know this operation"))
      )
    )
  )
;(math-exp (num-exp 1) (op +) (num-exp 2))
(define math-exp-helper
  (lambda (parsed-code env)
    (math-helper (cadr parsed-code)
                 (car (blaaade-2-interpreter (caddr parsed-code) env))
                 (car (blaaade-2-interpreter (cadddr parsed-code) env))
                 )
    )
  )

(provide (all-defined-out))