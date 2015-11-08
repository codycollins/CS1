module setTest

import list
import set
import nat
import eq

s0: set nat
s0 = new_set

s1: set nat
s1 = set_insert (S O) s0

s2: set nat
s2 = set_insert (S O) s1

s3: set nat
s3 = set_insert (S (S O)) s2

s4: bool
s4 = eql_set s0 s1

s5: bool
s5 = eql s3 s2

s6: bool
s6 = eql s0 new_set
