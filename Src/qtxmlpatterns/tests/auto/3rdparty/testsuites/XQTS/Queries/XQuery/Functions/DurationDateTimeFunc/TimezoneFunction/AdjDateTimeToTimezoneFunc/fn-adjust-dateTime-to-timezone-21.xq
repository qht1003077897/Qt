(:*******************************************************:)
(:Test: adjust-dateTime-to-timezone-21                   :)
(:Written By: Carmelo Montanez                           :)
(:Date: August 10, 2005                                  :)
(:Test Description: Evaluates The "adjust-dateTime-to-timezone" function   :)
(:using the empty sequence as a value to the first argument. :)
(:Uses "fn:count" to avoid empty file.                   :)
(:*******************************************************:)

fn:count(fn:adjust-dateTime-to-timezone(()))