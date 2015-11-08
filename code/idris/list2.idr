module list_nat

import nat

data list_nat = nil | cons nat list_nat

lO: list_nat
lO = nil

l1: list_nat
l1 = cons O nil

l2: list_nat
l2 = (cons (S O) (cons (S(S O)) nil))

l3: list_nat
l3 = (cons (S O) (cons (S(S O)) (cons (S(S(S O))) nil)))

len: list_nat -> nat
len nil  = O
len (cons n l') = S(len l')

len_l3: nat
len_l3 = len l3
