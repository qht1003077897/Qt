(:*******************************************************:)
(: Test: K-SeqMAXFunc-12                                 :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:23+01:00                       :)
(: Purpose: A test whose essence is: `max((1, xs:float(2), xs:untypedAtomic("3"))) eq 3`. :)
(:*******************************************************:)
max((1, xs:float(2), xs:untypedAtomic("3"))) eq 3