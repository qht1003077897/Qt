(:*******************************************************:)
(:Test: hours-from-time-18                               :)
(:Written By: Carmelo Montanez                           :)
(:Date: June 6, 2005                                     :)
(:Purpose: Evaluates The "hours-from-time" function      :)
(:as part of a "numeric-equal" expression (le operator)  :) 
(:*******************************************************:)

fn:hours-from-time(xs:time("10:00:00Z")) le fn:hours-from-time(xs:time("10:00:00Z"))
