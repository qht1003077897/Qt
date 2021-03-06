(:*******************************************************:)
(:Test: op-add-dayTimeDuration-to-time-12                :)
(:Written By: Carmelo Montanez                           :)
(:Date: July 1, 2005                                    :)
(:Purpose: Evaluates The "add-dayTimeDuration-to-time" operators used :)
(:with a boolean expression and the "fn:true" function.   :)
(: Uses the "fn:string" function to account for new EBV rules. :)
(:*******************************************************:)
 
fn:string((xs:time("02:02:02Z") + xs:dayTimeDuration("P05DT08H11M"))) and (fn:true())