# Application-specific view helpers
# http://handlebarsjs.com/#helpers
# --------------------------------
utils = require './utils'
mediator = Chaplin.mediator


register = (name, fn) ->
 Handlebars.registerHelper name, fn

# Map helpers
# -----------

# Make 'with' behave a little more mustachey.
register 'with', (context, options) ->
  if not context or Handlebars.Utils.isEmpty context
    options.inverse(this)
  else
    options.fn(context)

# Inverse for 'with'.
register 'without', (context, options) ->
  inverse = options.inverse
  options.inverse = options.fn
  options.fn = inverse
  Handlebars.helpers.with.call(this, context, options)

# Get Chaplin-declared named routes. {{url "likes#show" "105"}}
register 'url', (routeName, params..., options) ->
  utils.reverse routeName, params

register "compare", (lvalue, rvalue, options) ->
  lvalue = lvalue() if $.isFunction(lvalue)
  rvalue = rvalue() if $.isFunction(rvalue)
  throw new Error("Handlerbars Helper 'compare' needs 2 parameters")  if arguments.length < 3
  #    asString = options.hash.asString or true
  asString = options.hash.asString != "false"
  operator = options.hash.operator or "=="

  operators =
    "==": (l, r) ->
      l is r
    "===": (l, r) ->
      l is r
    "!=": (l, r) ->
      l isnt r
    "<": (l, r) ->
      l < r
    ">": (l, r) ->
      l > r
    "<=": (l, r) ->
      l <= r
    "in": (l, r) ->
      l in r
    "matches": (l, r) ->
      new RegExp(r).test(l)
    typeof: (l, r) ->
      typeof l is r

  throw new Error("Handlerbars Helper 'compare' doesn't know the operator " + operator)  unless operators[operator]
  if asString
    result = operators[operator](String(lvalue), String(rvalue))
  else
    result = operators[operator](lvalue, rvalue)
  if result
    options.fn this
  else
    options.inverse this

register "formatWithCommaAndWeightType", (value)->
  value = value() if $.isFunction(value)
  utils.formatNumWithComma(value)+' lbs'

register "getGlobalType",() ->
  return mediator.data.get('config-type')


register "isDispatch",(options) ->
  if(mediator.data.get('config-type')== "Dispatch")
    options.fn(this)
  else
    options.inverse(this)
