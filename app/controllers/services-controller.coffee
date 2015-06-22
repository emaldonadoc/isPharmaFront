HomeController = require 'controllers/home-controller'
ServicesView = require 'views/services/services-view'
utils = require 'lib/utils'

mediator = Chaplin.mediator

module.exports = class SearchController extends HomeController

  index:->
    console.log "Search controller"
    @view = new ServicesView

