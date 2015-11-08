module player

import bool

||| this record type describes some metrics for the Golden State Warriors starting five
||| metrics include: name number age and points per game

record player where
  constructor mkPlayer
  name: String
  number: Nat
  age: Nat
  PPG: Nat
  ---PPG is rounded up
  starter: bool

PG: player
PG = mkPlayer "Steph Curry" 30 27 24 true

SG: player
SG = mkPlayer "Klay Thompson" 11 25 22 true

SF: player
SF = mkPlayer "Harrison Barnes" 40 23 11 true

PF: player
PF = mkPlayer "Draymond Green" 23 25 12 true

C: player
C = mkPlayer "Andrew Bogut" 12 30 7 true

sixthman: player
sixthman = mkPlayer "Andre Iguodola" 9 31 8 false

