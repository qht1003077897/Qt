(: name : cast-derived-2 :)
(: description : Casting from float to integer.:)

(: insert-start :)
declare variable $input-context1 external;
(: insert-end :)

let $value := xs:float(10.0)
return $value cast as xs:decimal