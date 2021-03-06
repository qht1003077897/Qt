(:*******************************************************:)
(:Test: op-add-dayTimeDuration-to-date-10                :)
(:Written By: Carmelo Montanez                           :)
(:Date: July 1, 2005                                     :)
(:Purpose: Evaluates The string value "add-dayTimeDuration-to-date" operator used  :)
(:together with an "or" expression.                      :)
(:*******************************************************:)
 
fn:string((xs:date("1985-07-05Z") + xs:dayTimeDuration("P03DT01H04M"))) or fn:string((xs:date("1985-07-05Z") + xs:dayTimeDuration("P01DT01H03M")))