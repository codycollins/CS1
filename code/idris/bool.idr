module bool

import serialize

data bool = true | false

id: bool -> bool
id b = b

constFalse: bool -> bool
constFalse _ = false

constTrue: bool -> bool
constTrue _ = true

not: bool -> bool
not true = false
not _ = true

pand: bool -> bool -> bool
pand true = bool.id
pand false = constFalse

por: bool -> bool -> bool
por true = constTrue
por false = bool.id

pxor: bool -> bool -> bool
pxor true = not
pxor false = bool.id

pnand: bool -> bool -> bool
pnand true = not
pnand false = constTrue


--- binary fncs (bool -> bool -> bool), implicit

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

eql_bool: bool -> bool -> bool
eql_bool true true = true
eql_bool true false = false
eql_bool false true = false
eql_bool false false = true

instance serialize bool where
  toString true = "true"
  toString false = "false"
