module set_adt_Test

import bool
import option
import pair
import list
import nat
import eq
import serialize
import list
import ite
import set_adt_hw

isEmpty_test: bool
isEmpty_test = isEmpty (mkSet nil)

set_insert_test: set nat
set_insert_test = set_insert O (mkSet ((S O)::nil))
--expecting mkSet ((S O)::O::nil)

set_remove_test: set nat
set_remove_test = set_remove O (mkSet ((S O)::O::nil))
--expecting mkSet ((S O)::nil)

set_cardinality_test: nat
set_cardinality_test = set_cardinality (mkSet ((S O)::O::nil))
--expecting S(S O)

set_member_test: bool
set_member_test = set_member O (mkSet ((S(S O))::(S O)::O::nil))
--expecting true

set_member_test2: bool
set_member_test2 = set_member O (mkSet ((S(S O))::(S O)::nil))
--expecting false

set_union_test: set nat
set_union_test = set_union (mkSet ((S(S(S(S O))))::(S(S(S O)))::(S(S O))::nil)) (mkSet (S(S(S O))::(S(S O))::(S O)::O::nil))
--expecting (mkSet ((S(S(S(S O))))::(S(S(S O)))::(S(S O))::(S O)::O::nil))

set_intersection_test: set nat
set_intersection_test = set_intersection (mkSet ((S(S(S(S O))))::(S(S(S O)))::(S(S O))::nil)) (mkSet (S(S(S O))::(S(S O))::(S O)::O::nil))
--expecting (mkSet (S(S(S O)))::(S(S O)::nil))

set_difference_test: set nat
set_difference_test = set_difference (mkSet ((S(S(S O)))::(S(S O))::(S O)::O::nil)) (mkSet ((S(S(S O)))::(S(S O))::nil))
--expecting (mkSet ((S O)::O::nil))

set_forall_test: bool
set_forall_test = set_forall evenb (mkSet (S(S O)::O::nil))
--expecting true

set_forall_test2: bool
set_forall_test2 = set_forall evenb (mkSet (S(S(S O))::(S(S O))::O::nil))
--expecting false

set_exists_test: bool
set_exists_test = set_exists evenb (mkSet ((S O)::O::nil))
--expecting true

set_exists_test2: bool
set_exists_test2 = set_exists evenb (mkSet ((S O)::nil))
--expecting false

--set_witness_test: option nat
--set_witness_test = set_witness evenb mkSet(O::(S(S(S O)))::(S O)::nil)
--expecting O

set_product_test: set (pair nat nat)
set_product_test = set_product (mkSet ((S O)::O::nil)) (mkSet ((S O)::O::nil))
--expecting (mkSet (mkPair (S O) (S O) :: mkPair (S O) O :: mkPair O (S O) :: mkPair O O :: nil)

eql_set_test: bool
eql_set_test = eql_set (mkSet (O::O::(S O)::nil)) (mkSet (O::O::(S O)::nil))
--expecting true

eql_set_test2: bool
eql_set_test2 = eql_set (mkSet (O::O::(S O)::nil)) (mkSet (O::O::nil))
--expecting false

toStringSet_test: String
toStringSet_test = toString (mkSet (true::false::nil))
--expecting (true, false)
