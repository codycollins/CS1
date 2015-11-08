module colors

import bool
import pair

data colors =  red | green | blue | cyan | magenta | yellow

complement: colors -> colors
complement red = cyan
complement green = magenta
complement blue = yellow
complement cyan = red
complement magenta = green
complement yellow = blue

additive: colors -> bool
additive red = true
additive green = true
additive blue = true
additive _ = false

subtractive: colors -> bool
subtractive c = not (additive c)

complements: pair colors colors -> bool
complements (mkPair red cyan) = true
complements (mkPair red _) = false
complements (mkPair green magenta) = true
complements (mkPair green _) = false
complements (mkPair blue yellow) = true
complements (mkPair blue _) = false
complements (mkPair cyan red) = true
complements (mkPair cyan _) = false
complements (mkPair magenta green) = true
complements (mkPair magenta _) = false
complements (mkPair yellow blue) = true
complements (mkPair yellow _) = false

mixink: pair colors colors -> colors
mixink (mkPair cyan magenta) = blue
mixink (mkPair cyan yellow) = green
mixink (mkPair magenta cyan) = blue
mixink (mkPair magenta yellow) = red
mixink (mkPair yellow cyan) = green
mixink (mkPair yellow magenta) = red
