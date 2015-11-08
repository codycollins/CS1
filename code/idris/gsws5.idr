module gsws5

import list

||| this record type describes some metrics for the Golden State Warriors starting five
||| metrics include: name number age and points per game

record player where
  constructor mkPlayer
  name: String
  number: Nat
  age: Nat
  PPG: Double

PG: player
PG = mkPlayer "Steph Curry" 30 27 23.8

SG: player
SG = mkPlayer "Klay Thompson" 11 25 21.7

SF: player
SF = mkPlayer "Harrison Barnes" 40 23 10.1

PF: player
PF = mkPlayer "Draymond Green" 23 25 11.7

C: player
C = mkPlayer "Andrew Bogut" 12 30 6.3
