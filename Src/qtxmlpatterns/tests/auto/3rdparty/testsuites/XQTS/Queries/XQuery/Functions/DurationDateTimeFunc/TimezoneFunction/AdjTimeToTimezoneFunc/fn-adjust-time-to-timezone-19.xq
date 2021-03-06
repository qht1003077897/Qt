(:*******************************************************:)
(:Test: adjust-time-to-timezone-19                       :)
(:Written By: Carmelo Montanez                           :)
(:Date: August 10, 2005                                  :)
(:Test Description: Evaluates The "adjust-time-to-timezone" function :)
(:where an xs:time value is subtracted.                  :)
(:Use zulu timezone and empty sequence for 2nd argument. :)
(:*******************************************************:)
let $tz := xs:dayTimeDuration("PT10H")
return
fn:adjust-time-to-timezone(xs:time("10:00:00Z"),$tz) - xs:time("09:00:00Z")