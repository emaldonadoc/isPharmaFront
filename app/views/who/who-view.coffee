View = require 'views/base/view'

module.exports = class WhoView extends View
  autoRender: true
  container: 'main'
  template: require './templates/who'

  initialize: ->
    super
    $('#isp-home-link').show()

  attach:->
    super
    $('main').fadeIn()