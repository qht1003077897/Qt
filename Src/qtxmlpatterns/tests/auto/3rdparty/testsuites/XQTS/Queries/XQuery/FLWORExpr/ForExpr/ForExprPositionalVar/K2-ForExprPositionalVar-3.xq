(:*******************************************************:)
(: Test: K2-ForExprPositionalVar-3                       :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: Usage of two positional variable references. :)
(:*******************************************************:)
let $tree := <e>
    <a id="1"/>
    <a id="2"/>
    <a id="3"/>
</e>
for $i at $pos in ("a", "b", "c")
return ($tree/a/@id = $pos, $pos)