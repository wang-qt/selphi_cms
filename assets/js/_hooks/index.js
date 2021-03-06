/*
This file was generated by the Surface compiler.
*/

function ns(hooks, nameSpace) {
  const updatedHooks = {}
  Object.keys(hooks).map(function(key) {
    updatedHooks[`${nameSpace}#${key}`] = hooks[key]
  })
  return updatedHooks
}

import * as c1 from "./SelphiDaisy.Card.hooks"
import * as c2 from "./SelphiDaisy.Table.hooks"

let hooks = Object.assign(
  ns(c1, "SelphiDaisy.Card"),
  ns(c2, "SelphiDaisy.Table")
)

export default hooks
