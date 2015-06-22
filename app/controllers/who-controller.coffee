HomeController = require 'controllers/home-controller'
WhoView = require 'views/who/who-view'
utils = require 'lib/utils'

mediator = Chaplin.mediator

module.exports = class CoursesController extends HomeController

  beforeAction: ->
    super
    utils.cleanAndSetSelectedBar('who')

  index:->
    console.log "Courses controller"
    @view = new WhoView

