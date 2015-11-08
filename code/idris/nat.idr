module nat

import bool
import eq
import serialize

data nat = O | S nat

isZero: nat -> bool
isZero O = true
isZero _ = false

succ: nat -> nat
succ n = S n

pred: nat -> nat
pred O = O
pred (S n) = n

evenb: nat -> bool
evenb O = true
evenb (S O) = false
evenb (S (S n)) = evenb n

oddb: nat -> bool
oddb n = not (evenb n)

add: nat -> nat -> nat
add O m = m
add (S n) m = S(add n m)

mult: nat -> nat -> nat
mult O m = O
mult (S n) m = add (mult n m) m

fact: nat -> nat
fact O = (S O)
fact (S n') = mult (S n') (fact n')

sub: nat -> nat -> nat
sub O m = O
sub n O = n
sub (S n) (S m) = sub n m

le: nat -> nat -> bool
le O m = true
le (S n) O = false
le (S n) (S m) = le n m

ex: nat -> nat -> nat
ex O b = O
ex a O = S O
ex a (S b) = mult (ex a b) a
ex (S a) b = mult (ex a b) (S O)

eq_nat: nat -> nat -> bool
eq_nat O O = true
eq_nat (S n) O = false
eq_nat O (S m) = false
eq_nat (S n) (S m) = eq_nat n m

gt: nat -> nat -> bool
gt O O = false
gt O m = false
gt n O = true
gt (S n) (S m) = gt n m

ge: nat -> nat -> bool
ge O O = true
ge O m = false
ge (S n) O = true
ge (S n) (S m) = ge n m

lt: nat -> nat -> bool
lt O O = false
lt O m = true
lt n O = false
lt (S n) (S m) = lt n m

instance eq nat where
  eql n1 n2 = eq_nat n1 n2

instance serialize nat where
  toString O = "Z"
  toString (S n) = "s" ++ toString n
