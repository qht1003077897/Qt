(:*******************************************************:)
(: Test: K2-DirectConElemWhitespace-5                    :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: xml:space declarations are ignored.          :)
(:*******************************************************:)
declare boundary-space strip;
string(<e xml:space="preserve"> </e>) eq ""