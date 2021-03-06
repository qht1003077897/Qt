(:*******************************************************:)
(:Test: op-dateTime-equal2args-12                        :)
(:Written By: Carmelo Montanez                           :)
(:Date: June 3, 2005                                     :)
(:Purpose: Evaluates The "op:dateTime-equal" operator (le):)
(: with the arguments set as follows:                    :)
(:$arg1 = xs:dateTime(mid range)                         :)
(:$arg2 = xs:dateTime(lower bound)                       :)
(:*******************************************************:)

xs:dateTime("1996-04-07T01:40:52Z") le xs:dateTime("1970-01-01T00:00:00Z")