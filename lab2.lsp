; team / brigade #1

; 1. using DEFUN define a function that puts a char after every non-negative number
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
