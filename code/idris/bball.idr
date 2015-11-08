module basketball

import list

data position = PG | SG | SF | PF | C
data name = Curry | Thompson | Barnes | Green | Bogut

--- player will have metrics height weight position PPG RPG
data player = mkPlayer name Nat Nat position Double Double

Steph_Curry: player
Steph_Curry = mkPlayer Curry 75 185 PG 23.8 4.3

Klay_Thompson: player
Klay_Thompson = mkPlayer Thompson 79 205 SG 21.7 3.2

Harrison_Barnes: player
Harrison_Barnes = mkPlayer Barnes 80 210 SF 10.1 5.5

Draymond_Green: player
Draymond_Green = mkPlayer Green 79 230 PF 11.7 8.2

Andrew_Bogut: player
Andrew_Bogut = mkPlayer Bogut 84 260 C 6.3 8.1

roster: list player
roster = (cons (Steph_Curry) (cons (Klay_Thompson) (cons (Harrison_Barnes) (cons (Draymond_Green) (cons (Andrew_Bogut) nil)))))
