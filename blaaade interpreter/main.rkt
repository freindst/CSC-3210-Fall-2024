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

;scope
;(department = "cs", subject = "language theory", lesson1 = {deparment: deparment...
;lesson: lesson1

(define code
  '(
    (mike lesson
         (department subject)
         (
          (put (this <- department) = department)
          (put (this <- subject) = subject)
          )
         (
          (talk () (out "we are talk about subject"))
          (displaySubject () (out (this <- subject)))
          )
         )
    (new plt = lesson ("CS" "Language Theory")) ;insert plt into environment
    (call (plt <- displaySubject) ())
    )
  )

(parser code)
;(execute code)

(define code1 '(
                (josh ppp (a) (out a))
                (call ppp (1))
                )
  )
(parser code1)