module listTest

import list
import prac3
import nat
import eq

lO: list nat
lO = nil

l1: list nat
l1 = O::nil

l2: list nat
l2 = (S O)::(S(S O))::nil

l3: list nat
l3 = (S O)::(S(S O))::(S(S(S O)))::nil

len_l3: nat
len_l3 = len l3

t1: list nat
t1 = append nil nil

t2: list nat
t2 = append ((S O)::nil) nil

t3: list nat
t3 = append ((S O)::nil) ((S O)::nil)

t4: list nat
t4 = append ((S(S O))::(S O)::nil) ((S(S(S(S O))))::nil)

t5: nat
t5 = len ((spring)::nil)
--- expecting S O

t6: list seasons
t6 = append ((spring)::nil) ((summer)::nil)
--- expecting cons(spring) (cons(summer) nil

mt1: list bool
mt1 = map evenb (O::(S O)::(S(S O))::(S(S(S(S O))))::nil)

ft1: list nat
ft1 = filter evenb (O::(S O)::(S(S O))::(S(S(S(S O))))::nil)

isThree: bool
isThree = (member (S(S(S O))) l2)
