module dna

import list
import pair
import nat

data base = A | T | C | G

complement_base: base -> base
complement_base A = T
complement_base T = A
complement_base C = G
complement_base G = C

complement_strand: list base -> list base
complement_strand nil = nil
complement_strand (h::t) = map complement_base (h::t)

strand1: list (pair base base) -> list base
strand1 nil = nil
strand1 (h::t) = map fst (h::t)

strand2: list (pair base base) -> list base
strand2 nil = nil
strand2 (h::t) = map snd (h::t)

makebP: base -> pair base base
makebP a = (mkPair a (complement_base a))

complete: list base -> list (pair base base)
complete nil = nil
complete (h::t) = map makebP (h::t)

isBase: base -> base -> nat
isBase A A = S O
isBase T T = S O
isBase C C = S O
isBase G G = S O
isBase _ _ = O

countBase: base -> list base -> nat
countBase a (h::t) = list.foldr add O (map (isBase a) (h::t))
