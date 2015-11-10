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

  attach:->
    super
    $('main').fadeIn()