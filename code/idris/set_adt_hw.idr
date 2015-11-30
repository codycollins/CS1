module set_spec

-- imports needed for specification
import bool
import option
import pair
import list
import nat
import eq
import serialize

-- imports needed for list-based implementation
import list
import ite

{-
*********************************************
**************** SPECIFICATION **************
*********************************************
-}

------------
-- data type
------------

-- A polymorphic set type. We interpret values of type (set a) as
-- representing sets of values of type a.
data set: (a: Type) -> Type

{- READ THIS: This is an ordinary Idris file but it looks different
than what you've seen before. The differences are meant to emphasize
that we can design specifications separately from implementations and
to provide you with a set of challenges: to fill in the missing parts
of this program.

So, first, we have included the function and data type declarations in
the first part of this file, without implementations. Implementations
will be written in the second section.

To illustrate we've included examples at the start of IMPLEMENTATION
section. We've included code reflecting our decision to use lists to
represent sets, and a few function implementations that are based on
this decision---for the functions that we've already seen in class.

Second, we've marked places in this file where you are to fill
in implementations, leaving most implementations undefined. Compiling
this fill will show that Idris finds many remaining "holes." These are
precisely where Idris finds a function type declaration but no code to
implement the functions. Your job is to write the implementations. We
have given you places to fill in code, and in some cases we've given
hints about how to proceed. That said, this homework presents you with
an opportunity to start to program independently: you *will* have to
think creatively and use everything you've learned in this class so
far to complete this assignment.  -}

------------
-- functions
------------

-- The empty set of a
emptySet: set a


{- Note: In the following function type declarations, we use a simple
mechanism that you haven't seen before: We give names to the arguments
to functions. Just a moment's study should reveal how this works. You
can't give a name to the return value. The purpose is simply to make
it easier to write descriptions of functions by allowing one to refer
to arguments by name. In the following declaration, for example, we
refer to the argument to /isEmpty/ as /s/, which is the name that we
have given the argument in the type declaration. Note, again, that we
are giving a type declaration and an English language specification,
but we are not (here) providing an *implementation* of the operation.
We could say that we are defining an *abstract* function. We give a
concrete implementation in the second section of this file. -}


-- If s is empty then true, otherwise false
isEmpty: (s: set a) -> bool


-- Return the set, s union {v}
set_insert: (eq a) => a -> set a -> set a


-- Return the set, s - {v}
set_remove: (eq a) => (v: a) -> (s: set a) -> set a


-- Return the number of elements in s
set_cardinality: (s: set a) -> nat


-- If v is in s return true, otherwise false
set_member: (eq a) => (v: a) -> (s: set a) -> bool


-- Return union of s1 and s2
set_union: (eq a) => (s1: set a) -> (s2: set a) -> set a


-- Return the intersection of s1 and s2
set_intersection: (eq a) => (s1: set a) -> (s2: set a) -> set a


-- Return the set difference, s1 minus s2
set_difference: (eq a) => (s1: set a) -> (s2: set a) -> set a


-- Return true p is true for every v in s, otherwise false
set_forall: (p: a -> bool) -> (s: set a) -> bool


-- Return true if p is true for some v in s, otherwise else false
set_exists: (p: a -> bool) -> (s: set a) -> bool


-- If (set_exists p s), return (some v) such that (p v) is true, else
-- return none. We need to return an option because there might not be
-- an element in s with property p.  If there is such an element, we
-- call it a "witness to the property p."
set_witness: (p: a -> bool) -> (s: set a) -> option a


-- Return the cartesian product of s1 and s2. That is, return the
-- set of all pairs whose first element is taken from s1 and whose
-- second element is taken from s2. For example, the product of the
-- sets {1, 2} and {a, b} is { (1, a), (1, b), (2, a), (2, b) }.
set_product: (s1: set a) -> (s2: set b) -> set (pair a b)


-- Extra credit: Return the set of all sets of elements of s.
-- For example, the powerset of {1, 2, 3} is the following set:
-- { {}, {1}, {2}, {3}, {1, 2}, {1, 3}, {2, 3}, {1, 2, 3} }. The
-- cardinality of the powerset of a set of cardinality n is 2^n.
set_powerset: (s: set a) -> set (set a)


-- return true if s1 and s2 are equal, else false
set_eql: (eq a) => (s1: set a) -> (s2: set a) -> bool


-- Return a string representation of s
set_toString: (serialize a) => set a -> String


------------------
-- class instances
------------------

-- Overloaded eql for sets: it just calls set_eql
-- Idris won't let us separate specification from
-- implementation for class instances, so we write
-- the implementation here, but it's just a call to
-- the specified (but not yet implemented) seq_eql.
-- You do not need to implement this class instance
-- any further in the code below.
instance (eq a) => eq (set a) where
  eql s1 s2 = set_eql s1 s2


-- Overloaded toString for sets, calls set_toString
-- The same comment right above applies here, too
instance (serialize a) => serialize (set a) where
  toString s = set_toString s


{-
*********************************************
*************** IMPLEMENTATION **************
*********************************************
-}

------------------------------------

-- Now we decide to represent sets as lists with an additional
-- "representation invariant": list must have no duplicate members.
-- We do not make this invariant explicit in the code here. Rather,
-- the programmer must bear it in mind when writing the code that
-- is to follow. Note that this code provides an *implementation*
-- for the abstract specification given above.
data set a = mkSet (list a)

------------------------------------

-- Similarly here we give a list-based, concrete implementation of
-- the specifid "emptySet" abstration, representing the empty set
-- with an empty list.
emptySet = mkSet nil

-------------------------------------

-- As a final note, here we provide a concrete implementation of the
-- isEmpty function specified above.
-- isEmpty: (s: set a) -> bool
isEmpty (mkSet nil) = true
isEmpty _ = false

-------------------------------------

-- And here t becomes absolutely clear that all we're doing here is
-- writing representation-(list)-specific implementation code that we
-- would ordinarily have put right under the type declaration for this
-- function. Separating this code allows us to see and to emphasie the
-- possibilities for separating specification and implementation ideas
-- when designing software.
-- set_insert: (v: a) -> (s: set a) -> set a
-- Return the set, s union {v}
set_insert v (mkSet l) = ite (member v l)
                             (mkSet l)
                             (mkSet (v::l))

-------------------------------------

-- Your task is to write and test implementations for the remaining
-- specified but unimplemented functions. We provide snippets and
-- hints in some cases that help you in this task.

-- In this case, we make it easier by providing an implementation for
-- you. However, the implementation uses a helper function that you
-- will need to write. In the following cases, you will need to work
-- out for yourself whether one or more helper functions will help.

-- helper function: return list l without value v
list_remove: (eq a) => (v: a) -> (l: list a) -> list a
list_remove v nil = nil
list_remove v (h::t) = ite (eql v h) (list_remove v (t)) (h::list_remove v (t))

-- set_remove: (eq a) => (v: a) -> (s: set a) -> set a
-- Return the set, s - {v}
set_remove v (mkSet l) = mkSet (list_remove v l)

-------------------------------------

-- Return the number of elements in s
-- set_cardinality: (s: set a) -> nat
-- relies on rep invariant
set_cardinality (mkSet l) = len l

-------------------------------------

-- If v is in s return true, otherwise false
--set_member: (v: a) -> (s: set a) -> bool
set_member v (mkSet l) = member v l

-------------------------------------

-- Return union of s1 and s2
-- set_union: (s1: set a) -> (s2: set a) -> set a

combine: (eq a) => (list a) -> (list a) -> (list a)
combine l nil = l
combine l (h::t) = ite (member h l) (combine l t) (l++(h::t))

-- hint, write a function, combine, that combines two
-- lists into one, avoiding duplicate elements

set_union (mkSet l1) (mkSet l2) = mkSet (combine l1 l2)

-------------------------------------

-- here we provide you with an incomplete helper function

intersect: (eq a) => list a -> list a -> list a
intersect nil _ = nil
intersect (h::t) l2 = ite (member h l2) (h::(intersect t l2)) (intersect t l2)

-- Return the intersection of s1 and s2
-- set_intersection: (eq a) => list a -> list a -> list a
set_intersection (mkSet l1) (mkSet l2) = (mkSet (intersect l1 l2))

-------------------------------------

-- hint: write and use a list_difference helper function

list_difference: (eq a) => (list a) -> (list a) -> (list a)
list_difference nil _ = nil
list_difference (h::t) l2 = ite (member h l2) (list_difference t l2) (h::(list_difference t l2))

-- Return the set difference, s1 minus s2
--set_difference: (eq a) => (s1: set a) -> (s2: set a) -> set a
set_difference (mkSet l1) (mkSet l2) = mkSet (list_difference l1 l2)

-------------------------------------

-- hint: write one line of code using higher-order functions

-- Return true if p is true for every v in s, otherwise false
-- set_forall: (p: a -> bool) -> (s: set a) -> bool
set_forall p (mkSet l) = ite (member false (map p l)) (false) (true)

-------------------------------------

-- hint: write one line of code using higher-order functions

-- Return true if p is true for some v in s, otherwise else false
-- set_exists: (p: a -> bool) -> (s: set a) -> bool
set_exists p (mkSet l) = member true (map p l)

-------------------------------------

--hint: write and use a list version of the witness function

-- If (set_exists p s), return (some v) such that (p v) is true,
-- else return none. We need to return an option because of course
-- in general there might not be an element in s with property p.
-- If there is one, we call it a "witness to the property, p."

list_exists: (p: a -> bool) -> (l: list a) -> bool
list_exists p l = member true (map p l)

list_witness: (a -> bool) -> list a -> option a
list_witness p nil = none
list_witness p (h::t) = ite (p h) (some h) (list_witness p t)

-- set_witness: (p: a -> bool) -> (s: set a) -> option a

set_witness p (mkSet l) = (list_witness p l)

-------------------------------------

-- hint: consider writing two levels of helper functions
-- the first takes two lists and returns a list of all pairs
-- the second takes one element and a list and returns all pairs
-- of that element with elements in the list

-- Return the cartesian product of s1 and s2. That is, return the
-- set of all pairs whose first element is taken from s1 and whose
-- second element is taken from s2. For example, the product of the
-- sets {1, 2} and {a, b} is { (1, a), (1, b), (2, a), (2, b) }.
-- set_product: (s1: set a) -> (s2: set b) -> set (pair a b)

--pair_elt takes an elt h and a list b and returns list of all pairs
-- (h,e) where e is an element of lb
pair_elt: a -> list b -> list (pair a b)
pair_elt a nil = nil
pair_elt a (b::tb) = (mkPair a b)::(pair_elt a tb)

all_pairs: list a -> list b -> list (pair a b)
all_pairs nil lb = nil
all_pairs (h::t) lb = (pair_elt h lb) ++ (all_pairs t lb)

set_product (mkSet la) (mkSet lb) = mkSet (all_pairs la lb)

-------------------------------------

-- Extra credit: Return the set of all sets of elements of s.
-- For example, the powerset of {1, 2, 3} is the following set:
-- { {}, {1}, {2}, {3}, {1, 2}, {1, 3}, {2, 3}, {1, 2, 3} }. The
-- cardinality of the powerset of a set of cardinality n is 2^n.
-- set_powerset: (s: set a) -> set (set a)
--set_powerset


-------------------------------------

-- Here you need to provide an implementation of set_eql. We
-- worked that out in class, so you might want to just use what
-- we already did.

eql_set: (eq a) => set a -> set a -> bool
eql_set (mkSet l1) (mkSet l2) = same_elements l1 l2

-------------------------------------

-- Here you need to provide an implementation of set_toString.
-- Format a set like we did with a list, but use curly braces
-- instead of square brackets. Make sure that commas appear in
-- all and only the right places.

toStringSet: (serialize a) => set a -> String
toStringSet (mkSet l) = toStringList l

-------------------------------------

-- Yeah, you're done! Ok, not quite: Write tests for all of
-- the functions in this module. Put tests in set_adt_test.idr.
-- Indicate the expected value of each test in a corresponding
-- comment.
