(:*******************************************************:)
(: Test: K-SeqMAXFunc-15                                 :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:23+01:00                       :)
(: Purpose: A test whose essence is: `max((1, xs:untypedAtomic("3"), xs:float(2))) instance of xs:double`. :)
(:*******************************************************:)
max((1, xs:untypedAtomic("3"), xs:float(2))) instance of xs:double