(:*******************************************************:)
(: Test: K2-SeqExprCast-341                              :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: Cast xs:unsignedInt to xs:double.            :)
(:*******************************************************:)
xs:double(xs:unsignedInt(3))