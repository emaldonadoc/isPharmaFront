'use strict'
View = require 'views/base/view'
utils = require 'lib/utils'
mediator = Chaplin.mediator

module.exports = class MainView extends View
  autoRender: true
  container: 'main'
  template: require './templates/main'

  initialize: ->
    super
    @setProductsJson()
    $(@container).fadeIn()
    $('#isp-home-link').hide()

  attach: ->
    super
    $('.bxslider').bxSlider({auto:yes,pause:3000})


  setProductsJson: ()->
    @model.getJsonProducts(context:@)
    .done((json)->mediator.data.set('products', json))
    #use this option to local
    .always((data)->
      console.log("data ", data)
      mediator.data.set('products', data)
    )
