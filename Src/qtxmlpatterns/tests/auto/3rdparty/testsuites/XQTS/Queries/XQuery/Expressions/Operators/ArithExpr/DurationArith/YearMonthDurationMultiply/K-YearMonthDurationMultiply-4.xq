(:*******************************************************:)
(: Test: K-YearMonthDurationMultiply-4                   :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: Simple test of multiplying a xs:yearMonthDuration with 0. :)
(:*******************************************************:)
xs:yearMonthDuration("P3Y36M") * 0
			eq xs:yearMonthDuration("P0M")