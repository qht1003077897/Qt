(:*******************************************************:)
(:Test: op-yearMonthDuration-equal2args-17               :)
(:Written By: Carmelo Montanez                           :)
(:Date: June 3, 2005               :)
(:Purpose: Evaluates The "op:yearMonthDuration-equal" operator (ge) :)
(: with the arguments set as follows:                    :)
(:$arg1 = xs:yearMonthDuration(mid range)               :)
(:$arg2 = xs:yearMonthDuration(lower bound)             :)
(:*******************************************************:)

xs:yearMonthDuration("P1000Y6M") ge xs:yearMonthDuration("P0Y0M")