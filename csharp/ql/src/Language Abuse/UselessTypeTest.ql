/**
 * @name Useless type test
 * @description There is no need to test whether or not an instance of a derived type is also an instance of a base type - it always is.
 * @kind problem
 * @problem.severity warning
 * @precision medium
 * @id cs/useless-type-test
 * @tags maintainability
 *       language-features
 *       external/cwe/cwe-561
 */

import csharp

from IsExpr ie, ValueOrRefType t, ValueOrRefType ct
where
  t = ie.getExpr().getType() and
  ct = ie.getPattern().(TypePatternExpr).getCheckedType() and
  ct = t.getABaseType+()
select ie,
  "There is no need to test whether an instance of $@ is also an instance of $@ - it always is.", t,
  t.getName(), ct, ct.getName()
