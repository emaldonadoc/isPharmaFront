HomeController = require 'controllers/home-controller'
SearchView = require 'views/search/search-view'
SearchModel = require 'models/search/search'
utils = require 'lib/utils'

mediator = Chaplin.mediator

module.exports = class SearchController extends HomeController

  beforeAction:(params)->
    super
    @reuse 'rlx-search-view',
      compose: ->
        mediator.data.set 'rlx-search-composed', yes
        @model = new SearchModel(params)
        @view = new SearchView model:@model
      check: -> mediator.data.get 'rlx-search-composed'

  index:->
    console.log "Search controller"

