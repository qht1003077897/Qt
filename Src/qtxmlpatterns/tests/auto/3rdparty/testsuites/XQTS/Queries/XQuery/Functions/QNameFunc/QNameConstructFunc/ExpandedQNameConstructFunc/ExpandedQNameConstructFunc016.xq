(: Name: ExpandedQNameConstructFunc016 :)
(: Description: Test function fn:QName. Error case - invalid input type for parameters (integer) :)

(: insert-start :)
declare variable $input-context external;
(: insert-end :)

element {fn:QName( xs:integer("100"), "person" )}{ "test" }
