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


; 9. (functional)
