Application = require 'application'
routes = require 'routes'
mediator = Chaplin.mediator

# Initialize the application on DOM ready event.
$ ->
  mediator.data = (->
# Add additional application-specific properties and methods
# e.g. Chaplin.mediator.prop = null
    data =
      'services-url': '/bin/'

    get: (property)->
      data[property]
    set: (property, value)->
      data[property] = value
      return
    delete: (property) ->
      value = data[property]
      delete data[property]
      value
    clear: ->
      data = {}
      return
  )()

  appConfig =
    controllerSuffix: '-controller'
    pushState: no

  appConfig.routes = routes unless window.wbTestEnv
  new Application appConfig
