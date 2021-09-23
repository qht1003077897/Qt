(:*******************************************************:)
(:Test: fn-timezone-from-dateTime-9                      :)
(:Written By: Carmelo Montanez                           :)
(:Date: June 27, 2005                                    :)
(:Purpose: Evaluates The "timezone-from-dateTime" function  :)
(:as part of a "-" expression.                           :) 
(:*******************************************************:)

fn:timezone-from-dateTime(xs:dateTime("1970-01-01T00:00:00+04:00")) - fn:timezone-from-dateTime(xs:dateTime("1970-01-01T10:00:00+02:00"))
