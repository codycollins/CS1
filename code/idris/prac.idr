module prac

import days
import bool

data pair days bool = mkPair days bool

mon: pair days bool -> bool
mon (mkPair monday true) = true
mon (mkPair monday false) = false
mon (mkPair _ true) = false
mon (mkPair _ false) = false
