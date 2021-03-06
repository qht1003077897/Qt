(:*******************************************************:)
(: Test: K2-FunctionProlog-24                            :)
(: Written by: Frans Englich                             :)
(: Date: 2007-10-03T14:53:33+01:00                       :)
(: Purpose: The empty string cannot be cast to an xs:boolean. :)
(:*******************************************************:)
declare function local:distinct-nodes-stable ($arg as node()*) as xs:boolean* 
{ 
    for $a in $arg 
    return xs:boolean($a) 
};

local:distinct-nodes-stable((<element1/>,<element2/>))
