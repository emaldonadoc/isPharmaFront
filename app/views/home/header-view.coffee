View = require 'views/base/view'
utils = require 'lib/utils'
mediator = Chaplin.mediator

module.exports = class HeaderView extends View
  autoRender: true
  container: 'header'
  template: require './templates/header'

  initialize: ->
    super

  attach:()->
    super
    @setProductsJson()
    @delegate 'click', '.isp-courses-link', @redirectTabLink
    @delegate 'click', '.company-products', @showProductByCompany

  redirectTabLink:(e)->
    e.preventDefault()
    currentTarget = @$(e.currentTarget)
    route= currentTarget.data('route')
    subProductMenu = @$('#is-product-submenu')

    if(route is "products")
      subProductMenu.slideToggle()
    else unless(currentTarget.parent().hasClass('active'))
      $('main').fadeOut(
        complete: =>
          subProductMenu.slideToggle() if subProductMenu.is(':visible')
          utils.redirectTo controller:route, action:'index'
      )

  setProductsJson: ()->
    @model.getJsonProducts(context:@)
    .done((json)->mediator.data.set('products', json))

  showProductByCompany:(e)->
    e.preventDefault()
    e.stopPropagation()
    current = @$(e.currentTarget)
    @$('#is-product-submenu').slideToggle()
    mediator.data.set('company-selected',current.data('company'))
    @publishEvent('change-company')
    utils.onMobileHideMenu()
    utils.redirectTo controller:"products", action:'index'