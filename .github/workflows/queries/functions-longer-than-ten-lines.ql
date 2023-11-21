/**
 * @description Find all functions longer than 10 lines
 * @kind problem
 * @id javascript/functions-longer-than-10lines
 * @problem.severity recommendation
 */
import javascript

/**
 * Holds if a function is longer than 10 lines.
 */
from Function func
where func.getNumLines() > 10
select func, "is longer than 10 lines"

