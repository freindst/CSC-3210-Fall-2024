#lang racket
(define lst '(1 2 3 4 5 6 7))

;length_of list = (length_of list.truncate(1)) + 1
;list_length = (+ 1 (list_legnth (cdr a_list))
;list_legnth = (+ 1 (+ 1 list_length (cdr (cdr a_list)))

;recursion
;0 termination of the recursion
; when list is an empty list, return 0
;1 progressive steps
; when a list is not an empty list return 1 + length(list-1)
(define list_length
  (lambda (a_list)
    (if (null? a_list) 0
        (+ 1 (list_length (cdr a_list)))
     )
    )
  )

(list_length lst)
;list_length(list)
;if list.length == 0
;    return 0
;else
;    return 1 + list_length(cdr list)