Controller = require 'controllers/base/controller'
utils = require 'lib/utils'
MainView = require 'views/home/main-view'
MainModel = require 'models/home/home'
mediator = Chaplin.mediator

module.exports = class HomeController extends Controller

  beforeAction: ->
    super
    utils.cleanAndSetSelectedBar('home')


  index:()->
    console.log "Index action"
    @model = new MainModel
    @view = new MainView model:@model