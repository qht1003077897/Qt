(:*******************************************************:)
(: Test: K-QuantExprWithout-57                           :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: A test whose essence is: `true() eq (some $xs:name in (1, 2) satisfies $xs:name)`. :)
(:*******************************************************:)
true() eq (some $xs:name in (1, 2) satisfies $xs:name)