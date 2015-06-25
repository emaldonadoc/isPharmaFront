HomeController = require 'controllers/home-controller'
NewsView = require 'views/news/news-view'
utils = require 'lib/utils'

module.exports = class NewsController extends HomeController

  beforeAction: ->
    super
    utils.cleanAndSetSelectedBar('news')

  index:->
    @view = new NewsView

