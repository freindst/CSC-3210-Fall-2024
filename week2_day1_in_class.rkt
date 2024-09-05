#lang racket
;(append '(1 2 3) '(a b c))

(define append_naive
  (lambda (list_a list_b)
    (cond
      ((null? list_a) list_b)
      (else (append_naive (cdr list_a) (cons (car list_a) list_b)))
      )
    )
  )

(define append_aiden
  (lambda (list_a list_b holder)
    (cond
      ((and (null? list_a) (null? list_b)) holder)
      ((not (null? list_a))
       (append_aiden (cdr list_a) list_b (cons (car list_a) holder)))
      (else (append_aiden list_a (cdr list_b) (cons (car list_b) holder)))
      )
    )
  )

(define append_aiden_working
  (lambda (list_a list_b)
    (reverse (append_aiden list_a list_b '()))
    )
  )
;(append_aiden_working '(1 2 3) '(a b c))

(define invert
  (lambda (lst)
    (map
     reverse
     lst)
    )
  )

(define down
  (lambda (lst)
    (map
     (lambda (item)
       (list item)
       )
     lst
     )
    )
  )

;(swapper 'a 'b '(a b c d c b a)) -> '(b a c d c a b)

(define swapper
  (lambda (s1 s2 slist)
    (cond
      ((null? slist) '())
      ((eq? s1 (car slist)) (cons s2 (swapper s1 s2 (cdr slist))))
      ((eq? s2 (car slist)) (cons s1 (swapper s1 s2 (cdr slist))))
      (else (cons (car slist) (swapper s1 s2 (cdr slist))))
      )
    )
  )


(define list-set
  (lambda
      (lst n x)
    (cond
      ((null? lst) '())
      ((eq? n 0) (cons x (cdr lst)))
      (else (cons (car lst) (list-set (cdr lst) (- n 1) x)))
      )
    )
  )

(list-set '() 0 'a)
