(:*******************************************************:)
(:Test: deep-equalintg2args-5                             :)
(:Written By: Carmelo Montanez                            :)
(:Date: Fri Dec 10 10:15:47 GMT-05:00 2004                :)
(:Purpose: Evaluates The "deep-equal" function           :)
(: with the arguments set as follows:                    :)
(:$parameter1 = xs:integer(lower bound)                  :)
(:$parameter2 = xs:integer(upper bound)                  :)
(:*******************************************************:)

fn:deep-equal((xs:integer("-999999999999999999")),(xs:integer("999999999999999999")))