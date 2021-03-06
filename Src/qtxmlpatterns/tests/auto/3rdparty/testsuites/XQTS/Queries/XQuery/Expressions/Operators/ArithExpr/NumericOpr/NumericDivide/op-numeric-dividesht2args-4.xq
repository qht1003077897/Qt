(:*******************************************************:)
(:Test: op-numeric-dividesht2args-4                       :)
(:Written By: Carmelo Montanez                            :)
(:Date: Thu Dec 16 10:48:16 GMT-05:00 2004                :)
(:Purpose: Evaluates The "op:numeric-divide" operator    :)
(: with the arguments set as follows:                    :)
(:$arg1 = xs:short(lower bound)                          :)
(:$arg2 = xs:short(mid range)                            :)
(:*******************************************************:)

fn:round-half-to-even((xs:short("-32768") div xs:short("-5324")),5)