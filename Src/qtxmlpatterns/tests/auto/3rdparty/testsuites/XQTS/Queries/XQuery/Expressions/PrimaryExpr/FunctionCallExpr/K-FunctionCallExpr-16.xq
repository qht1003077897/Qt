(:*******************************************************:)
(: Test: K-FunctionCallExpr-16                           :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:20+01:00                       :)
(: Purpose: No function by name fn:format-time() exists  :)
(: in XQuery 1.0 (although one does in XSLT).            :)
(: Amended MHK 2009-05-21 to deliver repeatable results under XQuery 1.1 :)
(:*******************************************************:)
matches(format-time(current-time(), "[H01]:[m01]"), "[0-2][0-9]:[0-5][0-9]")