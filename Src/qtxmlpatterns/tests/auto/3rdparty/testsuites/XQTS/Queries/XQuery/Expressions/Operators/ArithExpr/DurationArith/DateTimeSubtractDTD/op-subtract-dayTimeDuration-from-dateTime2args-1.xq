(:*******************************************************:)
(:Test: op-subtract-dayTimeDuration-from-dateTime2args-1  :)
(:Written By: Carmelo Montanez                            :)
(:Date: Tue Apr 12 16:29:08 GMT-05:00 2005                :)
(:Purpose: Evaluates The "op:subtract-dayTimeDuration-from-dateTime" operator:)
(: with the arguments set as follows:                    :)
(:$arg1 = xs:dateTime(lower bound)                       :)
(:$arg2 = xs:dayTimeDuration(lower bound)               :)
(:*******************************************************:)

xs:dateTime("1970-01-01T00:00:00Z") - xs:dayTimeDuration("P0DT0H0M0S")