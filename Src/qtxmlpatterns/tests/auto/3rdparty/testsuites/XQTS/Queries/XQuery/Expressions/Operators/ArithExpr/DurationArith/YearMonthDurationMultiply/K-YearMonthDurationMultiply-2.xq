(:*******************************************************:)
(: Test: K-YearMonthDurationMultiply-2                   :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: Simple test of multiplying 3 with xs:yearMonthDuration. :)
(:*******************************************************:)
3 * xs:yearMonthDuration("P3Y36M")
			eq xs:yearMonthDuration("P18Y")