(:*******************************************************:)
(: Test: op-logical-and-077.xq                           :)
(: Written By: Lalith Kumar                              :)
(: Date: Thu May 12 05:50:40 2005                        :)
(: Purpose: Logical 'and' using nonPositiveInteger values:)
(:*******************************************************:)

   <return>
     { xs:nonPositiveInteger(0) and xs:nonPositiveInteger(-1) }
   </return>
