module boolTest

import bool

b1: bool
b1 = true

b2: bool
b2 = true

b3: bool
b3 = false

b4: bool
b4 = not true

b5: bool
b5 = not b1

b6: bool
b6 = not (not b5)

pand_t_t: bool
pand_t_t = pand true true
---expect true

pand_t_f: bool
pand_t_f = pand true false
---expect false

pand_f_t: bool
pand_f_t = pand false true
---expect false

pand_f_f: bool
pand_f_f = pand false false
---expect false

pnand_t_t: bool
pnand_t_t = pnand true true
---expect false

pnand_t_f: bool
pnand_t_f = pnand true false
---expect true

pnand_f_t: bool
pnand_f_t = pnand false true
---expect true

pnand_f_f: bool
pnand_f_f = pnand false false
---expect true

por_t_t: bool
por_t_t = por true true
---expect true

por_t_f: bool
por_t_f = por true false
---expect true

por_f_t: bool
por_f_t = por false true
---expect true

por_f_f: bool
por_f_f = por false false
---expect false

pxor_t_t: bool
pxor_t_t = pxor true true
---expect false

pxor_t_f: bool
pxor_t_f = pxor true false
---expect true

pxor_f_t: bool
pxor_f_t = pxor false true
---expect true

pxor_f_f: bool
pxor_f_f = pxor false false
---expect false

t1: bool
t1 = bool.and true true
---expect true

t2: bool
t2 = bool.and true false
---expect false

t3: bool
t3 = bool.and false true
---expect false

t4: bool
t4 = bool.and false false
---expect false

t5: bool
t5 = or false false
---expect false

t6: bool
t6 = or false true
---expect true

t7: bool
t7 = or true false
---expect true

t8: bool
t8 = or true true
---expect true

t9: bool
t9 = xor true true
---expect false

t10: bool
t10 = xor true false
---expect true

t11: bool
t11 = xor false true
---expect true

t12: bool
t12 = xor false false
---expect false

t13: bool
t13 = nand true true
---expect false

t14: bool
t14 = nand true false
---expect true

t15: bool
t15 = nand false true
---expect true

t16: bool
t16 = nand false false
---expect true
