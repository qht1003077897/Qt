(:*******************************************************:)
(: Test: K-QuantExprWithout-54                           :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: A test whose essence is: `true() eq (some $a in 1 satisfies $a)`. :)
(:*******************************************************:)
true() eq (some $a in 1 satisfies $a)