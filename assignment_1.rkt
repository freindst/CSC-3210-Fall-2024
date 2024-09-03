#lang racket
;(duple n x)
;when n is 0, it returns '()
;when n is not 0, it returns (x + (duple (n - 1) x)
(define duple
  (lambda (n x)
    (if (eq? n 0)
        '()
        (cons x (duple (- n 1) x))
        )
    )
  )

;invert
;reverse (a b) to (b a)
;make the first item to be a list,
;concate the second item to the new list
(define reverse
  (lambda (two_item)
    (cons (cadr two_item) (list (car two_item)))
    )
  )
;we will apply reverse on every items on the list
;a list = (first_item + (cdr list))
;(invert list) = (reverse first_item) + (invert (cdr list))
;(invert '()) = '()
(define invert
  (lambda (lst)
    (if (null? lst)
        '()
        (cons (reverse (car lst)) (invert (cdr lst)))
        )
    )
  )

;down lst
;down '(a a a) -> '((a) (a) (a))
(define down
  (lambda (lst)
    (if (null? lst) '()
        (cons (list (car lst)) (down (cdr lst)))
        )
    )
  )