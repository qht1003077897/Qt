(:*******************************************************:)
(: Test: K-DurationEQ-34                                 :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: The 'gt' operator is not available between xs:duration and xs:dayTimeDuration. :)
(:*******************************************************:)
xs:duration("P1999Y10M3DT08H34M12.143S") gt
			   xs:dayTimeDuration("P3DT08H34M12.143S")