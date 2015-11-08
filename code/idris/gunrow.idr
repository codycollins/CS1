module gunrow

import list

data country = Argentina | Australia | Austria | Honduras | USA

||| represents a country and the death rates per ten million by gun
||| for homicides, suicides, unintentional, other

data gunrow = mkGunrow country Nat Nat Nat Nat

argen: gunrow
argen = mkGunrow Argentina 190 279 64 362

aus: gunrow
aus = mkGunrow Australia 11 62 5 8

aust: gunrow
aust = mkGunrow Austria 18 268 1 8

hond: gunrow
hond = mkGunrow Honduras 648 0 0 0

usa: gunrow
usa = mkGunrow USA 355 670 16 9

homicidePer10M: gunrow -> Nat
homicidePer10M (mkGunrow c h s u o) = h

suicidePer10M: gunrow -> Nat
suicidePer10M (mkGunrow c h s u o) = s

unintPer10M: gunrow -> Nat
unintPer10M (mkGunrow c h s u o) = u

otherPer10M: gunrow -> Nat
otherPer10M (mkGunrow c h s u o) = o

gunviolence_metrics: list gunrow
gunviolence_metrics = (cons (argen) (cons (aus) ((cons aust) ((cons hond) ((cons usa) nil)))))
