(: Name: fn-root-23:)
(: Description: Evaluation of the fn:root function used as argument to namespace-uri function (use a text node).:)
(: use fn:count to avoid empty file :)

(: insert-start :)
declare variable $input-context1 external;
(: insert-end :)

let $var := text {"A text node"}

return
 fn:count(fn:namespace-uri(fn:root($var)))