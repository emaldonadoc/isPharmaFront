View = require 'views/base/view'

module.exports = class ServicesView extends View
  autoRender: true
  container: 'main'
  template: require './templates/courses'

  initialize: ->
    super
    $('#isp-home-link').show()

  attach:->
    super
    $('main').fadeIn()