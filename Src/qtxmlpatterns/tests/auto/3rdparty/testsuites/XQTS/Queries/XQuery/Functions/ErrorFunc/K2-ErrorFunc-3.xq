(:*******************************************************:)
(: Test: K2-ErrorFunc-3                                  :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: Use a QName with no namespace URI.           :)
(:*******************************************************:)
error(QName("", "FOO"), "DESCRIPTION")