(:*******************************************************:)
(: Test: K-DatesSubtract-4                               :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: The 'div' operator is not available between xs:date and xs:date. :)
(:*******************************************************:)
xs:date("1999-10-12") div xs:date("1999-10-12")