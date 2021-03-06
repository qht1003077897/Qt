declare default element namespace "http://www.w3.org/XQueryTestOrderBy";
(: name : orderBy44 :)
(: description : Evaluation of "order by" clause with the "order by" clause of a FLWR expression set to "$x is $x ", where $x is a set of small positive numbers and the ordering mode set to descending :)

(: insert-start :)
declare variable $input-context1 external;
(: insert-end :)

<results> {
for $x in $input-context1/DataValues/SmallPositiveNumbers/orderData
 order by $x is $x descending return $x is $x
}
</results>
