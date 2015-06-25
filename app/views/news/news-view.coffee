View = require 'views/base/view'

module.exports = class NewsView extends View
  autoRender: true
  container: 'main'
  template: require './templates/news'

  initialize: ->
    super
    $('#isp-home-link').show()

  attach:->
    super
    $('main').fadeIn()