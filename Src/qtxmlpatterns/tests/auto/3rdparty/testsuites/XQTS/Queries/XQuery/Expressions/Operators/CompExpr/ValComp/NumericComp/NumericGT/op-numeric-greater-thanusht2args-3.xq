(:*******************************************************:)
(:Test: op-numeric-greater-thanusht2args-3                :)
(:Written By: Carmelo Montanez                            :)
(:Date: Thu Dec 16 10:48:16 GMT-05:00 2004                :)
(:Purpose: Evaluates The "op:numeric-greater-than" operator:)
(: with the arguments set as follows:                    :)
(:$arg1 = xs:unsignedShort(upper bound)                  :)
(:$arg2 = xs:unsignedShort(lower bound)                  :)
(:*******************************************************:)

xs:unsignedShort("65535") gt xs:unsignedShort("0")