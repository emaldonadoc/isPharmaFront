Controller = require 'controllers/base/controller'
HomePageView = require 'views/home/home-page-view'
HomeModel = require 'models/home/home'
AlertModalView = require 'views/alert-modal/alert-modal-view'
AlertModalModel = require 'models/alert-modal/alert-modal'
SelectDriverModalView = require 'views/select-driver-modal/select-driver-modal-view'
SelectDriverModalModel = require 'models/select-driver-modal/select-driver-modal'
mediator = Chaplin.mediator

module.exports = class HomeController extends Controller

  beforeAction: ->
    super


  index:()->
    console.log "Index action"
    @model = new HomeModel
    @view = new HomePageView model:@model

  alert:(params) ->
    console.log "Alert action"
    @model = new AlertModalModel params
    @view = new AlertModalView  model: @model

  selectDriver:(params) ->
    console.log "Select driver action"
    @model = new SelectDriverModalModel params
    @view = new SelectDriverModalView model: @model
