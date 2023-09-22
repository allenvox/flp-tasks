; team / brigade #1


; 1. are sets equal (predicate)
(defun sets-equalp (set1 set2) (
  cond
    ((and (null set1) (null set2)) t)                ; if both sets are null - they are equal, return true
    ((or (null set1) (null set2)) nil)               ; if one set is null - return nil
    ((member (car set1) set2) (                      ; if set1[0] is in set2
     sets-equalp (cdr set1) (remove (car set1) set2) ; return sets-equal(set1[1..end], set2(without set1[0])
    ))
  (t nil) ; if true - return true, if false - return nil
))
(print (sets-equalp '(3 5 1) '(1 3 5)))


; 4. intersection of two sets (function)
(defun intersect (set1 set2) (
  cond
    ((null set1) nil)                             ; if null - return nil
    ((member (car set1) set2) (                   ; if set1[0] is in set2
      cons (car set1) (intersect (cdr set1) set2) ; return set1[0] + ...
    ))
  (t (intersect (cdr set1) set2))
))
(print (intersect '(1 2 3 4 5) '(4 5 6 7 8)))


; 9. (functional) inserting the '*' symbol before each list element with a certain property
; check the functionality for predicates:
; a) non-negative number (functional argument – lambda expression);
; b) an even number (the functional argument is the name of the built-in predicate evenp).
(defun insert-asterisk (lst predicate)
  (if (null lst) nil                   ; if empty list - return nil
  (if (funcall predicate (car lst)) (  ; if lst[0] for predicate is true
    cons
      (cons '* (cons (car lst) nil))        ; (* lst[0]) +
      (insert-asterisk (cdr lst) predicate) ; ...recursive
  )
  ; if lst[0] for predicate is false - insert as it is
  (cons (car lst) (insert-asterisk (cdr lst) predicate)))
))
(print (insert-asterisk '(1 -2 3 -4 5) (lambda (x) (>= x 0))))
(print (insert-asterisk '(1 2 3 4 5) #'evenp))
