(:*******************************************************:)
(:Test: op-time-greater-than-13                          :)
(:Written By: Carmelo Montanez                           :)
(:Date: June 13, 2005                                    :)
(:Purpose: Evaluates The "time-greater-than" function used:)
(:together with "fn:false"/or expression (gt operator).  :)
(:*******************************************************:)
 
(xs:time("13:00:00Z") gt xs:time("17:00:00Z")) or (fn:false())