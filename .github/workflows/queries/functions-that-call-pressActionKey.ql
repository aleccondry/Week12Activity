/**
 * @description Find all tests that call pressActionKey
 * @kind problem
 * @id javascript/functions-that-call-pressActionKey
 * @problem.severity recommendation
 */
import javascript

/**
 * Holds if a function is a test that calls pressActionKey
 */
predicate isTest(Function test) {
    exists(CallExpr describe, CallExpr it |
        describe.getCalleeName() = "describe" and
        it.getCalleeName() = "it" and
        it.getParent*() = describe and 
        test = it.getArgument(1)
    )
}

predicate callsPressActionKey(Function caller) {
     exists(DataFlow::CallNode call |
         call.getEnclosingFunction() = caller and
         call.getACallee().getName() = "pressActionKey"
     )
}

from Function test
where isTest(test) and
      callsPressActionKey(test)
select test, "calls pressActionKey"

