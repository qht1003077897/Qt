(:*******************************************************:)
(: Test: K-YearMonthDurationEQ-6                         :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: The xs:yearMonthDuration values -P0M and P0M are equal. :)
(:*******************************************************:)
xs:yearMonthDuration("-P3Y8M") ne xs:yearMonthDuration("P3Y8M")