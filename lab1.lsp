; team / brigade #1

; 1. take '*' from list (((1 (2 *)) 3) 4) using basic operations (CAR/CDR)
(print (
  cadadr (caar '(((1 (2 *)) 3) 4))
))

; 2. Explain the function and its output (cons nil nil)
(print (
  cons nil nil ; concatenates nil and nil
))

; 3. From atoms (1, 2, 3, nil) make a unique list (1 (2 3))
; a) using only CONS function
(print (
  cons 1 (                          ; 1 U (...)
    cons (cons 2 (cons 3 nil)) nil  ; (2 U (3))
  )
))
; b) using only LIST function
(print (
 list 1 (list 2 3)
))

; 4. using DEFUN define a function that returns a modified entered list according to the task
; in function body you can use only CAR, CDR, CONS, APPEND, LIST, LAST, BUTLAST functions
; test your function on some examples (lists different size)
; TASK: function to swap first and last elements of a list
(defun swap-first-and-last (l) (
  if (null l) nil
  (if (null (cdr l)) l
  (append
    (last l)           ; last element is now the first
    (butlast (cdr l))  ; all elements except first and last are in between
    (list (car l)))    ; first element is now the last
  )
))
(print (swap-first-and-last '(nil)))        ; test with 0 elements
(print (swap-first-and-last '(1)))          ; test with 1 element
(print (swap-first-and-last '(1 2)))        ; test with 2 elements
(print (swap-first-and-last '(1 2 3 4 5)))  ; test with 5 elements
