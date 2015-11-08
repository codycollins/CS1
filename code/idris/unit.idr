module unit

import bool
import eq
import serialize

data unit = mkUnit

unit_id: unit -> unit
unit_id mkUnit = mkUnit

instance eq unit where
  eql u1 u2 = true

instance serialize unit where
  toString u = "()"
