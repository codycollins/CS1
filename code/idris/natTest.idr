module natTest

import nat
import bool

t1: nat
t1 = add O (S O)
--- expect S O

t2: nat
t2 = add (S(S(S O))) (S O)
--- expect S(S(S(S O)))

t3: nat
t3 = mult O (S O)
--- expect O

t4: nat
t4 = mult (S(S O)) (S(S(S O)))
--- expect S(S(S(S(S(S O)))))

t5: nat
t5 = fact O
--- expect S O

t6: nat
t6 = fact (S(S(S O)))
--- expect S(S(S(S(S(S O)))))

t7: nat
t7 = sub O (S O)
--- expect O

t8: nat
t8 = sub (S O) O
--- expect O

t9: nat
t9 = sub (S(S(S O))) (S O)
--- expect S(S O)

t10: bool
t10 = le O O
--- expect true

t11: bool
t11 = le O (S O)
--- expect true

t12: bool
t12 = le (S(S O)) (S O)
--- expect false

t13: bool
t13 = le (S(S O)) (S(S(S O)))
--- expect expect true

t14: nat
t14 = ex O O
--- expect O

t15: nat
t15 = ex (S O) O
--- expect S O

t16: nat
t16 = ex (S(S O)) (S(S(S O)))
--- expect S(S(S(S(S(S(S(S O)))))))

t17: bool
t17 = eq O O
--- expect true

t18: bool
t18 = eq O (S O)
--- expect false

t19: bool
t19 = eq (S O) O
--- expect false

t20: bool
t20 = eq (S(S O)) (S(S O))
--- expect true

t21: bool
t21 = gt O O
--- expect false

t22: bool
t22 = gt O (S O)
--- expect false

t23: bool
t23 = gt (S O) O
--- expect true

t24: bool
t24 = gt (S(S(S O))) (S(S O))
--- expect true

t25: bool
t25 = gt O O
--- expect true

t26: bool
t26 = gt O (S O)
--- expect false

t27: bool
t27 = gt (S O) O
--- expect true

t28: bool
t28 = gt (S(S(S O))) (S(S O))
--- expect true

t29: bool
t29 = lt O O
--- expect false

t30: bool
t30 = lt O (S O)
--- expect true

t31: bool
t31 = lt (S O) O
--- expect false

t32: bool
t32 = lt (S(S(S O))) (S(S O))
--- expect false
