(:*******************************************************:)
(: Test: K-SeqSUMFunc-31                                 :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:23+01:00                       :)
(: Purpose: A test whose essence is: `sum((xs:yearMonthDuration("P20Y"), xs:yearMonthDuration("P10M")) [. < xs:yearMonthDuration("P3M")], xs:yearMonthDuration("P0M")) eq xs:yearMonthDuration("P0M")`. :)
(:*******************************************************:)
sum((xs:yearMonthDuration("P20Y"), xs:yearMonthDuration("P10M"))
					[. < xs:yearMonthDuration("P3M")], xs:yearMonthDuration("P0M"))
			eq xs:yearMonthDuration("P0M")