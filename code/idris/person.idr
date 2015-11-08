module Person

import bool

||| A Person has an age in years, a height in inches,
||| and a gender, true=female, false=male.
record Person where
  constructor mkPerson
  name: String
  age: Nat
  height: Nat
  gender: bool

