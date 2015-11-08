module test

import app
import prac3

u:unit
u = mkUnit

v:unit
v = mkUnit

b1: bool
b1 = true

b2: bool
b2 = true

b3: bool
b3 = false

bt1: bool
bt1 = and true true
---expect true

bt2: bool
bt2 = and true false
---expect false

bt3: bool
bt3 = and false true
---expect false

bt4: bool
bt4 = and false false
---expect false

bt5: bool
bt5 = or false false
---expect false

bt6: bool
bt6 = or false true
---expect true

bt7: bool
bt7 = or true false
---expect true

bt8: bool
bt8 = or true true
---expect true

bt9: bool
bt9 = xor true true
---expect false

bt10: bool
bt10 = xor true false
---expect true

bt11: bool
bt11 = xor false true
---expect true

bt12: bool
bt12 = xor false false
---expect false

bt13: bool
bt13 = nand true true
---expect false

bt14: bool
bt14 = nand true false
---expect true

bt15: bool
bt15 = nand false true
---expect true

bt16: bool
bt16 = nand false false
---expect true

nt1: nat
nt1 = add O (S O)
--- expect S O

nt2: nat
nt2 = add (S(S(S O))) (S O)
--- expect S(S(S(S O)))

nt3: nat
nt3 = mult O (S O)
--- expect O

nt4: nat
nt4 = mult (S(S O)) (S(S(S O)))
--- expect S(S(S(S(S(S O)))))

nt5: nat
nt5 = fact O
--- expect S O

nt6: nat
nt6 = fact (S(S(S O)))
--- expect S(S(S(S(S(S O)))))

nt7: nat
nt7 = sub O (S O)
--- expect O

nt8: nat
nt8 = sub (S O) O
--- expect O

nt9: nat
nt9 = sub (S(S(S O))) (S O)
--- expect S(S O)

nt10: bool
nt10 = le O O
--- expect true

nt11: bool
nt11 = le O (S O)
--- expect true

nt12: bool
nt12 = le (S(S O)) (S O)
--- expect false

nt13: bool
nt13 = le (S(S O)) (S(S(S O)))
--- expect expect true

nt14: nat
nt14 = ex O O
--- expect O

nt15: nat
nt15 = ex (S O) O
--- expect S O

nt16: nat
nt16 = ex (S(S O)) (S(S(S O)))
--- expect S(S(S(S(S(S(S(S O)))))))

nt17: bool
nt17 = eq O O
--- expect true

nt18: bool
nt18 = eq O (S O)
--- expect false

nt19: bool
nt19 = eq (S O) O
--- expect false

nt20: bool
nt20 = eq (S(S O)) (S(S O))
--- expect true

nt21: bool
nt21 = gt O O
--- expect false

nt22: bool
nt22 = gt O (S O)
--- expect false

nt23: bool
nt23 = gt (S O) O
--- expect true

nt24: bool
nt24 = gt (S(S(S O))) (S(S O))
--- expect true

nt25: bool
nt25 = gt O O
--- expect true

nt26: bool
nt26 = gt O (S O)
--- expect false

nt27: bool
nt27 = gt (S O) O
--- expect true

nt28: bool
nt28 = gt (S(S(S O))) (S(S O))
--- expect true

nt29: bool
nt29 = lt O O
--- expect false

nt30: bool
nt30 = lt O (S O)
--- expect true

nt31: bool
nt31 = lt (S O) O
--- expect false

nt32: bool
nt32 = lt (S(S(S O))) (S(S O))
--- expect false

pt1: app.pair bool bool
pt1 = mkPair true false

pt2: app.pair unit bool
pt2 = mkPair mkUnit false

ot1: option bool
ot1 = none

ot2: option bool
ot2 = some true

ltO: list nat
ltO = nil

lt1: list nat
lt1 = O::nil

lt2: list nat
lt2 = (S O)::(S(S O))::nil

lt3: list nat
lt3 = (S O)::(S(S O))::(S(S(S O)))::nil

len_l3: nat
len_l3 = len lt3

lt4: list nat
lt4 = nil ++ nil

lt5: list nat
lt5 = ((S O)::nil) ++ nil

lt6: list nat
lt6 = ((S O)::nil) ++ ((S O)::nil)

lt7: list nat
lt7 = ((S(S O))::(S O)::nil) ++ ((S(S(S(S O))))::nil)

lt8: nat
lt8 = len ((spring)::nil)
--- expecting S O

lt9: list seasons
lt9 =((spring)::nil)++((summer)::nil)
--- expecting cons(spring) (cons(summer) nil
