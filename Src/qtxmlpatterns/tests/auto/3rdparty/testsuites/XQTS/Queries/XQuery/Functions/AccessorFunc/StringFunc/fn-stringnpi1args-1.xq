(:*******************************************************:)
(:Test: stringnpi1args-1                                  :)
(:Written By: Carmelo Montanez                            :)
(:Date: Fri Dec 10 10:15:46 GMT-05:00 2004                :)
(:Purpose: Evaluates The "string" function               :)
(: with the arguments set as follows:                    :)
(:$arg = xs:nonPositiveInteger(lower bound)              :)
(:*******************************************************:)

fn:string(xs:nonPositiveInteger("-999999999999999999"))