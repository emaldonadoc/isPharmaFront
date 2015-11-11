View = require 'views/base/view'
utils = require 'lib/utils'
mediator = Chaplin.mediator

module.exports = class ArtlcesView extends View
  autoRender: true
  container: 'main'
  template: require './templates/articles'

  initialize: ->
    super
    $('#isp-home-link').show()
    @delegate 'click', '#isp-back-to-products', @backToProducts

  attach:->
    super
    $('main').fadeIn()

  backToProducts:(e)->
    e.preventDefault()
    utils.redirectTo controller:"products", action:'index'