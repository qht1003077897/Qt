declare default element namespace "http://www.w3.org/XQueryTestOrderBy";
(: name : orderBy35 :)
(: description : Evaluation of "order by" clause with the "order by" clause of a FLWR expression set to "xs:float($x) ", where $x is a set of positive numbers and the ordering mode set to descending :)

(: insert-start :)
declare variable $input-context1 external;
(: insert-end :)

<results> {
for $x in $input-context1/DataValues/PositiveNumbers/orderData
 order by xs:float($x) descending return xs:float($x)
}
</results>
