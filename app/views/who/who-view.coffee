View = require 'views/base/view'

module.exports = class WhoView extends View
  autoRender: true
  container: 'main'
  template: require './templates/who'

  initialize: ->
    super
    $('.navbar-header').show()

  attach:->
    super
    $('main').fadeIn()