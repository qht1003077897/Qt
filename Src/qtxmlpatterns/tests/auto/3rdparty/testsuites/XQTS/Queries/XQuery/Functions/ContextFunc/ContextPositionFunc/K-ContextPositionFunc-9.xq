(:*******************************************************:)
(: Test: K-ContextPositionFunc-9                         :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:23+01:00                       :)
(: Purpose: fn:position() can never return 0('!='), #2.  :)
(:*******************************************************:)
deep-equal(
(1, 2, 3, remove((current-time(), 4), 1))
[0 != position()],
(1, 2, 3, 4))