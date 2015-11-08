module Box

import eq
import serialize

data Box t  = mkBox t

unbox: Box t -> t
unbox (mkBox b) = b

instance (eq a) => eq (Box a) where
  eql (mkBox v1) (mkBox v2) = eql v1 v2

instance (serialize a) => serialize (Box a) where
  toString (mkBox v1) = "(" ++ toString v1 ++ ",)"
