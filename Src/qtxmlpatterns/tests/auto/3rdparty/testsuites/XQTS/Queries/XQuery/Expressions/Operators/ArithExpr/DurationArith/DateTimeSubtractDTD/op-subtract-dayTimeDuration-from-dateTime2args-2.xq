(:*******************************************************:)
(:Test: op-subtract-dayTimeDuration-from-dateTime2args-2  :)
(:Written By: Carmelo Montanez                            :)
(:Date: Tue Apr 12 16:29:08 GMT-05:00 2005                :)
(:Purpose: Evaluates The "op:subtract-dayTimeDuration-from-dateTime" operator:)
(: with the arguments set as follows:                    :)
(:$arg1 = xs:dateTime(mid range)                         :)
(:$arg2 = xs:dayTimeDuration(lower bound)               :)
(:*******************************************************:)

xs:dateTime("1996-04-07T01:40:52Z") - xs:dayTimeDuration("P0DT0H0M0S")