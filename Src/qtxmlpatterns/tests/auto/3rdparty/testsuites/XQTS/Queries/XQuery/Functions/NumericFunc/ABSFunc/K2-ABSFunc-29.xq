(:*******************************************************:)
(: Test: K2-ABSFunc-29                                   :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: Invoke fn:abs() on xs:float and check the return type(negative test). :)
(:*******************************************************:)
fn:abs(xs:float(1)) instance of xs:double