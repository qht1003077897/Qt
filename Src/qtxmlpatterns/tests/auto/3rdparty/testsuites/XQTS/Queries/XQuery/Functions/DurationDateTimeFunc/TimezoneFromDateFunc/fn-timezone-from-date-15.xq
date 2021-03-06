(:*******************************************************:)
(:Test: timezone-from-date-15                            :)
(:Written By: Carmelo Montanez                           :)
(:Date: June 27, 2005                                    :)
(:Purpose: Evaluates The "timezone-from-date" function   :)
(:as part of an "and" expression.                        :) 
(: Uses the "fn:string" function to account for new EBV rules. :)
(:*******************************************************:)

fn:string(fn:timezone-from-date(xs:date("1970-01-01Z"))) and fn:string(fn:timezone-from-date(xs:date("1970-01-01Z")))
