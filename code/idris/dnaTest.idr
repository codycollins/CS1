module dnaTest

import dna
import list
import pair
import nat

compbtA: base
compbtA = complement_base A

compbtT: base
compbtT = complement_base T

compbtC: base
compbtC = complement_base C

compbtG: base
compbtG = complement_base G

compst1: list base
compst1 = complement_strand (A::T::C::G::nil)
--- expect (T::A::G::C::nil)

s1t1: list base
s1t1 = strand1 ((mkPair A T)::(mkPair T A)::(mkPair C G)::(mkPair G C)::nil)
--- expect (A::T::C::G::nil)

s2t1: list base
s2t1 = strand2 ((mkPair A T)::(mkPair T A)::(mkPair C G)::(mkPair G C)::nil)
--- expect (T::A::G::C::nil)

completet1: list (pair base base)
completet1 = complete (A::T::C::G::nil)
---expect (mkPair A T)::(mkPair T A)::(mkPair C G)::(mkPair G C)::nil

countAt1: nat
countAt1 = countBase A (A::G::A::C::A::nil)
---expect S(S(S O))
