module listExample

import list
import player
import pair
import relation

--- a full list of the starting five players
s5: list player
s5 = PG::SG::SF::PF::C::nil

--- a list of back court players
bc: list player
bc = PG::SG::sixthman::nil

--- a list of front court players
fc: list player
fc = SF::PF::C::nil

--- average ppg per starting back court player
ave_ppg_bc: pair Nat Nat
ave_ppg_bc = ave_rel bc starter PPG

--- average ppg per starting front court player
ave_ppg_fc: pair Nat Nat
ave_ppg_fc = ave_rel fc starter PPG

--- total PPG of the starting five
total_ppg: Nat
total_ppg = sum_rel s5 starter PPG

