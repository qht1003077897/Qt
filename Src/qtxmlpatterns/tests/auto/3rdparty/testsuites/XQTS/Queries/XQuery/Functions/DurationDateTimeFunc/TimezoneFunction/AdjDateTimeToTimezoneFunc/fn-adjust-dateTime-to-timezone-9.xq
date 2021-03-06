(:*******************************************************:)
(:Test: adjust-dateTime-to-timezone-9                    :)
(:Written By: Carmelo Montanez                           :)
(:Date: August 10, 2005                                  :)
(:Test Description: Evaluates The "adjust-dateTime-to-timezone" function   :)
(:as part of a subtraction expression, whicg results on a negative number.:)
(:Uses two adjust-dateTime-to-timezone functions.        :)
(:*******************************************************:)

fn:adjust-dateTime-to-timezone(xs:dateTime("2002-03-07T10:00:00-07:00")) - fn:adjust-dateTime-to-timezone(xs:dateTime("2006-03-07T10:00:00-07:00"))