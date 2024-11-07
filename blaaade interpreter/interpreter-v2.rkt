#lang racket
(require "utils.rkt")
(define interpreter
  (lambda (parsed-code env)
    (cond
      ((null? parsed-code)
       (list null env)
       )
      ((eq? (car parsed-code) 'num-exp)
       (list (cadr parsed-code) env))
      ((eq? (car parsed-code) 'var-exp)
       (list (var-exp-helper parsed-code env) env))
      ((eq? (car parsed-code) 'out-exp)
       (screen-display
        (get-exp-return (cadr parsed-code) env))
       (list null env))
      ((eq? (car parsed-code) 'post-exp)
       (list null (post-helper
                   (cadr parsed-code)
                   (get-exp-return (caddr parsed-code) env)
                   env)))
      ((eq? (car parsed-code) 'put-exp)
       (list null
             (put-helper
              (cadr parsed-code)
                   (get-exp-return (caddr parsed-code) env)
                   env)))
      ((eq? (car parsed-code) 'math-exp)
       (list (math-exp-helper parsed-code env) env))
      ((eq? (car parsed-code) 'bool-exp)
       (list (boolean-exp-helper parsed-code env) env))
      ((eq? (car parsed-code) 'ask-exp)
       (if (get-exp-return (cadr parsed-code) env)
           (interpreter (caddr parsed-code) env)
           (interpreter (cadddr parsed-code) env)))
      ((eq? (car parsed-code) 'wahl-exp)
       (if (get-exp-return (cadr parsed-code) env)
           (interpreter parsed-code (get-exp-env (caddr parsed-code) env))
           (list null env)))
      (else
       (interpreter (cdr parsed-code)
                         (get-exp-env (car parsed-code) env)))
      )
    )
  )

(define get-exp-return
  (lambda (parsed-exp env)
    (car (interpreter parsed-exp env))
    )
  )

(define get-exp-env
  (lambda (parsed-exp env)
    (cadr (interpreter parsed-exp env))
    )
  )

(define math-exp-helper
  (lambda (parsed-code env)
    (math-helper (cadr (caddr parsed-code))
                 (get-exp-return (cadr parsed-code) env)
                 (get-exp-return (cadddr parsed-code) env)
                 )
    )
  )

(define boolean-exp-helper
  (lambda (parsed-code env)
    (boolean-helper (cadr (caddr parsed-code))
                 (get-exp-return (cadr parsed-code) env)
                 (get-exp-return (cadddr parsed-code) env)
                 )
    )
  )

(provide (all-defined-out))