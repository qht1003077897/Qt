(:*******************************************************:)
(:Test: replace3args-7                                    :)
(:Written By: Carmelo Montanez                            :)
(:Date: Fri Dec 10 10:15:47 GMT-05:00 2004                :)
(:Purpose: Evaluates The "replace" function              :)
(: with the arguments set as follows:                    :)
(:$input = xs:string(lower bound)                        :)
(:$pattern = xs:string(lower bound)                      :)
(:$replacement = xs:string(upper bound)                  :)
(:*******************************************************:)

fn:replace(xs:string("This is a characte"),xs:string("This is a characte"),xs:string("This is a characte"))