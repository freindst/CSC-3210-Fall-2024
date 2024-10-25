#lang racket
(require "utils.rkt")
(define blaaade-2-interpreter
  (lambda (parsed-code env)
    (cond
      ((eq? (length parsed-code) 1) (display ""))
      ((eq? (car parsed-code) 'var-exp) (var-exp-helper parsed-code env))
      ((eq? (car (cadr parsed-code)) 'put-exp)
       (let ((new-parsed-code (cons (car parsed-code) (cddr parsed-code)))
             (new-env
              (put-helper
               (cadr (cadr (cadr parsed-code)))
               (blaaade-2-interpreter (caddr (cadr parsed-code)) env) env)))
         (blaaade-2-interpreter new-parsed-code new-env)
         ))
      ((eq? (car (cadr parsed-code)) 'out-exp)
       (let ((new-parsed-code (cons (car parsed-code) (cddr parsed-code)))
             (new-env env))
         (displayln (blaaade-2-interpreter (cadr (cadr parsed-code)) env))
         (blaaade-2-interpreter new-parsed-code new-env)))
       )
    )
  )

(provide (all-defined-out))