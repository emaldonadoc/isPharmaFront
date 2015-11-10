HomeController = require 'controllers/home-controller'
ProductsView = require 'views/products/products-view'
ProductsModel = require 'models/products/products'
utils = require 'lib/utils'
mediator = Chaplin.mediator

module.exports = class ProductsController extends HomeController

  beforeAction: ->
    super
    utils.cleanAndSetSelectedBar('products')

  index:()->
    companySelected = mediator.data.get('company-selected')
    if(companySelected)
      data =
        categories : Chaplin.mediator.data.get('products')[companySelected],
        company: companySelected
      @model = new ProductsModel(data)
      @view = new ProductsView model: @model
    else
      utils.redirectTo controller:"home", action:'index'