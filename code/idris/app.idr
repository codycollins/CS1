module app

infixr 7 ::

data unit = mkUnit
data bool = true | false
data nat = O | S nat
data pair a b = mkPair a b
data option t = some t | none
data list a = nil | (::) a (list a)

unit_id: unit -> unit
unit_id mkUnit = mkUnit

and: bool -> bool -> bool
and true true = true
and _ _ = false

or: bool -> bool -> bool
or false false = false
or _ _ = true

xor: bool -> bool -> bool
xor true false = true
xor false true = true
xor _ _ = false

nand: bool -> bool -> bool
nand true true = false
nand _ _ = true

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
oddb O = false
oddb (S O) = true
oddb (S (S n)) = oddb n

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

eq: nat -> nat -> bool
eq O O = true
eq (S n) O = false
eq O (S m) = false
eq (S n) (S m) = eq n m

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

fst: pair a b -> a
fst (mkPair f s) = f

snd: pair a b -> b
snd (mkPair f s) = s

len: list a -> nat
len nil  = O
len (n::l') = S(len l')

||| append as an infix operator ++
(++): list a -> list a -> list a
(++) nil l2 = l2
(++) (h::t) l2 = h::(t++l2)

map: (a -> b) -> list a -> list b
map f nil = nil
map f (h::t) = (f h)::(map f t)

ite: bool -> a -> a -> a
ite true tb fb = tb
ite false tb fb = fb

||| give a list and a predicate on elements
||| return the sublist of elements for which
||| the predicate is true
filter: (a -> bool) -> list a -> list a
filter f nil = nil
filter f (h::t) = ite (f h)
                      (h::(filter f t))
                          (filter f t)
