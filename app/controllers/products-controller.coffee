HomeController = require 'controllers/home-controller'
ProductsView = require 'views/products/products-view'
utils = require 'lib/utils'

mediator = Chaplin.mediator

module.exports = class ProductsController extends HomeController

  beforeAction: ->
    super
    utils.cleanAndSetSelectedBar('products')

  index:->
    @view = new ProductsView

