(:*******************************************************:)
(: Test: K-SeqExprCast-610                               :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:22+01:00                       :)
(: Purpose: Casting from xs:integer to xs:dateTime isn't allowed. :)
(:*******************************************************:)
xs:integer("6789") cast as xs:dateTime