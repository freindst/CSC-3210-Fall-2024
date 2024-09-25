#lang racket
(define bintree?
  (lambda (tree)
    (cond
      ((integer? tree) #t)
      ((and
        (list? tree)
        (eq? (length tree) 3)
        (symbol? (car tree))
        (bintree? (cadr tree))
        (bintree? (caddr tree))
        ) #t
          )
      (else #f)
      )
    )
  )

(bintree? 1)

(bintree? '(a 1 2))

(bintree? '(a (b 2 3) 4))

(bintree? 'a)

(bintree? '(e 1))

(bintree? '(f 1 2 3))