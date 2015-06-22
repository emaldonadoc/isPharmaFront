Controller = require 'controllers/base/controller'
MainView = require 'views/home/main-view'
MainModel = require 'models/home/home'
mediator = Chaplin.mediator

module.exports = class HomeController extends Controller

  beforeAction: ->
    super

  index:()->
    console.log "Index action"
    @model = new MainModel
    @view = new MainView model:@model