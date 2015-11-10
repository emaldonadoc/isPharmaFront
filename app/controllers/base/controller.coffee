HeaderView = require 'views/home/header-view'
FooterView = require 'views/home/footer-view'
MainModel = require 'models/home/home'
mediator = Chaplin.mediator

module.exports = class Controller extends Chaplin.Controller
  # Reusabilities persist stuff between controllers.
  # You may also persist models etc.
  beforeAction: ->
    @reuse 'header',
      compose: ->
        mediator.data.set 'header', yes
        @model = new MainModel()
        @view = new HeaderView model: @model
      check: -> mediator.data.get 'header'
    @reuse 'footer', FooterView
