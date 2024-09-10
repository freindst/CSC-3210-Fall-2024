#lang racket
;(flatten (a b c)) -> (a b c)
;(flatten ((a) b c)) -> (a b c)
;(flatten ((a (b)) c)) -> (a b c)
;(up ((a (b)) c)) -> (a (b) c)

(define up
  (lambda (slist)
    (cond
      ((null? slist) '())
      ((list? (car slist)) (append (car slist) (up (cdr slist))))
      (else (cons (car slist) (up (cdr slist))))
      )
    )
  )


(define flatten
  (lambda (slist)
    (cond
      ((null? slist) '())
      ((list? (car slist))
       (append (flatten (car slist)) (flatten (cdr slist))))
      (else (cons (car slist) (flatten (cdr slist))))
      )
    )
  )

;assume loi1 and loi2 are both in ascending order
(define merge-predicate
  (lambda (pred loi1 loi2)
    (cond
      ((null? loi1) loi2)
      ((null? loi2) loi1)
      ((pred (car loi1) (car loi2))
       (cons (car loi1) (merge (cdr loi1) loi2)))
      (else
       (cons (car loi2) (merge loi1 (cdr loi2))))
      )
    )
  )

;(every? pred lst)
;(every? number? '(1 2 3)) -> true
;(every? number? '(1 2 a 3)) -> false
;(map number? '(1 2 3)) -> (t t t) -> t
;(map number? '(1 2 a 3)) -> (t t f t) -> f
;(define easy_from_blade (< 3))
(define every? ;based on blade's criteria, it is an easy question
  (lambda (pred lst)
    (cond
      ((null? lst) #t)
      (else (and (pred (car lst)) (every? pred (cdr lst))))
      )
    )
  )

;exists number? '(1 2 a 3)
;(map number  '(1 2 a 3)) -> (t t f t) -> t
(define exists?
  (lambda (pred lst)
    (cond
      ((null? lst) #f)
      (else (or (pred (car lst)) (exists? pred (cdr lst))))
      )
    )
  )

(exists? number? '(1))