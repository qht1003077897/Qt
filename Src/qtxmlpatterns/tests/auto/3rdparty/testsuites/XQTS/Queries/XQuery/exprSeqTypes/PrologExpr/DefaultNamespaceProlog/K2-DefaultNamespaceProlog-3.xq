(:*******************************************************:)
(: Test: K2-DefaultNamespaceProlog-3                     :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: Syntax error in the keywords.                :)
(:*******************************************************:)
default declare default element namespace b = "http://www.example.com/";
empty(<e xmlns="http://www.example.com/"><d xmlns=""><b/></d></e>/b:d/b:b)