# Application-specific utilities
# ------------------------------

# Delegate to Chaplin’s utils module.
testUtils = {}

# _(utils).extend
#  someMethod: ->
_(testUtils).extend
  resolvedPromise: (data) ->
    @resolvedPromiseWith({}, data)

  resolvedPromiseWith: (context, data) ->
    new $.Deferred().resolveWith(context, data).promise()

  rejectedPromise: (data) ->
    @rejectedPromiseWith({}, data)

  rejectedPromiseWith: (context, data) ->
    new $.Deferred().rejectWith(context, data).promise()

  idlePromise: ->
    new $.Deferred().promise()


 # Prevent creating new properties and stuff.
Object.seal? testUtils
module.exports = testUtils
