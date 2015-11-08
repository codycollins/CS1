module prac3

import bool

data seasons = spring | summer | fall | winter
data leaves = green | red | brown
data pair seasons leaves = mkPair seasons leaves

progression: seasons -> seasons
progression spring = summer
progression summer = fall
progression fall = winter
progression winter = spring

aesthetic: seasons -> leaves
aesthetic fall = red
aesthetic winter = brown
aesthetic _ = green

match: pair seasons leaves -> bool
match (mkPair fall red) = true
match (mkPair fall _) = false
match (mkPair winter brown) = true
match (mkPair winter _) = false
match (mkPair spring green) = true
match (mkPair spring _) = false
match (mkPair summer green) = true
match (mkPair summer _) = false
