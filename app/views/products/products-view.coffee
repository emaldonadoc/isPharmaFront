View = require 'views/base/view'
mediator = Chaplin.mediator
utils = require 'lib/utils'

module.exports = class ProductsView extends View
  autoRender: true
  container: 'main'
  template: require './templates/products'

  initialize: ->
    super
    $('#isp-home-link').show()
    @subscribeEvent 'change-company', @eventChangeCompany
    @delegate 'click', '.category-company', @selectCategory

  attach:->
    super
    $('main').fadeIn()

  eventChangeCompany:()->
    companySelected = mediator.data.get('company-selected')
    @model.set('company', companySelected)
    @model.set('categories', Chaplin.mediator.data.get('products')[companySelected])
    @render()


  selectCategory:(e)->
    e.preventDefault()
    e.stopPropagation()
    category = @$(e.currentTarget).parent().parent('.category-container').data('category')
    articles = @model.findArticlesByCategory(category)
    console.log("Articles found on model", articles);
    utils.redirectTo action: "articles", params: company:mediator.data.get('company-selected') ,category: category, articles:articles