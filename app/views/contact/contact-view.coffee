View = require 'views/base/view'

module.exports = class ContactView extends View
  autoRender: true
  container: 'main'
  template: require './templates/contact'

  initialize: ->
    super
    $('#isp-home-link').show()

  attach:->
    super
    $('main').fadeIn()