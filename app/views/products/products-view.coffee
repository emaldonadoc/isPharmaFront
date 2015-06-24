View = require 'views/base/view'

module.exports = class ProductsView extends View
  autoRender: true
  container: 'main'
  template: require './templates/products'

  initialize: ->
    super
    $('#isp-home-link').show()

  attach:->
    super
    $('main').fadeIn()