(:*******************************************************:)
(: Test: K2-XQueryComment-1                              :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: An invalid comment after a name test.        :)
(:*******************************************************:)
let $i := <e>
                                            <b/>
                                            <b/>
                                            <b/>
                                        </e>
                              return $i/b(:  