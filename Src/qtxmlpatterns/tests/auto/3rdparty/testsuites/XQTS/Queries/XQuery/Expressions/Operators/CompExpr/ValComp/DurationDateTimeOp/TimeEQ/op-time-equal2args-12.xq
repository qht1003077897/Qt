(:*******************************************************:)
(:Test: op-time-equal2args-12                            :)
(:Written By: Carmelo Montanez                           :)
(:Date: June 3, 2005                                     :)
(:Purpose: Evaluates The "op:time-equal" operator (le)   :)
(: with the arguments set as follows:                    :)
(:$arg1 = xs:time(mid range)                             :)
(:$arg2 = xs:time(lower bound)                           :)
(:*******************************************************:)

xs:time("08:03:35Z") le xs:time("00:00:00Z")