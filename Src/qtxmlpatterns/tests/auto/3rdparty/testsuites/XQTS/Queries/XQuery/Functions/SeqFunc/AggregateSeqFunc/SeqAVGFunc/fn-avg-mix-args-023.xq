(:*******************************************************:)
(: Test: fn-avg-mix-args-023.xq          :)
(: Written By: Pulkita Tyagi                             :)
(: Date: Tue Nov 22 05:19:47 2005                        :)
(: Purpose: arg: seq of double,integer                   :)
(:*******************************************************:)

fn:avg(( (xs:double("-0"), xs:integer("-999999999999999999") ) ))
