Controller = require 'controllers/base/controller'
utils = require 'lib/utils'
MainView = require 'views/home/main-view'

module.exports = class HomeController extends Controller

  beforeAction: ->
    super
    utils.cleanAndSetSelectedBar('home')

  index:()->
    @view = new MainView