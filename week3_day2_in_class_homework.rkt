#lang racket

(define merge
  (lambda (loi1 loi2)
    (cond
      ((null? loi1) loi2)
      ((null? loi2) loi1)
      ((< (car loi1) (car loi2))
       (cons (car loi1) (merge (cdr loi1) loi2)))
      (else (cons (car loi2) (merge loi1 (cdr loi2))))
      )
    )
  )

;(5 8 2 1 3)
;merge (5) + sort(8 2 1 3)
;merge (5) + merge(8 + sort(2 1 3))
;merge (5) + merge(8 + merge(2 + sort(1 3))))
;merge (5) + merge(8 + merge(2 + merge(1) + sort(3)))))))
;insert sort, but keep sorted list on the right
;O(n2)
(define sort
  (lambda (loi)
    (cond
      ((null? loi) '())
      (else (merge (list (car loi)) (sort (cdr loi))))
      )
    )
  )

(define merge/predicate
  (lambda (pred loi1 loi2)
    (cond
      ((null? loi1) loi2)
      ((null? loi2) loi1)
      ((pred (car loi1) (car loi2))
       (cons (car loi1) (merge/predicate pred (cdr loi1) loi2)))
      (else (cons (car loi2) (merge/predicate pred loi1 (cdr loi2))))
      )
    )
  )

(define sort/predicate
  (lambda (pred loi)
    (if (null? loi) '()
        (merge/predicate pred
                         (list (car loi))
                         (sort/predicate pred (cdr loi)))
       )
    )
  )

(define sort/predicate1
  (lambda (pred loi)
    (cond
      ((eq? pred <) (sort loi))
      ((eq? pred >) (reverse (sort loi)))
      (else loi)
      )
    )
  )

(sort/predicate1 < '(2 1 9 3 5 7 10))
