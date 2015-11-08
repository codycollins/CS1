module eq

import public bool

class eq a where
  eql : a -> a -> bool

instance eq bool where
  eql b1 b2 = eql_bool b1 b2
