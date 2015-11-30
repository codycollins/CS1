module dict

import set_adt_hw
import ite
import eq
import serialize
import pair
import option
import list

{-Does a dictionary represent a total fnc from keys to values or a
partial fnc?
ANSWER: a dictionary represents a finite partial fnc from values of a
key type to values of a value type. Such a fnc is finite by
definition. It's a function b/c a key can be associated with at most one
value (it's single-valued). And it's partial because no every value of
the key type needs to have an associated value in a dictionary-}

---------------------------------------------------------------------

--SPECIFICATION

{- This dictionary ADT provides: a dict type; an empty dictionary;
fncs to (a) map a key to a value (if any), (b) derive a new dictionary
from an existing one by tuple override, and (c) derive a new
dictionary from an existing one by removing a pair matching a given
key (if any); and overloaded operators for equality (eql) and
serializtaion (toString). -}

----------------------------------------------------------------------

||| Dict data type; abstract (w/o implementation details)
data dict: (k: Type) -> (v: Type) -> Type

emptyDict: dict k v

dict_remove: (eq k) => k -> dict k v -> dict k v

dict_override: (eq k,eq (pair k v)) => k -> v -> dict k v -> dict k v

dict_lookup: (eq k) => k -> dict k v -> option v


dict_eql : (eq k, eq v) => (dict k v) -> (dict k v) -> bool

instance (eq k, eq v) => eq (dict k v) where
  eql d1 d2 = dict_eql d1 d2


dict_toString: (serialize k, serialize v) => (dict k v) -> String

instance (serialize k, serialize v) => serialize (dict k v) where
  toString d = dict_toString d

---------------------------------------------------------------

---IMPLEMENTATION

data dict k v = mkDict (set (pair k v))

---------------------------------------------------------------

emptyDict = mkDict emptySet

matchKey: (eq k) => k -> pair k v -> bool
matchKey k (mkPair k1 p1) = ite (eql k k1) true false

notMatchKey: (eq k) => k -> pair k v -> bool
notMatchKey k p = not (matchKey k p)

dict_remove k (mkDict s) = mkDict (set_filter (notMatchKey k) s)

--dict_override: (eq k,eq (pair k v)) => k -> v -> dict k v -> dict k v
dict_override kv mkDict(emptySet) = mkDict(emptySet)
dict_override k v (mkDict (mkSet(mkPair(k' v'))::t)) = ite matchKey k mkPair(k' v') (mkDict(mkSet(mkPair(k v)::t))) ((mkDict(mkSet k)) ++ (dict_override k v (mkDict (mkSet t))))
