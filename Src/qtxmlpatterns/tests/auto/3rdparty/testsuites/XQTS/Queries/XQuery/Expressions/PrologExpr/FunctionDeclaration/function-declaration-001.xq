(:********************************************************************:)
(: Test: function-declaration-001.xq                                  :)
(: Written By: Pulkita Tyagi                                          :)
(: Date: Thu Jun  2 00:24:56 2005                                     :)
(: Purpose: Demonstrate function declaration in different combination :)
(:********************************************************************:)

declare namespace foo = "http://www..oracle.com/xquery/test";
declare function foo:price ($b as element()) as element()*
{
  $b/price
};
1
