#lang racket
;product (a b c) (x y) -> ((a x) (a y) (b x) (b y) (c x) (c y))
;(product-helper a (x y)) -> ((a x) (a y))
(define product-helper
  (lambda (s sos2)
    (if (null? sos2) '()
        (cons (list s (car sos2)) (product-helper s (cdr sos2)))
     )
    )
  )

(define product
  (lambda (sos1 sos2)
    (cond
      ((null? sos2) '())
      ((null? sos1) '())
      (else
       (append (product-helper (car sos1) sos2) (product (cdr sos1) sos2))
       )
      )
    )
  )

;(filter-in number? '(1 a b 5 c 3)) -> '(1 5 3)
(define filter-in
  (lambda (pred lst)
    (cond
      ((null? lst) '())
      ((pred (car lst)) (cons (car lst) (filter-in pred (cdr lst))))
      (else (filter-in pred (cdr lst)))
      )
    )
  )

;(list-index pred lst)
;(list-index number? '(a b c d () 7))
;(list-index number? '()) -> -1
;(list-index number? '(7)) -> 0
;(list-index number? '(() 7) -> 0 + 1 = 1
;(list-index number? '(d () 7) -> 0 + 1 + 1 = 1 + 1 = 2
(define list-index
  (lambda (pred lst)
    (cond
      ((null? lst) #f)
      ((pred (car lst)) 0)
      (else (+ (list-index pred (cdr lst)) 1))
      )
    )
  )

(define list-index-1
  (lambda (pred lst)
    (cond
      ((null? lst) #f)
      ((pred (car lst)) 0)
      ((eq? (list-index-1 pred (cdr lst)) #f) #f)
      (else (+ (list-index-1 pred (cdr lst)) 1))
      )
    )
  )

(define list-index-helper
  (lambda (pos pred lst)
    (cond
      ((null? lst) #f)
      ((pred (car lst)) pos)
      (else 
        (list-index-helper (+ pos 1) pred (cdr lst))
        )
      )
    )
  )

(define list-index-2
 (lambda
     (pred lst)
   (list-index-helper 0 pred lst)
   )
 )

;(count-occurences-helper a '(a b a c a d)) -> 3
;if a == (car slist) (count-occurences-helper a (cdr slist) + 1
;else (count-occurences-helper a (cdr slist)
;(count-occurences-helper a '(b a c a d)) -> 2
(define count-occurences-helper
  (lambda (count s slist)
    (cond
      ((null? slist) count)
      ((list? (car slist)) (+
                           (count-occurences-helper 0 s (car slist))
                           (count-occurences-helper count s (cdr slist))))
      ((eq? s (car slist)) (+ (count-occurences-helper count s (cdr slist)) 1))
      (else (count-occurences-helper count s (cdr slist)))
      )
    )
  )

(define count-occurences
  (lambda (s slist)
    (count-occurences-helper 0 s slist)
    )
  )

(define up
  (lambda (lst)
    (cond
      ((null? lst) '())
      ((list? (car lst)) (append (car lst) (up (cdr lst))))
      (else (cons (car lst) (up (cdr lst))))
      )
    )
  )

