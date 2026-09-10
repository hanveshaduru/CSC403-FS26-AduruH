----------------------------------------
-- Agda Lab 1 : Booleans 
---------------------------------------- 

-- Instructions
---------------
-- Complete the following file by filling in the "holes". There are 21
-- holes, and each of them is a homework problem. There is also a final boss problem. Some holes can't be
-- filled until you have completed earlier ones.
--
-- Hint: If you place the cursor in any hole by typing C-c C-f (Control-c followed by Control-f),
-- you can type C-c C-, (Control-c followed by Control-comma) to see the type of the hole,
-- i.e., the proposition you have to prove or the type of the
-- expression you have to write. Moreover, C-c C-, also shows you the
-- current context, i.e., what the types of the relevant variables
-- are.
-- 
-- If you are using Agda Mode for VS Code, viewing the extension page will show you a list of 
-- hotkeys for interacting with Agda. Some important ones are below. The capital C in each command
-- means the Control key. 
-- C-c C-l (load the file)
-- C-c C-f (forward to next hole)
-- C-c C-b (back to previous hole)
-- C-c C-, (see the type of the hole)
-- C-c C-r (refine a hole)
-- C-c C-c (case split on given variable in hole)

open import Equality 

module Boolean where 

    -- The Boolean type consists of two values
    data Bool : Set where 
        true  : Bool
        false : Bool 

    -------------------------------------------------------------
    -- There are four 1-ary (one arg) functions from Bool to Bool 
    -------------------------------------------------------------
    -- Identity Function
    -- Returns the input.
    id : Bool → Bool 
    id b = {!   !}

    -- Not 
    -- Logical Inverse
    -- You will need to pattern match on b.
    not : Bool → Bool 
    not b = {!   !}

    -- Constant True 
    -- Always returns true.
    always-true : Bool → Bool 
    always-true b = {!   !}

    -- Constant False 
    -- Always returns false. 
    always-false : Bool → Bool 
    always-false b = {!   !}

    -------------------------------------------------------------
    -- Binary Operations on Booleans
    -------------------------------------------------------------
    -- The logical AND operator 
    -- Instead of completely pattern matching on p and q,
    -- pattern match on p only and consider how you could
    -- use the second argument q (Hint: Think about short-circuit evaluation.)
    and : Bool → Bool → Bool 
    and p q = {!   !}

    -- We can type ∧ with \and 
    -- It is just an alias for our AND function 
    _∧_ : Bool → Bool → Bool 
    p ∧ q = and p q

    -- ∧ is right-associative and will bind slightly stronger than ∨ by convention
    -- Both will bind stronger than ≡ 
    infixr 6 _∧_ 

    -- The logical (inclusive) OR operator 
    -- Again, instead of pattern matching on p and q,
    -- consider how you could pattern match on p and use q.
    or : Bool → Bool → Bool 
    or p q = {!   !}

    -- We type ∨ with \or 
    -- An alias for our inclusive OR function 
    _∨_ : Bool → Bool → Bool 
    x ∨ y = or x y

    -- ∨ is right-associative and will bind slightly weaker than ∧ by convention. 
    -- Both will bind stronger than ≡ 
    infixr 5 _∨_ 

    -- The logical (exclusive) OR operator 
    -- You can pattern match completely on p and q 
    -- or try to "short circuit". 
    xor : Bool → Bool → Bool 
    xor p q = {!   !}

    -- Type ⊕ with \oplus 
    -- Alias for our exclusive OR function 
    _⊕_ : Bool → Bool → Bool 
    p ⊕ q = xor p q 

    -- ⊕ is right-associative and will bind at the same precedence as ∨ 
    -- this means if you use both in an expression, you may have to remove
    -- ambiguity with parentheses 
    infixr 5 _⊕_

    -------------------------------------------------------------
    -- Theorems for Booleans
    -------------------------------------------------------------

    -- These proofs require the use of refl 
    -- from the equality data type _≡_ 
    -- defined in Equality.agda 

    -- A Note on Identity
    -- When learning algebra you learned that basic 
    -- operations like + and · have 'identities', even if you 
    -- weren't told they were called that. For example,
    -- 0 is the 'right-identity' for + because x + 0 = x for all x. 1 is
    -- the 'right-identity' for · because x · 1 = x for all x. 
    -- (0 is also the 'left-identity' for + and 1 is the 'left-identity' for ·, can you 
    -- think of the equations that justify these facts and explain why we say 'left' and 'right'? 
    -- We will prove these facts in Lab 2 about the natural numbers ℕ.)
    -- Boolean operations also have identity values!

    -- The left-identity of inclusive OR is FALSE. 
    -- We can use an _ as an 'anonymous' name for a variable 
    -- when we don't need to use it in an argument.
    -- Since false ∨ b reduces to b by definition, refl is enough!
    ∨-identl : (b : Bool) → false ∨ b ≡ b 
    ∨-identl _ = refl

    -- The right-identity of inclusive OR is FALSE. 
    -- Pattern match on b.
    ∨-identr : (b : Bool) → b ∨ false ≡ b 
    ∨-identr b = {!   !} 

    -- The left-identity of AND is TRUE. 
    ∧-identl : (b : Bool) → true ∧ b ≡ b 
    ∧-identl _ = {!   !} 

    -- The right-identity of AND is TRUE. 
    -- Pattern match on b. 
    ∧-identr : (b : Bool) → b ∧ true ≡ b 
    ∧-identr b = {!   !}

    -- If 0 preserves identity for the addition operation +,
    -- what does it do for the multiplication operation · ? 
    -- It annihilates! Anything times 0 becomes 0! What are the
    -- annihilators, the 'zeros' for the boolean operations AND and OR? 
    -- Again, we will consider from both the left and right.

    -- TRUE is the zero element for OR on the left 
    ∨-zerol : (b : Bool) → true ∨ b ≡ true 
    ∨-zerol b = {!   !}

    -- TRUE is also the zero element for OR on the right 
    ∨-zeror : (b : Bool) → b ∨ true ≡ true 
    ∨-zeror b = {!   !}

    -- FALSE is the zero element for AND on the left 
    ∧-zerol : (b : Bool) → false ∧ b ≡ false 
    ∧-zerol b = {!   !}

    -- FALSE is also the zero element for AND on the right 
    ∧-zeror : (b : Bool) → b ∧ false ≡ false 
    ∧-zeror b = {!   !}

    -- An INVOLUTION is a function that is its own inverse. 
    -- Prove that NOT is involutive. 
    not-involutive : ∀ (b : Bool) → not (not b) ≡ b
    not-involutive b = {!   !}

    -- In class we discussed an 'algebra of boolean connectives' and 
    -- identified properties of ∧ and ∨ such as commutative, associative, etc. 
    -- Such properties can be verified by hand with truth tables. 
    -- Instead, we will use Agda to check them. 

    -- AND is commutative 
    ∧-comm : (p q : Bool) → p ∧ q ≡ q ∧ p 
    ∧-comm p q = {!   !}

    -- OR is commutative     
    ∨-comm : (p q : Bool) → p ∨ q ≡ q ∨ p 
    ∨-comm p q = {!   !}  

    -- AND is associative 
    ∧-assoc : (p q r : Bool) → p ∧ (q ∧ r) ≡ (p ∧ q) ∧ r 
    ∧-assoc p q r = {!   !}
    
    -- OR is associative 
    ∨-assoc : (p q r : Bool) → p ∨ (q ∨ r) ≡ (p ∨ q) ∨ r 
    ∨-assoc p q r = {!   !}

    -- AND distributes from the left over OR 
    and-distribl-or : (p q r : Bool) → p ∧ (q ∨ r) ≡ (p ∧ q) ∨ (p ∧ r) 
    and-distribl-or p q r = {!   !}

    -- OR distributes from the left over AND 
    or-distribl-and : (p q r : Bool) → p ∨ (q ∧ r) ≡ (p ∨ q) ∧ (p ∨ r) 
    or-distribl-and p q r = {!   !}

    -- BUH-BUH-BUH-BUH BOSS BATTLE 
    -- For your final exercises in this lab, define and prove
    -- BOTH versions of DeMorgan's laws.
    -- You will need to determine the appropriate types and implement the functions.  

    -- demorgan1 : 

    -- demorgan2 : 


    --------------------------------------------------------

    -- Comments and Acknowledgements

    -- Peng Fu, Peter Selinger, and Sandy Maguire influenced 
    -- the development of this document.

    --------------------------------------------------------


