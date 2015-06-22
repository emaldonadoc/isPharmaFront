# The application object.
module.exports = class Application extends Chaplin.Application

  initialize: ->
  #   # You can fetch some data here and start app
  #   # (by calling `super`) after that.
    super
    @started = true
    @router.stopHistory()
    Object.freeze? this
