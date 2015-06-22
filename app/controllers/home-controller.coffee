Controller = require 'controllers/base/controller'
HomePageView = require 'views/home/home-page-view'
HomeModel = require 'models/home/home'
mediator = Chaplin.mediator

module.exports = class HomeController extends Controller

  beforeAction: ->
    super

  index:()->
    console.log "Index action"
    @model = new HomeModel
    @view = new HomePageView model:@model