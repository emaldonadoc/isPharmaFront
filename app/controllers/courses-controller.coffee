HomeController = require 'controllers/home-controller'
CoursesView = require 'views/courses/courses-view'
utils = require 'lib/utils'

mediator = Chaplin.mediator

module.exports = class SearchController extends HomeController

  index:->
    console.log "Courses controller"
    @view = new CoursesView

