(:*******************************************************:)
(: Test: K2-BaseURIFunc-26                               :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: Ensure that the base URI is empty for computed attribute constructors, with no base-uri declaration. :)
(:*******************************************************:)
empty(base-uri(attribute name {"value"}))