; team / brigade #1


; 1. define a function that puts a char after every non-negative number
; example: list '(-2 -1 0 1), char X -> '(-2 -1 (0 X) (1 X))
(defun insert-char-after-non-negative (lst char) (
  if (null lst) nil (
  if (and (numberp (car lst)) (>= (car lst) 0)) ( ; if element is a number and >= 0
    cons (cons (car lst) (list char)) (insert-char-after-non-negative (cdr lst) char)
  )
  ; if element is not a number or is < 0, put in a list without char
  (cons (car lst) (insert-char-after-non-negative (cdr lst) char))
)))
(print (insert-char-after-non-negative '(-1 d 6 -3 a 0) '*))
(print (insert-char-after-non-negative '(1 2 3 -1 -2 -3) '*))
(print (insert-char-after-non-negative '(a b c d) '*))


; 2. define a function that interleaves lists
; example: '(1 2 3 4) '(a b c) -> '(1 a 2 b 3 c 4) 
(defun interleave-lists (list1 list2) (
  if(null list1) list2
  (if (null list2) list1
  (cons
    (car list1)   ; list1[0]
    (cons
      (car list2) ; list2[0]
      (interleave-lists (cdr list1) (cdr list2)) ; the rest
)))))
(print (interleave-lists '(1 2 3 4 5 6 7 8) '(a s d f)))


; 3. define a function that makes a list of sum of pairs
; example: '(-2 1 0 2) -> '(-2+2 1+0) = '(0 1)
(defun sum-pairs (lst) (
  if (null lst) nil
  (if (null (cdr lst)) lst
  (cons
    (+ (car lst) (car (last lst)))  ; first + last
    (sum-pairs (butlast (cdr lst))) ; sum-pairs of list without first and last
))))
(print (sum-pairs '(1 -2 -3 4 5 6 -7 8 9)))
